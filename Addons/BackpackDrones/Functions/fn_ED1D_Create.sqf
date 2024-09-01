/*

Description:
	If player has drone item in backpack, removes drone item from backpack and spawns 
    specified drone in front of player.

Returns:
	ACE Actions to insert as children

Author:
	Amateur-god
*/

params ["_unit"];
[player, "PutDown"] call ace_common_fnc_doGesture;

[
    {
        params ["_unit"];
        private _playerSide = side player; // Define _playerSide here

        _unit removeItemFromBackpack "VS_C_ED_1D_Item";

        private _vehicleClass = switch (_playerSide) do {
            case west: {"B_UGV_02_Demining_F"};
            case east: {"O_UGV_02_Demining_F"};
            case independent: {"I_UGV_02_Demining_F"};
            default {"C_IDAP_UGV_02_Demining_F"};
        };

        _uavPos = _unit modelToWorld [0, 2, 0];
        _uav = createVehicle [_vehicleClass, _uavPos, [], 0, "CAN_COLLIDE"];
        createVehicleCrew _uav;
    },
    [_unit],
    1.5
] call CBA_fnc_waitAndExecute;
