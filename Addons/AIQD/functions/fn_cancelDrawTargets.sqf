params ["_player"];

private _id = _player getVariable ["DB_uavAiTargets_pfhID", -1];
[_id] call CBA_fnc_removePerFrameHandler;

(uiNameSpace getVariable ["DB_uavAiTargets_controlsList", []]) apply { ctrlDelete _x };