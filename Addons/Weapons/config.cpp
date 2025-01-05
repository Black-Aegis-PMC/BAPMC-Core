class CfgPatches{
	class BAPMC_Weapons{
		name = "Black Aegis - PMC - Weapons";
		author = "Viking Studios";
		authors[] = {"Supreme God Ark"};
		version = 1.0;
		versionAr[] = {1,0,0,0};
		versionStr = "v1.0.0";
		requiredAddons[] = {"CUP_Weapons_Compatibility","UK3CB_BAF_Weapons","rhsusf_c_weapons"};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {"BAPMC_ammo_556x45_M855A1","BAPMC_ammo_556x45_M855A1_Tracer","BAPMC_ammo_762"};
		worlds[] = {};
	};
};

#include "hpp\CfgAmmo.hpp"
#include "hpp\CfgMagazines.hpp"
