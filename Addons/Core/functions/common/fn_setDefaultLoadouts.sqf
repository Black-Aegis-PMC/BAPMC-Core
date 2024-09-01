/* ----------------------------------------------------------------------------
Function: vs_core_fnc_setDefaultLoadouts

Description:
	Sets the default loadouts for called players.

Parameters:
	0: _loadouts - The loadouts to include <ARRAY>

Returns:
	Nothing.

Examples:
	[_DefaultLoadouts] call vs_core_fnc_setDefaultLoadouts;

Author:
	Met
License GPL-2.0
---------------------------------------------------------------------------- */

params [["_loadouts",[]]];
{
	[_x select 0, _x select 1] call ace_arsenal_fnc_addDefaultLoadout;
} forEach _loadouts;
