/* ----------------------------------------------------------------------------
Function: vs_core_fnc_addBarracks

Description:
	Adds filtered Arsenal, and other Black Aegis - PMC functions such as "Full Heal", etc.
	to an object.

Parameters:
	0: _position - of the module <ARRAY>
	1: _objectUnderCursor - object the module was placed on <OBJECT>

Returns:
	Nothing

Examples:
	[_position, _objectUnderCursor] call vs_core_fnc_addBarracks;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull, []]]];

private _objects = _objectUnderCursor;
if (_objects isEqualType objNull) then {
	_objects = [_objects];
};


// Show Filter Dialog
private _availableFilters = [
	"",
	"standard",
	"mission"
];

private _availableFilterNames = [
	["Full", "Unlimited Arsenal!"],
	["Standard", "All Camo Black Aegis - PMC equipment"],
	"Mission"
];

private _arsenalObjects = [vs_core_arsenal_objects, true] call vs_core_fnc_strToArray;

private _dialogOptions = [["COMBO", "Filter", [_availableFilters, _availableFilterNames]]];
private _dialogParameters = [["_filter", ""]];

if (isNull (_objects select 0)) then {
	_dialogOptions = [[
		"COMBO",
		"Select object to spawn",
		[
			_arsenalObjects,
			(_arsenalObjects apply {getText (configfile >> "CfgVehicles" >> _x >> "displayName")})
		]
	]] + _dialogOptions;

	_dialogParameters = [["_arsenalObject", ""]] + _dialogParameters;
};


// Add Full Heal?
_dialogOptions = _dialogOptions + [["CHECKBOX", "Add Full Heal?", false]];
_dialogParameters = _dialogParameters + [["_hasFullHeal", false]];


// Add Spectator?
_dialogOptions = _dialogOptions + [["CHECKBOX", "Add Spectator?", false]];
_dialogParameters = _dialogParameters + [["_hasSpectator", false]];

[format["Dialog Settings: %1, Dialog Controls: %2, Obj: %3", _dialogOptions, _dialogParameters, _objects], "core\functions\zeus_modules\fn_addBarracks.sqf"] call vs_core_fnc_log;
["Add Filtered Arsenal", _dialogOptions, {
	(_this select 1) params ["_objects", "_position", "_dialogParameters"];
	(_this select 0) params _dialogParameters;

	// Check if module placed on an object
	if (isNull (_objects select 0)) then {
		// Object selected to be spawned
		private _object = _arsenalObject createVehicle _position;
		[format["Object: %1, Chosen Object: %2", _object, _arsenalObject], "core\functions\zeus_modules\fn_addBarracks.sqf"] call vs_core_fnc_log;

		["zen_common_addObjects", [[_object], _curator]] call CBA_fnc_serverEvent;
		_objects = [_object];
	};


	// Give server the object, so that everything in future can be applied to the object locally
	if (!isServer) then {
		{
			if (_x setOwner 2) then {
				[format["Changed ownership of %1 to %2", _x, owner _x], "core\functions\zeus_modules\fn_addBarracks.sqf"] call vs_core_fnc_log;
			} else {
				[format["Could not change ownership of %1 to %2", _x, owner _x], "core\functions\zeus_modules\fn_addBarracks.sqf"] call vs_core_fnc_log;
			};
		} foreach _objects;
	};


	// Add Arsenal
	[_filter, _objects] remoteExec ["vs_core_fnc_arsenal", 2];

	// Wait for the arsenal to initialize
	[] spawn {
	    sleep 1; // Adjust the wait duration as needed

	    // Apply the limit to all players
	    {
	        [_x] remoteExec ["vs_core_fnc_camoArsenal", _x]; // Executes on each client's machine
	    } forEach allPlayers;
	};

	if (_hasFullHeal) then {
		[_objects] remoteExec ["vs_core_fnc_fullHeal", 2];
	};

	if (_hasSpectator) then {
		{
			[[_x], {[_this select 0] call vs_core_fnc_addSpectator;}] remoteExec ["BIS_fnc_call", 0, _x];
		} foreach _objects;
	};

	// Show Message
	["Barracks functions added!"] call vs_core_fnc_notifyZeus;
}, {}, [_objects, _position, _dialogParameters]] call zen_dialog_fnc_create;
