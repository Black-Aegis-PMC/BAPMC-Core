	class BAPMC_GunArmoredSUV: DEGA_GunArmoredSUV_PMC
	{
		scope = 2;
		scopeCurator = 2;
		scopeArsenal = 2;
		forceInGarage=1;
		side = 2;
		faction = "VS_C_BAPMC";
		editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed";
		displayName = "Armoured Suburban (Minigun)";
    crew="BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman","BAPMC_IC","BAPMC_Medic","BAPMC_Cadet","BAPMC_Cadet"};
    class Turrets: Turrets
    {
      class MainTurret: MainTurret
      {
        gunnerType = "BAPMC_Rifleman";
        magazines[] = {"2000Rnd_65x39_Belt_Tracer_Red","2000Rnd_65x39_Belt_Tracer_Red","2000Rnd_65x39_Belt_Tracer_Red"};
        dontCreateAI = 0;
      };
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
  };
