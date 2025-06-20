class BAPMV_DAR_M1152: DAR_M1152
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Cars_Unarmed_Des";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "M1152";
    crew = "BAPMC_Rifleman";
    typicalCargo[] = {"BAPMC_Rifleman"};
};
class BAPMC_aircraft_tug: rksla3_aircraft_tug_opfor
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Airbase_Support";
    side = 2;
    scope = 2;
    scopecurator = 2;
    displayName = "Aircraft Tug";
    crew = "BAPMC_Rifleman"; // change to ground crew when available
    typicalCargo[] = {"BAPMC_Rifleman"};
};
