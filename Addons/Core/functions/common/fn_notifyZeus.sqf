/* ----------------------------------------------------------------------------
Function: vs_core_fnc_notifyZeus

Description:
	Show Zeus Notification along with an appropriate sound effect.

Parameters:
	0: _message - Message to show along the top of the Zeus interface <STRING>
	1: _type - Type of message (can be info, warning or error) <STRING>

Returns:
	Nothing

Examples:
	["Player has respawned", "warning"] call vs_core_fnc_notifyZeus;
	[["Player has died", "and another may afterwards"], "warning"] call vs_core_fnc_notifyZeus;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_message", "", ["", []]], ["_type", "info", [""]]];

if (!(player call vs_core_fnc_isCurator)) exitWith {};

if (typeName _message == "ARRAY" && count _message > 1) then {
	_message = format _message;
};

[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;

if (_type == "warning") then {
	playSound "3DEN_notificationWarning";
};

if (_type == "error") then {
	playSound "FD_Start_F";
};
