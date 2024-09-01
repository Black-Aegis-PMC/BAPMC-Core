/* ----------------------------------------------------------------------------
Function: vs_core_fnc_setRespawnTimer

Description:
	Set the respawn timer CBA Setting.

Parameters:
	0: _time - Time in seconds to set to <NUMBER>

Returns:
	Nothing

Examples:
	[134] call vs_core_fnc_setRespawnTimer;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_time", 0, [0]]];

[
	"cba_settings_setSettingMission",
	[
		"vs_core_respawn_timer",
		_time,
		1 // Priority
	],
	"vs_core_respawn_timer_event" // Event ID, must be unique
] call CBA_fnc_globalEventJIP;

[format["Respawn timer set to %1", [_time, "M:SS"] call CBA_fnc_formatElapsedTime]] call vs_core_fnc_notifyZeus;
[format["Respawn timer set to %1", [_time, "M:SS"] call CBA_fnc_formatElapsedTime], "core\functions\common\fn_setRespawnTimer.sqf"] call vs_core_fnc_log;
