/*
    lxRF_fnc_RC40_attack

    author: Hayashi POLPOX Takeyuki

    initializes RC40's scripted "kamikaze" attack

    Arguments:
        0: Object - either shooter unit or RC40 unit
        1: Array or Object - target position or target object

    Returns:
        Nothing

    Note:
        The script will abort if:
            - the unit has no RC40
            - the unit has no compatible weapon to fire it
            - the unit failed to aim upwards
            - the unit's group behaviour is either SAFE or CARELESS (for an unknown reason, both won't work)

        The script will print logs into RPT when an unit is firing.
*/
// todo confirm it does work on launcher and pistol weapons
params ["_source","_target"] ;

if (!local _source) exitWith {
    diag_log format ["[lxRF_fnc_RC40_attack] %1: failed due to using non-local object",_source] ;
} ;

// if the given source is a soldier
if (_source isKindOf "CAManBase") exitWith {

    // well for an unknown reason (engine issue though) we can't use it on either of behaviour
    if (behaviour _source == "SAFE" or behaviour _source == "CARELESS") exitWith {
        diag_log format ["[lxRF_fnc_RC40_attack] %1: failed due for being behaviour either SAFE or CARELSS",_source] ;
    } ;

    // get all possible locations where RC40 can be stored
    private _magazines = call {
        private _return = getUnitLoadout _source ;
        [
            call {
                if (count (_return#0) != 0) then {
                    [_return#0#5,_return#0#6]
                } else {
                    []
                } ;
            },
            call {
                if (count (_return#1) != 0) then {
                    [_return#1#5,_return#1#6]
                } else {
                    []
                } ;
            },
            call {
                if (count (_return#2) != 0) then {
                    [_return#2#5,_return#2#6]
                } else {
                    []
                } ;
            },
            call {
                if (count (_return#3) != 0) then {
                    getUnitLoadout _source#3#1 apply {_x#0}
                } else {
                    []
                } ;
            },
            call {
                if (count (_return#4) != 0) then {
                    getUnitLoadout _source#4#1 apply {_x#0}
                } else {
                    []
                } ;
            },
            call {
                if (count (_return#5) != 0) then {
                    getUnitLoadout _source#5#1 apply {_x#0}
                } else {
                    []
                } ;
            }
        ]
    } ;
    diag_log format ["[lxRF_fnc_RC40_attack] %1: fire started",_source] ;

    if !("1Rnd_RC40_HE_shell_RF" in flatten _magazines) exitWith {
        diag_log "[lxRF_fnc_RC40_attack] Unit fire ended: the unit has no compatible magazine" ;
    } ;    // exit if the soldier doesn't have an RC40 HE

    private _muzzles = _source weaponsInfo [""] ;
    private _compatibleMuzzle = _muzzles findIf {"1Rnd_RC40_HE_shell_RF" in compatibleMagazines [_x#2,_x#3]} ;
    if (_compatibleMuzzle == -1) exitWith {
        diag_log format ["[lxRF_fnc_RC40_attack] %1: fire ended: the unit has no compatible weapon",_source] ;
    } ;    // exit if the soldier doesn't have a compatible weapon/muzzle

    // select the compatible weapon and reload the RC40
    _source selectWeapon [_muzzles#_compatibleMuzzle#2,_muzzles#_compatibleMuzzle#3,_muzzles#_compatibleMuzzle#4] ;

    // create a dummy target to aim upwards
    private _dummyTarget = createVehicleLocal ["Land_Photos_V1_F",[0,0,0],[],0,"CAN_COLLIDE"] ;
    _dummyTarget enableSimulation false ;
    _dummyTarget hideObject true ;
    _dummyTarget setPosWorld (_source modelToWorldWorld [0,10,7]) ;

    // halt!
    _source disableAI "MOVE" ;

    // execute the firing sequence
    [_source,_dummyTarget,_target,_muzzles#_compatibleMuzzle#3,call {
        private _weapon = (_muzzles#_compatibleMuzzle#2) ;
        getNumber (configFile >> "CfgWeapons" >> _weapon >> "type")
    }] spawn {
        params ["_source","_dummyTarget","_target","_weapon","_weaponType"] ;
        // make the unit upright and aim anyways
        /*_source playMove call {
            if (_weaponType == 1) then {"AmovPercMstpSrasWrflDnon"} ;
            if (_weaponType == 2) then {"AmovPercMstpSrasWpstDnon"} ;
            if (_weaponType == 4) then {"AmovPercMstpSrasWlnrDnon"} ;
        } ;*/
		_source setUnitPos"UP";
        diag_log format ["[lxRF_fnc_RC40_attack] %1: fire progress: aim started",_source] ;
        _source reload [_weapon, "1Rnd_RC40_HE_shell_RF"] ;

        private _timeNow = time ;
        waitUntil {
            // aim at dummy target
            _source reveal [_dummyTarget,4] ;
            _source doTarget _dummyTarget ;
            sleep 0.03 ;
            // make sure he is aiming upwards and he's not reloading
            private _weaponDirection = (_source weaponDirection currentWeapon _source) ;
            (
                (atan (_weaponDirection#2)) > 10 and
                (gestureState _source == "<none>") and
                getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _source >> "disableWeapons") == 0
            ) or (time - _timeNow > 5)
        } ;
        // timeout if it doesn't meet the condition, not to stack the unit
        if (time - _timeNow > 5) exitWith {
            _source enableAI "MOVE" ;
            deleteVehicle _dummyTarget ;
            _source doWatch objNull ;
            diag_log format ["[lxRF_fnc_RC40_attack] %1: fire ended: aim failed, timeout and exit",_source] ;
        } ;

        sleep 0.4 ;
        // make sure the reload is finished
        waitUntil {(_source weaponState _weapon)#6 == 0} ;
        sleep 0.2 ;
        [_source,_weapon] call BIS_fnc_fire ;
        [_source,"lxRF_RC40_deploy_fired",{
            params ["_rc40","_source"] ;
            [_source,"lxRF_RC40_deploy_fired",_thisScriptedEventHandler] call BIS_fnc_removeScriptedEventHandler ;
            private _target = _source getVariable ["lxRF_fnc_RC40_attack_target",objNull] ;
            [_rc40,_target] call lxRF_fnc_RC40_attack ;
            diag_log format ["[lxRF_fnc_RC40_attack] %1: fire progress: RC40 successfully deployed",_source] ;
        }] call BIS_fnc_addScriptedEventHandler;
        _source setVariable ["lxRF_fnc_RC40_attack_target",_target] ;
        sleep 0.7 ;
        _source enableAI "MOVE" ;
        deleteVehicle _dummyTarget ;
        _source doWatch objNull ;
		_source setUnitPos"AUTO";
        diag_log format ["[lxRF_fnc_RC40_attack] %1: fire ended: function successfully ended",_source] ;
    } ;
} ;

private _EH = addMissionEventHandler ["EachFrame",{
    // skip if the game is paused
    if (isGamePaused or accTime == 0) exitWith {} ;
    _thisArgs params ["_timeNow","_velocity","_angular","_targetMode"] ;
    missionNamespace getVariable [format ["lxRF_RC40attack_%1",_thisEventHandler],[]] params [
        ["_source",objNull],
        ["_target",[0,0,0]]
    ] ;

    // remove EH if RC40 is no longer alive or exist
    if (isNull _source or !alive _source) exitWith {
        removeMissionEventHandler ["EachFrame",_thisEventHandler] ;
    } ;
    private _pos = getPosASL _source ;

    // if the RC40 is closer enough to the target position, execute it anyways
    if (_target isEqualType [] and (_pos distance _target < 0.5)) exitWith {
        [_source,"Explode"] call lxRF_fnc_RC40 ;
    } ;


    _source setVelocity call {
        // get the destination
        private _tgtPos = call {
            if (_targetMode) then {
                // if the given target is an object
                (
                    getPosASL _target vectorAdd
                    (velocity _target vectorMultiply (0.3 * (_source distance _target)/7))    // roughly take the speed into the count
                ) ;
            } else {
                // if the given target is a position
                _target
            } ;
        } ;

        // make the smooth transition between the start velocity and goal velocity
        vectorLinearConversion [
            _timeNow,
            _timeNow + 2,
            time,
            _velocity,
            (vectorNormalized (_tgtPos vectorDiff _pos)) vectorMultiply 17,
            true
        ] ;
    } ;
    _source setAngularVelocityModelSpace call {
        // get the destination
        private _tgtPos = call {
            if (_targetMode) then {
                // if the given target is an object
                (
                    getPosASL _target vectorAdd
                    [0,0,-((_source distance _target)/15)] vectorAdd    // stupid workaround to make the RC40 slightly face downwards
                    (velocity _target vectorMultiply (0.3 * (_source distance _target)/7))    // roughly take the speed into the count
                ) ;
            } else {
                // if the given target is a position
                _target
            } ;
        } ;

        private _ang = (vectorNormalized (vectorNormalized (_source worldToModel ASLToAGL _tgtPos))) vectorMultiply 7.5 ;
        _source call BIS_fnc_getPitchBank params ["","_bank"] ;

        // make the smooth transition between the start angular and goal angular
        vectorLinearConversion [
            _timeNow,
            _timeNow + 2,
            time,
            _angular,
            [(_ang#2)*-1,_bank*0.5,_ang#0],
            true
        ] ;
    } ;
},[
    time,
    velocity _source,
    angularVelocity _source,
    _target isEqualType objNull
]] ;
missionNamespace setVariable [format ["lxRF_RC40attack_%1",_EH],[_source,_target]] ;