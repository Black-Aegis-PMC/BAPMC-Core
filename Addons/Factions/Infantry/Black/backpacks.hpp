	class BAPMC_Kitbag: B_Kitbag_mcamo
	{
		author = "Amateur-God";
		scope = 2;
		displayName = "Kitbag (Black)";
		picture = "x\VS_C\Factions\Infantry\Black\Data\BAPMC_Icon_Kitbag.paa";
		hiddenSelectionsTextures[] = {"x\VS_C\Factions\Infantry\Black\Data\BAPMC_Kitbag.paa"};
	};
  class BAPMC_IC_pack: USP_REEBOW_3DAP_ACC9_BLK
  {
    scope=2;
    class TransportMagazines
    {
     class _xx_tsp_breach_popper_mag {count=5;magazine="tsp_breach_popper_mag";};
     class _xx_HandGrenade {count=1;magazine="HandGrenade";};
     class _xx_UK3CB_BAF_SmokeShellRed {count=2;magazine="UK3CB_BAF_SmokeShellRed";};
     class _xx_UK3CB_BAF_SmokeShellBlue {count=2;magazine="UK3CB_BAF_SmokeShellBlue";};
     class _xx_UK3CB_BAF_SmokeShell {count=2;magazine="UK3CB_BAF_SmokeShell";};
     class _xx_UK3CB_BAF_SmokeShellPurple {count=2;magazine="UK3CB_BAF_SmokeShellPurple";};
     class _xx_tsp_flashbang_cts {count=1;magazine="tsp_flashbang_cts";};
     class _xx_1Rnd_HE_Grenade_shell {count=2;magazine="1Rnd_HE_Grenade_shell";};
    };
    class TransportItems
    {
     class _xx_ACE_UAVBattery {count=1;name="ACE_UAVBattery";};
     class _xx_VS_C_AR2_Item {count=1;name="VS_C_AR2_Item";};
     class _xx_ACE_EntrenchingTool {count=1;name="ACE_EntrenchingTool";};
     class _xx_ACE_CableTie {count=5;name="ACE_CableTie";};
     class _xx_tsp_lockpick {count=1;name="tsp_lockpick";};
    };
    class TransportWeapons{};
  };

  class BAPMC_Surgeon_pack: USP_45L_RUCKSACK
  {
    scope=2;
    class TransportMagazines
    {
     class _xx_kat_Painkiller {count=2;magazine="kat_Painkiller";};
    };
    class TransportItems
    {
     class _xx_ACE_plasmaIV {count=4;name="ACE_plasmaIV";};
     class _xx_ACE_plasmaIV_500 {count=4;name="ACE_plasmaIV_500";};
     class _xx_ACE_salineIV_250 {count=6;name="ACE_salineIV_250";};
     class _xx_ACE_surgicalKit {count=1;name="ACE_surgicalKit";};
     class _xx_ACE_suture {count=100;name="ACE_suture";};
     class _xx_kat_TXA {count=10;name="kat_TXA";};
     class _xx_kat_Pulseoximeter {count=1;name="kat_Pulseoximeter";};
     class _xx_kat_phenylephrineAuto {count=6;name="kat_phenylephrineAuto";};
     class _xx_kat_ncdKit {count=2;name="kat_ncdKit";};
     class _xx_kat_naloxone {count=5;name="kat_naloxone";};
     class _xx_ACE_morphine {count=6;name="ACE_morphine";};
     class _xx_kat_larynx {count=20;name="kat_larynx";};
     class _xx_kat_IO_FAST {count=10;name="kat_IO_FAST";};
     class _xx_kat_EACA {count=10;name="kat_EACA";};
     class _xx_kat_chestSeal {count=5;name="kat_chestSeal";};
     class _xx_ACE_epinephrine {count=6;name="ACE_epinephrine";};
     class _xx_kat_aatKit {count=2;name="kat_aatKit";};
     class _xx_kat_IV_16 {count=20;name="kat_IV_16";};
     class _xx_ACE_elasticBandage {count=30;name="ACE_elasticBandage";};
     class _xx_ACE_packingBandage {count=30;name="ACE_packingBandage";};
     class _xx_kat_clamp {count=1;name="kat_clamp";};
     class _xx_kat_retractor {count=1;name="kat_retractor";};
     class _xx_kat_scalpel {count=6;name="kat_scalpel";};
     class _xx_kat_plate {count=6;name="kat_plate";};
     class _xx_kat_atropine {count=6;name="kat_atropine";};
     class _xx_kat_BVM {count=1;name="kat_BVM";};
     class _xx_kat_etomidate {count=12;name="kat_etomidate";};
     class _xx_kat_ketamine {count=5;name="kat_ketamine";};
     class _xx_kat_lidocaine {count=5;name="kat_lidocaine";};
     class _xx_kat_lorazepam {count=6;name="kat_lorazepam";};
     class _xx_kat_nitroglycerin {count=5;name="kat_nitroglycerin";};
     class _xx_kat_flumazenil {count=6;name="kat_flumazenil";};
     class _xx_kat_amiodarone {count=5;name="kat_amiodarone";};
     class _xx_kat_fentanyl {count=5;name="kat_fentanyl";};
     class _xx_kat_nalbuphine {count=5;name="kat_nalbuphine";};
     class _xx_kat_norepinephrine {count=5;name="kat_norepinephrine";};
     class _xx_kat_X_AED {count=1;name="kat_X_AED";};
     class _xx_kat_accuvac {count=1;name="kat_accuvac";};
     class _xx_ACE_adenosine {count=6;name="ACE_adenosine";};
    };
    class TransportWeapons{};
  };


  class BAPMC_Medic_pack: USP_45L_RUCKSACK
  {
    scope=2;
    class TransportMagazines
    {
     class _xx_kat_Painkiller {count=4;magazine="kat_Painkiller";};
    };
    class TransportItems
    {
     class _xx_ACE_plasmaIV {count=4;name="ACE_plasmaIV";};
     class _xx_ACE_plasmaIV_500 {count=6;name="ACE_plasmaIV_500";};
     class _xx_ACE_salineIV_250 {count=6;name="ACE_salineIV_250";};
     class _xx_ACE_surgicalKit {count=1;name="ACE_surgicalKit";};
     class _xx_ACE_suture {count=100;name="ACE_suture";};
     class _xx_kat_TXA {count=10;name="kat_TXA";};
     class _xx_kat_Pulseoximeter {count=1;name="kat_Pulseoximeter";};
     class _xx_ACE_splint {count=8;name="ACE_splint";};
     class _xx_kat_phenylephrineAuto {count=6;name="kat_phenylephrineAuto";};
     class _xx_kat_pocketBVM {count=1;name="kat_pocketBVM";};
     class _xx_kat_ncdKit {count=4;name="kat_ncdKit";};
     class _xx_kat_naloxone {count=4;name="kat_naloxone";};
     class _xx_ACE_morphine {count=6;name="ACE_morphine";};
     class _xx_kat_larynx {count=15;name="kat_larynx";};
     class _xx_kat_IO_FAST {count=6;name="kat_IO_FAST";};
     class _xx_kat_EACA {count=10;name="kat_EACA";};
     class _xx_kat_chestSeal {count=5;name="kat_chestSeal";};
     class _xx_ACE_epinephrine {count=6;name="ACE_epinephrine";};
     class _xx_kat_X_AED {count=1;name="kat_X_AED";};
     class _xx_kat_aatKit {count=4;name="kat_aatKit";};
     class _xx_kat_IV_16 {count=30;name="kat_IV_16";};
     class _xx_ACE_elasticBandage {count=35;name="ACE_elasticBandage";};
     class _xx_ACE_packingBandage {count=30;name="ACE_packingBandage";};
     class _xx_kat_suction {count=15;name="kat_suction";};
     class _xx_kat_nitroglycerin {count=6;name="kat_nitroglycerin";};
    };
    class TransportWeapons{};
  };


  class BAPMC_Rifleman_pack: BAPMC_Kitbag
  {
    scope=2;
    class TransportMagazines
    {
     class _xx_tsp_breach_popper_auto_mag {count=2;magazine="tsp_breach_popper_auto_mag";};
    };
    class TransportItems
    {
     class _xx_ACE_wirecutter {count=1;name="ACE_wirecutter";};
     class _xx_ACE_EntrenchingTool {count=1;name="ACE_EntrenchingTool";};
    };
    class TransportWeapons{};
  };


  class BAPMC_Cadet_pack: BAPMC_Kitbag
  {
    scope=2;
    class TransportMagazines
    {
     class _xx_tsp_breach_popper_auto_mag {count=2;magazine="tsp_breach_popper_auto_mag";};
    };
    class TransportItems
    {
     class _xx_ACE_wirecutter {count=1;name="ACE_wirecutter";};
    };
    class TransportWeapons{};
  };


  class BAPMC_Helicopter_Pilot_pack: USP_REEBOW_3DAP_ACC9_BLK
  {
    scope=2;
    class TransportMagazines{};
    class TransportItems
    {
     class _xx_ToolKit {count=1;name="ToolKit";};
     class _xx_ACE_wirecutter {count=1;name="ACE_wirecutter";};
     class _xx_ACE_EntrenchingTool {count=1;name="ACE_EntrenchingTool";};
    };
    class TransportWeapons{};
 		hiddenSelectionsTextures[] = {"","",""};
  };


  class BAPMC_Pilot_pack: USP_REEBOW_3DAP_ACC9_BLK
  {
    scope=2;
    class TransportMagazines{};
    class TransportItems
    {
     class _xx_ToolKit {count=1;name="ToolKit";};
     class _xx_ACE_wirecutter {count=1;name="ACE_wirecutter";};
     class _xx_ACE_EntrenchingTool {count=1;name="ACE_EntrenchingTool";};
    };
    class TransportWeapons{};
 		hiddenSelectionsTextures[] = {"","",""};
  };


  class BAPMC_Fixed_Wing_Crew_pack: USP_REEBOW_3DAP_ACC9_BLK
  {
    scope=2;
    class TransportMagazines{};
    class TransportItems
    {
     class _xx_ToolKit {count=1;name="ToolKit";};
     class _xx_ACE_wirecutter {count=1;name="ACE_wirecutter";};
     class _xx_ACE_EntrenchingTool {count=1;name="ACE_EntrenchingTool";};
    };
    class TransportWeapons{};
  };


  class BAPMC_Helicopter_Crew_pack: USP_REEBOW_3DAP_ACC9_BLK
  {
    scope=2;
    class TransportMagazines{};
    class TransportItems
    {
     class _xx_ToolKit {count=1;name="ToolKit";};
     class _xx_ACE_wirecutter {count=1;name="ACE_wirecutter";};
     class _xx_ACE_EntrenchingTool {count=1;name="ACE_EntrenchingTool";};
    };
    class TransportWeapons{};
  };


  class BAPMC_Vic_Crew_pack: USP_REEBOW_3DAP_ACC9_BLK
  {
    scope=2;
    class TransportMagazines{};
    class TransportItems
    {
     class _xx_ToolKit {count=1;name="ToolKit";};
     class _xx_ACE_wirecutter {count=1;name="ACE_wirecutter";};
     class _xx_ACE_EntrenchingTool {count=1;name="ACE_EntrenchingTool";};
    };
    class TransportWeapons{};
  };

#ifndef WS_CAPACITY_MACROS
  #define WS_CAPACITY_MACROS
  #define WS_MAXLOAD 380
  #define WS_MASS    30
  #define PATCH_PACK(_C) class _C; class _C : _C { maximumLoad = WS_MAXLOAD; mass = WS_MASS; }
#endif

PATCH_PACK(BAPMC_Kitbag);              
PATCH_PACK(USP_45L_RUCKSACK);          
PATCH_PACK(USP_REEBOW_3DAP_ACC9_BLK);
PATCH_PACK(BAPMC_Surgeon_pack);
PATCH_PACK(BAPMC_Medic_pack);
PATCH_PACK(BAPMC_Rifleman_pack);
PATCH_PACK(BAPMC_Cadet_pack);
PATCH_PACK(BAPMC_Helicopter_Pilot_pack);
PATCH_PACK(BAPMC_Pilot_pack);
PATCH_PACK(BAPMC_Fixed_Wing_Crew_pack);
PATCH_PACK(BAPMC_Helicopter_Crew_pack);
PATCH_PACK(BAPMC_Vic_Crew_pack);
