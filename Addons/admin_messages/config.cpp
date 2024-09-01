class CfgPatches {
	class VS_Core_admin_messages {
		// Addon identity
		name = "Viking Studios - Admin Messages";
		author = "McDiod";
		authors[] = {
			"McDiod",
			"Ford",
			"Arend",
			"Carmichael"
		};
		url = "https://discord.gg/rUUsCShkzJ";
		version = 1.0.0;
		versionAr[] = {1,0,0,0};
		versionStr = "v1.0.0";

		// Addon requirements
		requiredVersion = 2.00;
		requiredAddons[] = {
			"A3_Ui_F"
		};

		// Addon items
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		worlds[] = {};
	};
};

#include "cfgEventHandlers.hpp"
#include "cfgFunctions.hpp"
#include "gui\defines.hpp"
#include "gui\sendBoxBase.hpp"
#include "gui\interruptMenu.hpp"
#include "gui\rscTitles.hpp"
