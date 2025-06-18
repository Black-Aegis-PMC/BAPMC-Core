class BAPMC_DAR_M1151: DAR_M1151
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "M1151 M2";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_DAR_M1151_Deploy: DAR_M1151_Deploy
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "M1151 M2 DeployED";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_DAR_M115_MK19: DAR_M115_MK19
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "M1151 (MK19)";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_DAR_M1165_GMV: DAR_M1165_GMV
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "M1165 GMV";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
	class AnimationSources: AnimationSources
	{
		class Gatling
		{
			source = "revolving";
			weapon = "DEGA_LMG_Minigun_Suv";
		};
    };
  	class Turrets: Turrets
		{
			class MainTurret: MainTurret
            {
                weapons[] = {"DEGA_LMG_Minigun_Suv"};
                soundServo[] = {"db-40",1.0};
                stabilizedInAxes = "StabilizedInAxesNone";
                gunBeg = "muzzle_1";
                gunEnd = "chamber_1";
                magazines[] = {"2000Rnd_65x39_Belt_Tracer_Red",
                               "2000Rnd_65x39_Belt_Tracer_Red",
                               "2000Rnd_65x39_Belt_Tracer_Red"};
            };
    };
};
class BAPMC_DAR_M1167: DAR_M1167
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "M1167 (TOW-2)";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_Panther_GPMG_Sand_A: UK3CB_BAF_Panther_GPMG_Sand_A
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Panther CLV GPMG";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A: UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Land Rover WMIK Milan FFR";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A: UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Land Rover WMIK HMG FFR";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Sand_A: UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Sand_A
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Land Rover WMIK GPMG FFR";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A: UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Land Rover WMIK GMG FFR";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_Jackal2_L111A1_D: UK3CB_BAF_Jackal2_L111A1_D
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Jackal 2 HMG";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_Husky_Passenger_HMG_Sand: UK3CB_BAF_Husky_Passenger_HMG_Sand
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Husky HMG Passenger";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_Husky_Passenger_GPMG_Sand: UK3CB_BAF_Husky_Passenger_GPMG_Sand
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Husky GPMG Passenger";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_UK3CB_BAF_Husky_Passenger_GMG_Sand: UK3CB_BAF_Husky_Passenger_GMG_Sand
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Armed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Husky GMG Passenger";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
