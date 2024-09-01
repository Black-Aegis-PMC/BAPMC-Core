/* ----------------------------------------------------------------------------
Function: vs_core_fnc_addMusicRadio

Description:
	Adds music radio from KLPQ to the backpack or to the vehicle, depending on
	what the module was placed over.

Parameters:
	0: _position - of the module <ARRAY>
	1: _objectUnderCursor - object the module was placed on <OBJECT>

Returns:
	Nothing

Examples:
	[_position, _objectUnderCursor] call vs_core_fnc_addMusicRadio;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

private _objects = [_objectUnderCursor];

// Check if module placed on an object
if (isNull (_objects select 0)) then {
	_objects = [localize "STR_AMAE_OBJECTS"] call Achilles_fnc_SelectUnits;
	if (_objects isEqualTo []) exitWith {[localize "STR_AMAE_NO_OBJECT_SELECTED", "error"] call vs_core_fnc_notifyZeus};
};

{
	if (_x isKindOf "Man") then {
		[_x] remoteExec ["klpq_musicRadio_fnc_addBackpackRadio", 0];
	} else {
		[_x, false] remoteExec ["klpq_musicRadio_fnc_addRadio", 0, true];
	}
} foreach _objects;

if (_objects isEqualTo []) exitWith {[localize "STR_AMAE_NO_OBJECT_SELECTED", "error"] call vs_core_fnc_notifyZeus};

[format ["Added music radio to %1", _objects], "core\functions\zeus_modules\fn_addMusicRadio.sqf"] call vs_core_fnc_log;

// Show Message
["Music Radio added!"] call vs_core_fnc_notifyZeus;
