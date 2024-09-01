/*

Description:
	Adds custom ACE interaction to Pick up drones that have a packable Item and place them into backpack, 
    if players backpack has space.

Returns:
	ACE Actions to insert as children

Author:
	Amateur-god
*/
//ED1D

_action = ["pickUpUAV", "Pick Up", "", 
    {
        params ["_target","_player"];
        [_player,_target] call VS_C_Drone_fnc_ED1D_Pack;
    }, 
    {
        params ["_target","_player"];
        _player canAddItemToBackpack "VS_C_ED_1D_Item";
    }
] call ace_interact_menu_fnc_createAction;

["B_UGV_02_Demining_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["O_UGV_02_Demining_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["I_UGV_02_Demining_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["C_IDAP_UGV_02_Demining_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

//ED1E

_action = ["pickUpUAV", "Pick Up", "", 
    {
        params ["_target","_player"];
        [_player,_target] call VS_C_Drone_fnc_ED1E_Pack;
    }, 
    {
        params ["_target","_player"];
        _player canAddItemToBackpack "VS_C_ED_1E_Item";
    }
] call ace_interact_menu_fnc_createAction;

["VS_ED_1E_C", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["B_UGV_02_Science_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["O_UGV_02_Science_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["I_UGV_02_Science_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

//AR-2

_action = ["pickUpUAV", "Pick Up", "", 
    {
        params ["_target","_player"];
        [_player,_target] call VS_C_Drone_fnc_AR2_Pack;
    }, 
    {
        params ["_target","_player"];
        _player canAddItemToBackpack "VS_C_AR2_Item";
    }
] call ace_interact_menu_fnc_createAction;

["B_UAV_01_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["O_UAV_01_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["I_UAV_01_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["C_IDAP_UAV_01_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;