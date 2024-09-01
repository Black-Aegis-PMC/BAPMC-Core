/* ----------------------------------------------------------------------------
Function: vs_core_fnc_Arsenal

Description:
	Adds a custom ACE arsenal to the object in question. Object MUST be local
	to the server.

	To find the array for the filter:
		1: Go into the editor
		2: Place object and edit its ACE Arsenal attribute
		3: Set the desired objects to infinite
		4: Export the FULL variables from it
		5: Paste the resultant string into ..\arsenalFilters.hpp under its own
		   item in the `_arsenalFilters` array

Parameters:
	0: _filter - Filter which controls what objects are shown in the
				 arsenal <STRING>
	1: _objects - single or multiple objects to apply the arsenal to <OBJECT|ARRAY>

Returns:
	Nothing

Examples:
	["WEST", [car_1,car_2]] call vs_core_fnc_Arsenal;

	["WEST", player] call vs_core_fnc_Arsenal;

	["WEST"] call vs_core_fnc_Arsenal;

	[] call vs_core_fnc_Arsenal;

Author:
	Ford
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_filter", "", [""]], ["_objects", ObjNull, [objNull, []]]];

if (_objects isEqualTo []) exitWith {
	[format["Failed to apply %1 Arsenal: No object given! %2", _filter, _objects], "core\functions\common\fn_arsenal.sqf"] call vs_core_fnc_log;
};

if (_objects isEqualTo objNull) then {
	_objects = this;
};

if (typeName _objects != "ARRAY") then {
	_objects = [_objects];
};

private _whitelist = [_filter] call vs_core_fnc_getArsenalFilter;

{
	[_x, true] call ace_arsenal_fnc_removeBox;
	[_x, [], true] call ace_arsenal_fnc_initBox;
	[_x, _whitelist, true] call ace_arsenal_fnc_addVirtualItems;
	[format["Added %1 filtered arsenal to %2", _filter, _x], "core\functions\common\fn_arsenal.sqf"] call vs_core_fnc_log;
} forEach _objects;
