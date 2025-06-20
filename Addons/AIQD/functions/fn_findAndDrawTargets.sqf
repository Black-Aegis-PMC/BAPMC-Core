#define GRID_W( num ) ( num * ( pixelGridNoUIScale * pixelW * 2 ))
#define GRID_H( num ) ( num * ( pixelGridNoUIScale * pixelH * 2 ))

params [["_player", missionNamespace getVariable ['bis_fnc_moduleRemoteControl_unit', player]], ["_uav", objNull]];

private _fn_checkVisibility = {
    params ["_target", "_viewer"];

    private _startPos = getPosWorldVisual _viewer;
    private _endPos = getPosWorldVisual _target;

    private _visibilityFactor = [_viewer, "VIEW"] checkVisibility [_startPos, _endPos];

    private _fog = fogParams select 0;
    private _timeFactor = sunOrMoon;
    private _visionModeGunner = currentVisionMode (gunner _viewer);
    private _visionModeDriver = currentVisionMode (driver _viewer);
    private _usingNVG = (_visionModeGunner == 1) || (_visionModeDriver == 1);
    private _usingThermal = (_visionModeGunner == 2) || (_visionModeDriver == 2);

    if (_fog > 0.1) then {
        _visibilityFactor = _visibilityFactor * (1 - _fog);
    };

    if (!_usingNVG && !_usingThermal) then {
        _visibilityFactor = _visibilityFactor * _timeFactor;
    };

    if (_usingNVG) then {
        if (_timeFactor > 0.5) then {
            _visibilityFactor = 0;
        } else {
            _visibilityFactor = (_visibilityFactor + 0.5) min 1.0;
        };
    };

    if (_usingThermal) then {
        _visibilityFactor = 1 min (_visibilityFactor + 0.5);
    };

    _visibilityFactor;
};

private _fn_findTargets = {
    params ["_uav"];

    private _fn_checkVisibility = missionNamespace getVariable ["DB_AIQD_fnc_checkVisibility", {}];
    private _targets = (_uav nearEntities [["Air", "Car", "Motorcycle", "Tank"], missionNamespace getVariable ["AIQD_maxDistance", 1250]]) - [_uav];

    if (_targets isEqualTo []) exitWith {};

    _targets = _targets select {
        (alive _x) &&
        !(isobjecthidden _x) &&
        ([_x, _uav] call _fn_checkVisibility) >= 0.5
    };

    if (_targets isEqualTo []) exitWith {};

    _targets;
};

private _fn_drawTargets = {
    params ["_targets"];

    private _controls = uiNameSpace getVariable ["DB_uavAiTargets_controlsList", []];

    _controls apply { ctrlDelete _x };

    {
        private _target = _x;

        private _boundingBox = boundingBoxReal _target;

        _x1 = (_boundingBox #0) #0;
        _y1 = (_boundingBox #0) #1;
        _z1 = (_boundingBox #0) #2;
        _x2 = (_boundingBox #1) #0;
        _y2 = (_boundingBox #1) #1;
        _z2 = (_boundingBox #1) #2;

        _vR1 = worldToScreen (_target modelToWorldVisual [_x1,_y1,_z1]);
        _vR2 = worldToScreen (_target modelToWorldVisual [_x2,_y1,_z1]);
        _vR3 = worldToScreen (_target modelToWorldVisual [_x2,_y1,_z2]);
        _vR4 = worldToScreen (_target modelToWorldVisual [_x1,_y1,_z2]);
        _vR5 = worldToScreen (_target modelToWorldVisual [_x2,_y2,_z2]);
        _vR6 = worldToScreen (_target modelToWorldVisual [_x1,_y2,_z2]);
        _vR7 = worldToScreen (_target modelToWorldVisual [_x1,_y2,_z1]);
        _vR8 = worldToScreen (_target modelToWorldVisual [_x2,_y2,_z1]);

        if ({ count _x == 2 } count [_vR1, _vR2, _vR3, _vR4, _vR5, _vR6, _vR7, _vR8] == 8) then {
            _xC = [_vR1 #0, _vR2 #0, _vR3 #0, _vR4 #0, _vR5 #0, _vR6 #0, _vR7 #0, _vR8 #0];
            _yC = [_vR1 #1, _vR2 #1, _vR3 #1, _vR4 #1, _vR5 #1, _vR6 #1, _vR7 #1, _vR8 #1];
        
            _xMin = selectMin _xC;
            _yMin = selectMin _yC;

            _xMax = selectMax _xC;
            _yMax = selectMax _yC;

            private _targetPicture = findDisplay 46 ctrlCreate ["ctrlStaticPicture", -1];
            _targetPicture ctrlSetText "\AIQD\pictures\pramouq.paa";
            _targetPicture ctrlSetPosition [_xMin, _yMin, abs(_xMax - _xMin), abs(_yMax - _yMin)];
            _targetPicture ctrlCommit 0;

            _controls pushBack _targetPicture;
        };
    } forEach _targets;

    private _chance = 0.005; // 0.5% 

    if (random 1 <= _chance) then {
        private _xRand =  random safeZoneXAbs;
        private _yRand =  random safezoneY;
        private _wRand =  0.1 + random 0.2;
        private _hRand =  0.1 + random 0.2;

        private _fakePicture = findDisplay 46 ctrlCreate ["ctrlStaticPicture", -1];
        _fakePicture ctrlSetText "\AIQD\pictures\pramouq.paa";
        _fakePicture ctrlSetPosition [_xRand, _yRand, _wRand, _hRand];
        _fakePicture ctrlCommit 0;

        _controls pushBack _fakePicture;
    };

    uiNameSpace setVariable ["DB_uavAiTargets_controlsList", _controls]
};

missionNamespace setVariable ["DB_AIQD_fnc_checkVisibility", _fn_checkVisibility];
missionNamespace setVariable ["DB_AIQD_fnc_findTargets", _fn_findTargets];
missionNamespace setVariable ["DB_AIQD_fnc_drawTargets", _fn_drawTargets];

private _id = [
    {
        (_this # 0) params ["_uav", "_player"];

        private _enabled = missionNamespace getVariable ["AIQD_enabled", true];

        if !(_enabled) exitWith {
            [_player] call DB_AIQD_fnc_cancelDrawTargets;
        };

        private _fn_findTargets = missionNamespace getVariable ["DB_AIQD_fnc_findTargets", {}];
        private _fn_drawTargets = missionNamespace getVariable ["DB_AIQD_fnc_drawTargets", {}];

        private _targets = [_uav] call _fn_findTargets;
        

        if (_targets isEqualTo []) exitWith {};

        [_targets] call _fn_drawTargets;
    }, 
    0, 
    [_uav]
] call CBA_fnc_addPerFrameHandler;

_player setVariable ["DB_uavAiTargets_pfhID", _id];