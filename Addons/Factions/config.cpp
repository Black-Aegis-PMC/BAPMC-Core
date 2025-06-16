class CfgPatches {
	class BAPMC_Factions {
		// Addon identity
		name = "Black Aegis - PMC - Factions";
		author = "Viking Studios";
		authors[] = {"Amateur-god"};
		url = "https://discord.gg/bkdGvUNFbb";
		version = 1.0;
		versionAr[] = {1,0,0,0};
		versionStr = "v1.0.0";
		requiredAddons[] = {"A3_Modules_F","cba_settings","ace_arsenal","3DEN","USAF_AC130U_C"};
    units[] = {"BAPMC_Cars_Unarmed","BAPMC_Cars_Armed","BAPMC_Vans","BAPMC_Trucks","BAPMC_Planes","BAPMC_Jets","BAPMC_Men","BAPMC_IC_pack","BAPMC_Surgeon_pack","BAPMC_Medic_pack","BAPMC_Rifleman_pack","BAPMC_Cadet_pack","BAPMC_Helicopter_Pilot_pack","BAPMC_Pilot_pack","BAPMC_Fixed_Wing_Crew_pack","BAPMC_Helicopter_Crew_pack","BAPMC_Vic_Crew_pack","BAPMC_IC","BAPMC_Surgeon","BAPMC_Medic","BAPMC_Rifleman","BAPMC_Cadet","BAPMC_Helicopter_Pilot","BAPMC_Pilot","BAPMC_Fixed_Wing_Crew","BAPMC_Helicopter_Crew","BAPMC_Vic_Crew","BAPMC_Europcopter_Unarmed","BAPMC_Eurocopter_Door_Gunners","BAPMC_CH146_Dynamic","BAPMC_CH146_AT","BAPMC_CH146_Armed","BAPMC_AH6M_Littlebird","BAPMC_MH6M_Littlebird","BAPMC_UH60M","BAPMC_UH60M_Medevac_FFV","BAPMC_UH60M_FFV","BAPMC_MH60L_4Pylons","BAPMC_MH60L_2Pylons","BAPMC_AH1_Apache","BAPMC_C130J_Cargo_ViV","BAPMC_C130J_Transport","BAPMC_AC130U","BAPMC_KC135","BAPMC_F22","BAPMC_F35B","BAPMC_F35B_STEALTH","BAPMC_Armoured_SUV","BAPMC_LMG_4WD","BAPMC_AT_4WD","BAPMC_Comms_Offroad","BAPMC_Security_Tahoe","BAPMC_Suburban","BAPMC_pickup_old","BAPMC_Unarmed_4wd","BAPMC_Offroad_New","BAPMC_Transport_Truck","BAPMC_Repair_Truck","BAPMC_Mover_Truck","BAPMC_Medical_Truck","BAPMC_Fuel_Truck","BAPMC_Container_Truck","BAPMC_Ammo_truck","BAPMC_Van_Repair","BAPMC_Van_Ammo","BAPMC_Transport_Van_ViV","BAPMC_Transport_Van","BAPMC_Factions","BAPMC_Factions"};
    weapons[]={};
		magazines[] = {};
		ammo[] = {};
		worlds[] = {};
    skipWhenMissingDependencies = 1;
	};
};

class cfgFactionClasses
{
  class VS_C_BAPMC
  {
    icon="x\VS_C\Core\images\bapmc.paa";
    displayName="Black Aegis - PMC";
    side=2;
    priority=1;
  };
};
class CfgEditorCategories
{
  class VS_C_BAPMC
  {
    icon="x\VS_C\Core\images\bapmc.paa";
    displayName="Black Aegis - PMC";
    side=2;
    priority=1;
  };
};
class CfgEditorSubcategories
{
  #include "hpp\Editor_Sub_Categories.hpp"
};

class CfgVehicleClasses
{
	class BAPMC_helicopters
	{
		displayname="Black Aegis - PMC Helicopters";
	};
};

class cfgVehicles {
    #include "parents\parents.hpp"
    #include "Infantry\Black\men.hpp"
    #include "Infantry\Black\backpacks.hpp"
    #include "vehicles\Air\helis.hpp"
    #include "vehicles\Air\planes.hpp"
    #include "vehicles\ground\carsArmed.hpp"
    #include "vehicles\ground\wdl\carsArmedWdl.hpp"
    #include "vehicles\ground\desert\carsArmedDes.hpp"
    #include "vehicles\ground\carsUnarmed.hpp"
    #include "vehicles\ground\wdl\carsUnarmedWdl.hpp"
    #include "vehicles\ground\desert\carsUnarmedDes.hpp"
    #include "vehicles\ground\vans.hpp"
    #include "vehicles\ground\trucks.hpp"
};

class CfgFunctions {
    class USAF_AC130_AP_GS {
         class general {
              class movePilot
              {
                file = "x\VS_C\Factions\functions\fn_movePilot.sqf";
              };
         };
     };
};
