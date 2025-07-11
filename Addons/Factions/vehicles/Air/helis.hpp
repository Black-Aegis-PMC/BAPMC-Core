  class BAPMC_Wildcat: UK3CB_BAF_Wildcat_AH1_TRN_8A
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Wildcat";
    crew="BAPMC_Helicopter_Pilot";
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_Wildcat_AT: UK3CB_BAF_Wildcat_AH1_CAS_8C
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Wildcat AT";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_Wildcat_Armed: UK3CB_BAF_Wildcat_AH1_8_Armed
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Wildcat Armed";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_AH6M_Littlebird: B_Heli_Light_01_dynamicLoadout_F
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="AH6M Littlebird";
    crew="BAPMC_Helicopter_Pilot";
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_MH6M_Littlebird: B_Heli_Light_01_F
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="MH6M Littlebird";
    crew="BAPMC_Helicopter_Pilot";
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_AH1_Apache: UK3CB_BAF_Apache_AH1_Generic_MTP_RM
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="AH-1 Apache";
    crew="BAPMC_Helicopter_Pilot";
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_BAF_Merlin_HC4_18_GPMG: UK3CB_BAF_Merlin_HC4_18_GPMG
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Merlin HC4 18 (GPMG)";
    crew="BAPMC_Helicopter_Pilot";
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_BAF_Merlin_HC4_24: UK3CB_BAF_Merlin_HC4_24
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Merlin HC4 24";
    crew="BAPMC_Helicopter_Pilot";
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_BAF_Merlin_HC4_32: UK3CB_BAF_Merlin_HC4_32
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Merlin HC4 32";
    crew="BAPMC_Helicopter_Pilot";
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_BAF_Merlin_HC4_CSAR: UK3CB_BAF_Merlin_HC4_CSAR
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Merlin HC4 CSAR";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_HH60GM: vtx_HH60
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="HH-60G/M Pavehawk (Black Hawk)";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
        gunnerType = "BAPMC_Helicopter_Pilot";
			};
      class MainTurret: MainTurret
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
		  class RightDoorGun: RightDoorGun
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
      class troop_commander: troop_commander
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class CargoTurret_01: CargoTurret_01
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_02: CargoTurret_02
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_03: CargoTurret_03
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_04: CargoTurret_04
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_05: CargoTurret_05
      {
        gunnerType = "BAPMC_Cadet";
      };
      class CargoTurret_06: CargoTurret_06
      {
        gunnerType = "BAPMC_Cadet";
      };
      class CargoTurret_11: CargoTurret_11
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_14: CargoTurret_14
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_15: CargoTurret_15
      {
        gunnerType = "BAPMC_Rifleman";
      };
    };
  };

  class BAPMC_MH60M: vtx_MH60
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="MH-60M";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
        gunnerType = "BAPMC_Helicopter_Pilot";
			};
      class MainTurret: MainTurret
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
		  class RightDoorGun: RightDoorGun
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
      class troop_commander: troop_commander
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class CargoTurret_01: CargoTurret_01
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_02: CargoTurret_02
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_03: CargoTurret_03
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_04: CargoTurret_04
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_05: CargoTurret_05
      {
        gunnerType = "BAPMC_Cadet";
      };
      class CargoTurret_06: CargoTurret_06
      {
        gunnerType = "BAPMC_Cadet";
      };
      class CargoTurret_11: CargoTurret_11
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_14: CargoTurret_14
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_15: CargoTurret_15
      {
        gunnerType = "BAPMC_Rifleman";
      };
    };
  };
  class BAPMC_UH60M_Medevac: vtx_UH60M_MEDEVAC
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="UH-60M Medevac";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
        gunnerType = "BAPMC_Helicopter_Pilot";
			};
      class MainTurret: MainTurret
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
		  class RightDoorGun: RightDoorGun
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
      class troop_commander: troop_commander
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class LeftWindow: LeftWindow
      {
        gunnerType = "BAPMC_Surgeon";
      };
      class RightWindow: RightWindow
      {
        gunnerType = "BAPMC_Medic";
      };
    };
  };
  class BAPMC_MH60M_DAP: vtx_MH60M_DAP
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="MH-60M DAP";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
    		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
        gunnerType = "BAPMC_Helicopter_Pilot";
			};
      class MainTurret: MainTurret
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
		  class RightDoorGun: RightDoorGun
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
      class troop_commander: troop_commander
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class CargoTurret_01: CargoTurret_01
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_02: CargoTurret_02
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_03: CargoTurret_03
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_04: CargoTurret_04
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_05: CargoTurret_05
      {
        gunnerType = "BAPMC_Cadet";
      };
      class CargoTurret_06: CargoTurret_06
      {
        gunnerType = "BAPMC_Cadet";
      };
      class CargoTurret_11: CargoTurret_11
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_14: CargoTurret_14
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_15: CargoTurret_15
      {
        gunnerType = "BAPMC_Rifleman";
      };
    };
  };
  class BAPMC_MH60M_DAP_MLASS: vtx_MH60M_DAP_MLASS
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="MH-60M DAP MLASS";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
    		class Turrets: Turrets
    {
      class CopilotTurret: CopilotTurret
      {
        gunnerType = "BAPMC_Helicopter_Pilot";
      };
      class MainTurret: MainTurret
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class RightDoorGun: RightDoorGun
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class troop_commander: troop_commander
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class CargoTurret_01: CargoTurret_01
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_02: CargoTurret_02
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_03: CargoTurret_03
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_04: CargoTurret_04
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_05: CargoTurret_05
      {
        gunnerType = "BAPMC_Cadet";
      };
      class CargoTurret_06: CargoTurret_06
      {
        gunnerType = "BAPMC_Cadet";
      };
      class CargoTurret_11: CargoTurret_11
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_14: CargoTurret_14
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_15: CargoTurret_15
      {
        gunnerType = "BAPMC_Rifleman";
      };
    };
  };
  class BAPMC_MH60M_Slick: vtx_UH60M_SLICK
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="MH-60M Slick";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
    class Turrets: Turrets
    {
      class CopilotTurret: CopilotTurret
      {
        gunnerType = "BAPMC_Helicopter_Pilot";
      };
      class MainTurret: MainTurret
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class RightDoorGun: RightDoorGun
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class CargoTurret_01: CargoTurret_01
      {
        gunnerType = "BAPMC_IC";
      };
      class CargoTurret_02: CargoTurret_02
      {
        gunnerType = "BAPMC_Medic";
      };
      class CargoTurret_03: CargoTurret_03
      {
        gunnerType = "BAPMC_Rifleman";
      };
      class CargoTurret_04: CargoTurret_04
      {
        gunnerType = "BAPMC_Rifleman";
      };
    };
  };
  class BAPMC_AH64D_B1: fza_ah64d_b1
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="AH-64D Apache Longbow B1";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Pilot"};
    vehicleClass = "BAPMC_helicopters";
  };
  class BAPMC_Chinook: TF373_SOAR_MH47G
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="MH-47G Chinook";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Pilot"};
    vehicleClass = "BAPMC_helicopters";
    class Turrets: Turrets
    {
      class CopilotTurret: CopilotTurret
      {
        gunnerType = "BAPMC_Helicopter_Pilot";
      };
      class MainTurret: MainTurret
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class backcrew: backcrew
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class HoistOperator: HoistOperator
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class loadmaster: loadmaster
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class RampSeatL: RampSeatL
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class RampSeatR: RampSeatR
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class RightDoorGun: RightDoorGun
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class TroopCommander: TroopCommander
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class Window_M240_Left: Window_M240_Left
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
      class Window_M240_Right: Window_M240_Right
      {
        gunnerType = "BAPMC_Helicopter_Crew";
      };
    };
  };
