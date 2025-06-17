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
		requiredAddons[] = {
      "A3_Characters_F",
      "A3_Soft_F",
      "A3_Soft_F_Enoch",
      "A3_Air_F_Heli",
      "A3_Modules_F",
      "cba_settings",
      "ace_arsenal",
      "3DEN",
      "USAF_AC130U_C",
      "DEGA_Vehicles_Suv",
      "ace_common",
      "ace_interact_menu",
      "ace_interaction",
      "ace_hearing",
      "ace_medical_treatment",
      "ace_maptools",
      "ace_trenches",
      "ace_logistics_wirecutter",
      "A3_Weapons_F",
      "ace_spottingscope",
      "ace_kestrel4500",
      "ace_dagr",
      "ace_atragmx",
      "ace_tripod",
      "ace_captives",
      "ace_huntir",
      "ace_explosives",
      "A3_Weapons_F_Items",
    };
    units[] = {
      "BAPMC_Transport_Truck",
      "BAPMC_Repair_Truck",
      "BAPMC_Mover_Truck",
      "BAPMC_Medical_Truck",
      "BAPMC_Fuel_Truck",
      "BAPMC_Container_Truck",
      "BAPMC_Ammo_truck",
      "BAPMC_Comms_Offroad",
      "BAPMC_Offroad_New",
      "BAPMC_DAR_M1151WoodlandUA",
      "BAPMC_DAR_M1152Woodland",
      "BAPMC_UK3CB_BAF_Panther_GPMG_Green_A",
      "BAPMC_DAR_M1167Woodland",
      "BAPMC_DAR_M115_MK19Woodland",
      "BAPMC_DAR_M1151Woodland",
      "BAPMC_UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B",
      "BAPMC_UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B",
      "BAPMC_UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_B",
      "BAPMC_UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_B",
      "BAPMC_UK3CB_BAF_Jackal2_L111A1_W",
      "BAPMC_UK3CB_BAF_Husky_Passenger_HMG_Green",
      "BAPMC_UK3CB_BAF_Husky_Passenger_GPMG_Green",
      "BAPMC_UK3CB_BAF_Husky_Passenger_GMG_Green",
      "BAPMV_DAR_M1152",
      "BAPMC_DAR_M1151",
      "BAPMC_DAR_M1151_Deploy",
      "BAPMC_DAR_M115_MK19",
      "BAPMC_DAR_M1165_GMV",
      "BAPMC_DAR_M1167",
      "BAPMC_UK3CB_BAF_Panther_GPMG_Sand_A",
      "BAPMC_UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A",
      "BAPMC_UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A",
      "BAPMC_UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Sand_A",
      "BAPMC_UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A",
      "BAPMC_UK3CB_BAF_Jackal2_L111A1_D",
      "BAPMC_UK3CB_BAF_Husky_Passenger_HMG_Sand",
      "BAPMC_UK3CB_BAF_Husky_Passenger_GPMG_Sand",
      "BAPMC_UK3CB_BAF_Husky_Passenger_GMG_Sand",
      "BAPMC_C130J_Cargo_ViV",
      "BAPMC_C130J_Transport",
      "BAPMC_AC130U",
      "BAPMC_KC135",
      "BAPMC_Wildcat",
      "BAPMC_Wildcat_AT",
      "BAPMC_Wildcat_Armed",
      "BAPMC_AH6M_Littlebird",
      "BAPMC_MH6M_Littlebird",
      "BAPMC_HH60A",
      "BAPMC_MH60L_F",
      "BAPMC_UH60M_Medevac",
      "BAPMC_AH1_Apache",
      "BAPMC_Chinook",
      "BAPMC_IC",
      "BAPMC_Surgeon",
      "BAPMC_Medic",
      "BAPMC_Rifleman",
      "BAPMC_Cadet",
      "BAPMC_Helicopter_Pilot",
      "BAPMC_Pilot",
      "BAPMC_Fixed_Wing_Crew",
      "BAPMC_Helicopter_Crew",
      "BAPMC_Vic_Crew",
      "BAPMC_Factions",
      "BAPMC_Cars_Unarmed",
      "BAPMC_Cars_Armed",
      "BAPMC_Cars_Armed_Des",
      "BAPMC_Cars_Unarmed_Des",
      "BAPMC_Cars_Armed_Wdl",
      "BAPMC_Cars_Unarmed_Wdl",
      "BAPMC_Vans",
      "BAPMC_Trucks",
      "BAPMC_Planes",
      "BAPMC_Jets",
      "BAPMC_Men",
      "VS_C_BAPMC",
      "BAPMC_helicopters",

    };
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
