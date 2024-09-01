/*

Description:
	Packs the drone into a toolkit like item and puts it into the players backpack.

Returns:
	ACE Actions to insert as children

Author:
	Amateur-god
*/

params ["_unit", "_item"];
[player, "PutDown"] call ace_common_fnc_doGesture;
[
    {
        params ["_unit", "_item"];

        // Check if the vehicle is still present
        if (alive _item) then {
            deleteVehicle _item;
            _unit addItemToBackpack "VS_C_AR2_Item";
        } else {
            hint "The vehicle is destroyed and cant be collected!";
        }
    },
    [_unit, _item], 
    1.5
] call CBA_fnc_waitAndExecute;