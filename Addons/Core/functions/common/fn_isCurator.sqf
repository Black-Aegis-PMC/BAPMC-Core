/* ----------------------------------------------------------------------------
Function: vs_core_fnc_isCurator

Description:
	Check if a unit has curator/zeus powers.

Parameters:
	0: _player - A player object.

Returns:
	True or False depending on if player has powers <BOOLEAN>

Examples:
	[_player] call vs_core_fnc_isCurator;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_player", player, [objNull]]];

if (_player in (call vs_core_fnc_getCurators)) exitWith {
	true;
};

false;
