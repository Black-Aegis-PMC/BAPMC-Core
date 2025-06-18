  class BAPMC_Comms_Offroad: EMP_Offroad_Comms
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Unarmed";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Comms Offroad";
    hiddenSelectionsTextures[]={"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_blk_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_cover_blk_co.paa"};
    crew="BAPMC_Rifleman";
    typicalCargo[]={"BAPMC_Rifleman"};
  };

  class BAPMC_Offroad_New: C_Offroad_01_F
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Unarmed";
    side=2;
    scope=2;
    scopecurator=2;
    displayName="Offroad New";
    crew="BAPMC_Rifleman";
    typicalCargo[]={"BAPMC_Rifleman"};
  };
	class BAPMC_ArmoredSUV: DEGA_ArmoredSUV_PMC
	{
		scope = 2;
		scopeCurator = 2;
		scopeArsenal = 2;
		forceInGarage=1;
		side = 2;
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Unarmed";
		displayName = "Armoured Suburban";
    crew="BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman","BAPMC_IC","BAPMC_Medic","BAPMC_Cadet","BAPMC_Cadet"};
		class Turrets: Turrets
		{
			class CargoTurret_1: CargoTurret_1
      {
        gunnerType = "BAPMC_IC";
        dontCreateAI = 0;
      };
			class CargoTurret_2: CargoTurret_2
      {
        gunnerType = "BAPMC_Medic";
        dontCreateAI = 0;
      };
			class CargoTurret_3: CargoTurret_3
      {
        gunnerType = "BAPMC_Cadet";
        dontCreateAI = 0;
      };
			class CargoTurret_4: CargoTurret_4
      {
        gunnerType = "BAPMC_IC";
        dontCreateAI = 0;
      };
			class CargoTurret_5: CargoTurret_5
      {
        gunnerType = "BAPMC_Medic";
        dontCreateAI = 0;
      };
			class CargoTurret_6: CargoTurret_6
      {
        gunnerType = "BAPMC_Rifleman";
        dontCreateAI = 0;
      };
			class CargoTurret_7: CargoTurret_7
      {
        gunnerType = "BAPMC_Cadet";
        dontCreateAI = 0;
      };
		};
    animationList[] = {"rearseats_source",1,"gun_hide_source",1,"lightbar_hide_source",1};
  };
