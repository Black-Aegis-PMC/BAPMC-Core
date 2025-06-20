class CfgPatches {
	class VS_C_Backpack_Drones {
		// Addon identity
		name = "Viking Studios - Toolkit Drones";
		author = "Viking Studios";
		authors[] = {"Amateur-god"};
		url = "https://discord.gg/bkdGvUNFbb";
		version = 1.0;
		versionAr[] = {1,0,0,0};
		versionStr = "v1.0.0";
		requiredAddons[] = {"A3_Modules_F","cba_settings","ace_arsenal","3DEN","ace_medical"};
		units[] = {"VS_ED_1E","BAPMC_mavik_3T_Civ","BAPMC_mavik_3_Civ"};
		weapons[] = {"VS_C_ED_1D_Item","VS_C_ED_1E_Item","VS_C_AR2_Item","VS_C_Mavik_3_Item","VS_C_Mavik_3T_Item"};
		magazines[] = {};
		ammo[] = {};
		worlds[] = {};
	};
};

class CfgVehicles {
	class B_UGV_02_Demining_F;
	class B_UGV_02_Science_F;
	class B_UAV_01_F;
	class O_UGV_02_Demining_F;
	class O_UGV_02_Science_F;
	class O_UAV_01_F;
	class I_UGV_02_Demining_F;
	class I_UGV_02_Science_F;
	class I_UAV_01_F;
	class C_IDAP_UGV_02_Demining_F;
	class C_IDAP_UAV_01_F;
    class ItemCore;
    class CBA_MiscItem_ItemInfo;
	class Man;
	class BAPMC_mavic3T_base;
	class BAPMC_Mavik_Base;
#include "Configs\Ace.hpp"
#include "Configs\Drones.hpp"
};

#include "Configs\CfgWeapons.hpp"

class CfgFunctions {
	class VS_C_Drone {
		class Place {
            tag = "VS_C_drones";
            file = "x\VS_C\Backpack-Drones\Functions";
			class ED1D_Create {};
			class ED1E_Create {};
			class AR2_Create {};
			class Mavik3_Create {};
			class Mavik3T_Create {};
        };
		class Pack {
            tag = "VS_C_drones";
            file = "x\VS_C\Backpack-Drones\Functions";
			class ED1D_Pack {};
			class ED1E_Pack {};
			class AR2_Pack {};
			class Mavik3_Pack {};
			class Mavik3T_Pack {};
        };
    };
};
class Extended_PostInit_EventHandlers
{
	class VS_C_Backpack_Drones_PlayerInit
	{
		clientInit = "call compile preprocessFileLineNumbers 'x\VS_C\Backpack-Drones\Player_init.sqf'";
	};
};
