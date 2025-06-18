  class I_Soldier_SL_F;
  class I_medic_F;
  class I_Soldier_F;
  class EMP_Offroad_Comms;
  class B_Heli_Light_01_dynamicLoadout_F;
  class B_Heli_Light_01_F;
  class B_UH60L_F;
  class B_UH60L_base_F;
  class B_MH60L_F: B_UH60L_base_F
  {
  		class Turrets: Turrets
		{
			class CopilotTurret;
			class MainTurret;
			class RightDoorGun;
    };
  };
  class B_HH60A_gray_doors_F: B_MH60L_F
  {
  		class Turrets: Turrets
		{
			class CopilotTurret;
			class MainTurret;
			class RightDoorGun;
    };
  };
  class B_UH60L_med_F: B_UH60L_F
  {
  		class Turrets: Turrets
		{
			class CopilotTurret;
			class MainTurret;
			class RightDoorGun;
    };
  };
  class UK3CB_BAF_Wildcat_AH1_TRN_8A;
  class UK3CB_BAF_Wildcat_AH1_8_Armed;
  class UK3CB_BAF_Wildcat_AH1_CAS_8C;
  class B_Heli_Transport_03_unarmed_F;
  class B_T_Truck_01_covered_F;
  class B_T_Truck_01_Repair_F;
  class B_T_Truck_01_mover_F;
  class B_T_Truck_01_medical_F;
  class B_T_Truck_01_fuel_F;
  class B_T_Truck_01_box_F;
  class B_T_Truck_01_ammo_F;
  class USAF_C130J_Cargo;
  class USAF_C130J;
  class C_Offroad_01_F;
  class Turrets;
  class USAF_AC130U_base;
  class USAF_AC130U: USAF_AC130U_base
  {
    class Turrets: Turrets
    {
      class CopilotTurret;
      class FlightEngTurret;
      class IRTurret;
      class TVTurret;
      class FCOTurret;
      class EWOTurret;
      class NavigatorTurret;
    };
  };
  class usaf_kc135;
  class UK3CB_BAF_Apache_AH1_Generic_MTP_RM;
  class I_C_Helipilot_F;
  class I_C_Pilot_F;
  class B_SSU_Kitbag_Black;
  class USP_REEBOW_3DAP_ACC9_BLK;
  class USP_45L_RUCKSACK;
  class UK3CB_BAF_Panther_GPMG_Green_A;
  class DAR_M1151WoodlandUA;
  class DAR_M1167Woodland;
  class DAR_M1152Woodland;
  class DAR_M115_MK19Woodland;
  class DAR_M1151Woodland;
  class UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B;
  class UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B;
  class UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_B;
  class UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_B;
  class UK3CB_BAF_Jackal2_L111A1_W;
  class UK3CB_BAF_Husky_Passenger_HMG_Green;
  class UK3CB_BAF_Husky_Passenger_GPMG_Green;
  class UK3CB_BAF_Husky_Passenger_GMG_Green;
  class DAR_M1152;
  class DAR_M1151;
  class DAR_M1151_Deploy;
  class DAR_M115_MK19;
  class DAR_HMMWV_Base;
  class DAR_M1165_GMV: DAR_HMMWV_Base
  {
    class AnimationSources: AnimationSources
    {
			class muzzle2_source;
			class muzzle2_source_rot;
			class ReloadAnim;
			class ReloadMagazine;
			class Gatling;
    };
  	class Turrets: Turrets
		{
			class MainTurret;
    };
  };
  class DAR_M1167;
  class UK3CB_BAF_Panther_GPMG_Sand_A;
  class UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A;
  class UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A;
  class UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Sand_A;
  class UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A;
  class UK3CB_BAF_Jackal2_L111A1_D;
  class UK3CB_BAF_Husky_Passenger_HMG_Sand;
  class UK3CB_BAF_Husky_Passenger_GPMG_Sand;
  class UK3CB_BAF_Husky_Passenger_GMG_Sand;
  class DEGA_ArmoredSUV_Base;
  class DEGA_ArmoredSUV_PMC: DEGA_ArmoredSUV_Base
  {
    class Turrets: Turrets
    {
      class MainTurret;
      class CargoTurret_1;
      class CargoTurret_2;
      class CargoTurret_3;
      class CargoTurret_4;
      class CargoTurret_5;
      class CargoTurret_6;
      class CargoTurret_7;
    };
  };
  class DEGA_GunArmoredSUV_PMC: DEGA_ArmoredSUV_Base
  {
    class Turrets: Turrets
    {
      class MainTurret;
      class CargoTurret_1;
      class CargoTurret_2;
      class CargoTurret_3;
      class CargoTurret_4;
      class CargoTurret_5;
      class CargoTurret_6;
      class CargoTurret_7;
    };
  };
