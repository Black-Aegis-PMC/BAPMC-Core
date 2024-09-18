class CfgPatches {
    class VS_Undercover {
        name = "Black Aegis - PMC - Undercover";
        author = "Viking Studios";
        authors[] = {"Amateur-god"};
        url = "https://discord.gg/bkdGvUNFbb";
        version = 1.0;
        versionAr[] = {1,0,0,0};
        versionStr = "v1.0.0";
        requiredAddons[] = {"A3_Modules_F", "CBA_settings"};
        units[] = {};
        weapons[] = {};
        magazines[] = {};
        ammo[] = {};
        worlds[] = {};
    };
};

// Include dialog definitions
#include "dialog.hpp"

class CfgFunctions {
    class VS_Undercover {
        class Functions {
            file = "x\VS_C\Undercover\functions";
            class checkDisguise {
                description = "Checks the player's disguise status.";
            };
            class interactWithCivilians {
                description = "Handles interactions with nearby civilians.";
            };
        };
    };
};

class Extended_PreInit_EventHandlers {
    class VS_Undercover_preInit {
        init = "call compile preprocessFileLineNumbers '\x\VS_C\Undercover\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
	class VS_Undercover_postInit {
		init = "call compile preprocessFileLineNumbers '\x\VS_C\Undercover\XEH_postInit.sqf'";
	};
};
