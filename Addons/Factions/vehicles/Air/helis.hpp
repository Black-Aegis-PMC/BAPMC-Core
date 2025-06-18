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

  class BAPMC_HH60A: B_HH60A_gray_doors_F
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="HH60A (Black Hawk)";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
        gunnerType = "BAPMC_Helicopter_Pilot";
        showHMD = 1;
        weapons[] = {"Laserdesignator_mounted"}; // Add Laser Designator
        magazines[] = {"Laserbatteries"};
			};
      class MainTurret: MainTurret
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
		  class RightDoorGun: RightDoorGun
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
    };
  };

  class BAPMC_MH60L_F: B_MH60L_F
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="MH60L (Spec Ops Black Hawk)";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
        gunnerType = "BAPMC_Helicopter_Pilot";
        showHMD = 1;
        weapons[] = {"Laserdesignator_mounted"}; // Add Laser Designator
        magazines[] = {"Laserbatteries"};
			};
      class MainTurret: MainTurret
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
		  class RightDoorGun: RightDoorGun
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
    };
  };

  class BAPMC_UH60M_Medevac: B_UH60L_med_F
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="UH60M Medevac";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
		class Turrets: Turrets
		{
			class CopilotTurret: CopilotTurret
			{
        gunnerType = "BAPMC_Helicopter_Pilot";
        showHMD = 1;
        weapons[] = {"Laserdesignator_mounted"}; // Add Laser Designator
        magazines[] = {"Laserbatteries"};
			};
      class MainTurret: MainTurret
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
		  class RightDoorGun: RightDoorGun
		  {
        gunnerType = "BAPMC_Helicopter_Crew";
		  };
    };
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

  class BAPMC_Chinook: B_Heli_Transport_03_unarmed_F
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Helicopters";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="CH-47 (Chinook)";
    crew="BAPMC_Helicopter_Pilot";
    typicalCargo[] = {"BAPMC_Helicopter_Crew"};
    vehicleClass = "BAPMC_helicopters";
  };
