/* ----------------------------------------------------------------------------
Function: vs_core_fnc_forceRespawn

Description:
	Forces all the dead people to respawn immediately.
	After that the respawn is once again set to default timer value.

Parameters:
	Nothing

Returns:
	Nothing

Examples:
	[] call vs_core_fnc_forceRespawn;

Author:
	Ford
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
{
	setPlayerRespawnTime 0;
	sleep 2;
	setPlayerRespawnTime vs_core_respawn_timer;
} remoteExec ["BIS_fnc_call", 0];
