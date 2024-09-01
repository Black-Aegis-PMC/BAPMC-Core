/* ----------------------------------------------------------------------------
Function: vs_core_fnc_getArsenalFilter

Description:
	Gets the whitelist array associated with a filter from
	`VS_C_f_arsenal_whitelist_loadouts`

Parameters:
	0: _filter - Filter which controls what objects are shown in the
				 arsenal <STRING>

Returns:
	Arsenal whitelist <ARRAY>

Examples:
	["WEST"] call vs_core_fnc_getArsenalFilter;

	[] call vs_core_fnc_getArsenalFilter;

Author:
	Arend

License GPL-2.0
---------------------------------------------------------------------------- */
params [["_filter", "", [""]]];

[format["Getting whitelists for filter %1", _filter], "core\functions\common\fn_getArsenalFilter.sqf"] call vs_core_fnc_log;
private _whitelist = [];
switch (toLowerANSI _filter) do {
	case "mission": { _whitelist = parseSimpleArray vs_core_arsenal_whitelist_mission; };
	case "standard": { _whitelist = parseSimpleArray vs_core_arsenal_whitelist_Standard; };
	default { _whitelist = true; };
};

// Is it empty?
if (_whitelist isEqualTo []) then {
	_whitelist = true;
	_filter = format["(was %1, now reset)", _filter];
	[format["Arsenal Whitelist is empty. Filling Arsenal with everything instead. %1", _filter], "core\functions\common\fn_getArsenalFilter.sqf"] call vs_core_fnc_log;
};

_whitelist;
