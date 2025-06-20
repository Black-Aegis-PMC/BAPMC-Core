["AIQD_maxDistance", "SLIDER", ["Max detecting distance", ""], "AIQD Settings", [0, 10000, 1250, 0]] call CBA_fnc_addSetting;
["AIQD_enabled", "CHECKBOX", ["Enable", ""], "AIQD Settings", true] call CBA_fnc_addSetting;

["cameraView", { 
    params ["_player", "_view"]; 

    private _enabled = missionNamespace getVariable ["AIQD_enabled", true];

    if !(_enabled) exitWith {};
    if !(isPlayer _player) exitWith {}; 
 
    private _uav = getConnectedUAV _player; 
 
    if ((_view == "GUNNER") and {!isNull _uav}) then { 
        [_player, _uav] call DB_AIQD_fnc_findAndDrawTargets; // draw 
    } 
    else { 
        [_player] call DB_AIQD_fnc_cancelDrawTargets; // cancel drawing 
    }; 
}] call CBA_fnc_addPlayerEventHandler;