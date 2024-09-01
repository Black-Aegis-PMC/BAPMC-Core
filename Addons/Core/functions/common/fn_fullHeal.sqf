/* ----------------------------------------------------------------------------
Function: vs_core_fnc_fullHeal

Description:
	Adds a full heal ACE interaction to the object in question.

Parameters:
	0: _objects - single or multiple objects to apply the
	full heal function to <OBJECT|ARRAY>

Returns:
	Nothing

Examples:
	[[car_1,car_2]] call vs_core_fnc_fullHeal;

	[player] call vs_core_fnc_fullHeal;

	[] call vs_core_fnc_fullHeal;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_objects", ObjNull, [objNull, []]]];

if (_objects isEqualTo []) exitWith {
	[format["Failed to apply Full Heal: No objects given! %1", _objects], "core\functions\common\fn_fullHeal.sqf"] call vs_core_fnc_log;
};

if (_objects isEqualTo objNull) then {
	_objects = this;
};

if (_objects isEqualType objNull) then {
	_objects = [_objects];
};

{
	[[_x], {[_this select 0] call vs_core_fnc_addFullHeal;}] remoteExec ["BIS_fnc_call", 0, _x];
} foreach _objects;
