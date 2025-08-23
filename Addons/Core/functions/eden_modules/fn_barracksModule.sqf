/* ----------------------------------------------------------------------------
Function: vs_core_fnc_barracksModule

Description:
	Adds support functions to synced objects.

Parameters:
	0: _logic - of the module <OBJECT>
	1: _objects - synced to the module <ARRAY>

Returns:
	true

Examples:
	[_logic, _objects] call vs_core_fnc_barracksModule;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_logic", objNull, [objNull]], ["_objects", [], [[]]]];
[format["_logic: %1 :: _objects:", _logic, _objects], "core\functions\eden_modules\fn_barracksModule.sqf"] call vs_core_fnc_log;

if (_objects isEqualTo []) exitWith {
	[format["Module Error: No objects synced! %1", _objects], "core\functions\eden_modules\fn_barracksModule.sqf"] call vs_core_fnc_log;
};

if (!isServer) exitWith {
	["Attempted to execute module whilst not on the server.", "core\functions\eden_modules\fn_barracksModule.sqf"] call vs_core_fnc_log;
};

if (_logic getVariable ["HasArsenal", false]) then {
	private _whitelist = [_logic getVariable ["ArsenalFilter", ""]] call vs_core_fnc_getArsenalFilter;
	[format["Current climate: %1", missionNamespace getVariable (format["vs_core_climate_%1", worldName])], "core\XEH_postInit.sqf"] call vs_core_fnc_log;
	private _climate = missionNamespace getVariable [format["vs_core_climate_%1", worldName], "all"];
	private _TropicalAllowlist = parseSimpleArray VS_core_camo_whitelist_tropical;
	private _ArcticAllowlist = parseSimpleArray VS_core_camo_whitelist_arctic;
	private _DesertAllowlist = parseSimpleArray VS_core_camo_whitelist_desert;
	private _TemperateAllowlist = parseSimpleArray VS_core_camo_whitelist_temperate;
	private _allAllowlist = _TropicalAllowlist + _ArcticAllowlist + _DesertAllowlist + _TemperateAllowlist;
	private _camoAllowlist = [];
	switch (_climate) do {
	    case "tropical": { _camoAllowlist = _tropicalAllowlist; };
	    case "arctic": { _camoAllowlist = _ArcticAllowlist; };
	    case "desert": { _camoAllowlist = _DesertAllowlist; };
	    case "temperate": { _camoAllowlist = _TemperateAllowlist; };
	    case "all": { _camoAllowlist = _allAllowlist; };
	};
	{
		[_x, [], true] call ace_arsenal_fnc_initBox;
		[_x, _whitelist, true] call ace_arsenal_fnc_addVirtualItems;
        [_x, _camoAllowlist, true] call ace_arsenal_fnc_addVirtualItems;
		[format["Added %1 filtered arsenal to %2", _whitelist, _x], "core\functions\common\fn_arsenal.sqf"] call vs_core_fnc_log;
	} foreach _objects;
};

if (_logic getVariable ["HasFullHeal", false]) then {
	[_objects] call vs_core_fnc_fullHeal;
};

[format["Loading Spectator? %1, with %2", _logic getVariable ["HasSpectator", false], _objects], "core\functions\eden_modules\fn_barracksModule.sqf"] call vs_core_fnc_log;
if (_logic getVariable ["HasSpectator", false]) then {
	{
		[[_x], {[_this select 0] call vs_core_fnc_addSpectator;}] remoteExec ["BIS_fnc_call", 0, _x];
	} foreach _objects;
};

true;
