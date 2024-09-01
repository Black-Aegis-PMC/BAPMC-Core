/* ----------------------------------------------------------------------------
Function: vs_core_fnc_addTeleporter

Description:
	Adds a teleport action menu item which will teleport the player to the
	given marker.

Parameters:
	0: _teleporter - the object which the action is assigned to <OBJECT>
	1: _title - the text displayed in the scroll menu <STRING>
	2: _destination - if an OBJECT, then teleport to an object.
					  if a STRING, then teleport to a marker <OBJECT|STRING>

Returns:
	Nothing

Examples:
	[this, "Teleport to Airfield", airfield_east] call vs_core_fnc_teleport;

	[this, "Teleport to Airfield", "rally_point_marker"] call vs_core_fnc_teleport;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_teleporter", objNull], ["_title", "", [""]], ["_destination", objNull]];

_teleporter addAction [
	_title,
	{
		_dest = (_this select 3) select 0;
		_dir = random 359;

		switch (true) do {
			case (_dest isEqualType "") : {
				player SetPos [(getMarkerPos _dest select 0)-10*sin(_dir), (getMarkerPos _dest select 1)-10*cos(_dir)];
			};

			default {
				player SetPos [(getPos _dest select 0)-10*sin(_dir), (getPos _dest select 1)-10*cos(_dir)];
			};
		};
	},
	[_destination]
];
