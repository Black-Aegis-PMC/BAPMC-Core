#include "constants.h"
params ["_unit"];
_veh = vehicle _unit;

if (!isNull (_veh getVariable [USAF_AP_GS_PILOT_VAR,objNull])) exitWith { systemChat "pilot already present!"; };


_isEngineOn = isEngineOn _veh; //store this for later, as when moving from units causes engine to turn off
_driver = driver _veh;

//move driver to some free spot in the vehicle if there is a driver present
if !(isNull(_driver)) then {
	//find free turret first if possible
	_allEmptyturrets = [];
	{
		if (isNull(_veh turretUnit _x)) then { _allEmptyturrets pushBack _x; };
	}forEach (allTurrets [_veh, true]);

	_currentHighestVal = -1;
	_turretFree = [-1];

	{
		_turretPath = [_veh, _x] call BIS_fnc_turretConfig;
		_turretPrimaryGunVal = getNumber(_turretPath >> "primaryGunner");
		_turretPrimaryObsVal = getNumber(_turretPath >> "primaryObserver");
		_num = -1;
		if (_turretPrimaryGunVal > 0) then {
			_num = (_turretPrimaryGunVal + 10);
		} else {
			if (_turretPrimaryObsVal > 0) then {
				_num = _turretPrimaryObsVal;
			};
		};

		if ((_num > _currentHighestVal) || (_forEachIndex isEqualTo 0)) then {
			_currentHighestVal = _num;
			_turretFree = _x;
		};
	}forEach _allEmptyturrets;

	_prevCommander = effectiveCommander _veh;

	if ((count _allEmptyturrets > 0) && (count _turretFree > 0)) then {
		[_driver, _veh, _turretFree] remoteExecCall ["USAF_AC130_AP_GS_fnc_moveUnitRemote", _driver];
	} else {
		if ((_veh emptyPositions "cargo") <= 0) exitWith { systemChat "no room to add autopilot to aircraft!"; };
		[_driver, _veh] remoteExecCall ["USAF_AC130_AP_GS_fnc_moveUnitRemote", _driver];
	};
};

_prevDiagTick = diag_tickTime;
//wait 2 seconds to see if driver has swapped out or not as the call may have been remoted
waitUntil {(diag_tickTime > (_prevDiagTick + 2)) || !((driver _veh) isEqualTo _driver)};

if ((driver _veh) isEqualTo _driver) exitWith { [false] call USAF_AC130_AP_GS_fnc_enableAP; };

//create pilot
private _pilotSide = getNumber ((configOf _veh) >> "side");
private _pilotType = ["O_Pilot_F", "B_Pilot_F", "BAPMC_Pilot"] select (_pilotSide); // sides: 0-opfor, 1-blufor, 2-indfor, 3-civ
_grp = createGroup [side _unit, true];
_pilot = _grp createUnit [_pilotType , [0,0,0], [], 0, "NONE"];
_pilot moveInDriver _veh;
_pilot assignAsDriver _veh;
_veh setVariable [USAF_AP_GS_PILOT_VAR, _pilot, true];

_grp setBehaviour "CARELESS";
_grp setCombatMode "YELLOW";

_veh setCollisionLight false;
_pilot disableAI "LIGHTS";

_pilot disableAI "AUTOCOMBAT";
_pilot disableAI "AUTOTARGET";
_pilot disableAI "TARGET";
_pilot disableAI "COVER";
_pilot disableAI "SUPPRESSION";
_pilot disableAI "FSM";
_pilot disableAI "WEAPONAIM";
//_speed = _veh getVariable [USAF_AP_WP_SPEED_VAR, "NORMAL"];
//_grp setSpeedMode _speed;

//for some reason the ai will shut the engine off
if (_isEngineOn) then {
	_veh engineOn _isEngineOn;
};

_pos = _veh getVariable [USAF_AP_WP_POS_VAR, []];

if (count _pos < 1) then {
	_pos = position _veh;
	_veh setVariable [USAF_AP_WP_POS_VAR, _pos, true];

	//no marker is present, create one at the new loiter waypoint which is current veh pos
	if ((getMarkerColor USAF_AP_GS_TEMP_MKR_CIRC) isEqualTo "") then {
		createMarkerLocal [USAF_AP_GS_TEMP_MKR_CIRC, _pos];
		USAF_AP_GS_TEMP_MKR_CIRC setMarkerShapeLocal "ELLIPSE";
		USAF_AP_GS_TEMP_MKR_CIRC setMarkerBrushLocal "Border";
		_sizeMkr = _veh getVariable [USAF_AP_WP_RAD_VAR, USAF_AP_WP_RAD_DEFAULT];
		USAF_AP_GS_TEMP_MKR_CIRC setMarkerSizeLocal [_sizeMkr, _sizeMkr];

		createMarkerLocal [USAF_AP_GS_TEMP_MKR_CENT, _pos];
		USAF_AP_GS_TEMP_MKR_CENT setMarkerTypeLocal "hd_dot";
		USAF_AP_GS_TEMP_MKR_CENT setMarkerTextLocal "Target Centre";
	};
};

[_veh] spawn USAF_AC130_AP_GS_fnc_createWaypoint;
[_veh, (_veh getVariable [USAF_AP_WP_ALT_VAR, USAF_AP_WP_ALT_DEFAULT])] call USAF_AC130_AP_GS_fnc_setAlt;
//_radius = _veh getVariable [USAF_AP_WP_RAD_VAR, USAF_AP_WP_RAD_DEFAULT];

while {!isNull (_pilot)} do {
	if (_pilot != driver _veh) exitWith {
		[false] call USAF_AC130_AP_GS_fnc_enableAP;
		systemChat "AP OFF";
	};
	//this is only because when you change waypoints the height resets I create a new waypoint,
	//i tried to make this exec after waypoint creation but that didn't work so i guess ill go fuck myself
	_height = _veh getVariable [USAF_AP_WP_ALT_VAR, USAF_AP_WP_ALT_DEFAULT];
	[_veh,_height] spawn USAF_AC130_AP_GS_fnc_setAlt;

	sleep 2;
};
