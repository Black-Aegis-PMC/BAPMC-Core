  class BAPMC_C130J_Cargo_ViV: USAF_C130J_Cargo
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Planes";
    side=2;
    scope=2;
    displayName="C130J Cargo";
    crew="BAPMC_Pilot";
  };

  class BAPMC_C130J_Transport: USAF_C130J
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Planes";
    side=2;
    scope=2;
    displayName="C130J Transport";
    crew="BAPMC_Pilot";
  };

class BAPMC_AC130U: USAF_AC130U
{
    faction = "VS_C_BAPMC";
    editorCategory = "VS_C_BAPMC";
    editorSubcategory = "BAPMC_Planes";
    side = 2;
    scope=2;
    displayName = "AC-130U Spooky II";
    crew = "BAPMC_Pilot";
    class Turrets: Turrets
    {
        class CopilotTurret: CopilotTurret
        {
            gunnerType = "BAPMC_Pilot";
        };

        class FlightEngTurret: FlightEngTurret
        {
            gunnerType = "BAPMC_Fixed_Wing_Crew";
        };

        class IRTurret: IRTurret
        {
            gunnerType = "BAPMC_Fixed_Wing_Crew";
        };

        class TVTurret: TVTurret
        {
            gunnerType = "BAPMC_Fixed_Wing_Crew";
        };

        class FCOTurret: FCOTurret
        {
            gunnerType = "BAPMC_Fixed_Wing_Crew";
        };

        class EWOTurret: EWOTurret
        {
            gunnerType = "BAPMC_Fixed_Wing_Crew";
        };

        class NavigatorTurret: NavigatorTurret
        {
            gunnerType = "BAPMC_Fixed_Wing_Crew";
        };
    };
};


    class BAPMC_KC135: usaf_kc135
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Planes";
    side=2;
    scope=2;
    displayName="KC-135 StratoTanker";
    crew="BAPMC_Pilot";
  };

    class BAPMC_F22: rhsusf_f22
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Jets";
    side=2;
    scope=2;
    displayName="F-22";
    crew="BAPMC_Pilot";
  };

    class BAPMC_F35B: CUP_B_F35B_BAF
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Jets";
    side=2;
    scope=2;
    displayName="F-35B Lightning II";
    crew="BAPMC_Pilot";
  };

    class BAPMC_F35B_STEALTH: CUP_B_F35B_BAF
  {
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Jets";
    side=2;
    scope=2;
    displayName="F-35B Lightning II (Stealth)";
    crew="BAPMC_Pilot";
  };
