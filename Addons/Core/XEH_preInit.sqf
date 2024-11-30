/*
License GPL-2.0
*/
private _VS_core_settings = [
    [
		"VS_core_debug",
		"CHECKBOX",
		["Enable Debug", "Tick enable Viking Studios debug messages to appear in RPT and systemChat"],
		["Viking Studios Common", "Development"],
		false
	],
	[
		"VS_core_arsenal_objects",
		"EDITBOX",
		["Arsenal Objects", "Classnames, separated by commas and without double quotations, of objects that are spawnable by ""Add Filtered Arsenal"" module"],
		["Viking Studios Zeus", "Modules"],
		"C_supplyCrate_F,B_Slingload_01_Ammo_F"
	],
	[
		"VS_core_respawn_timer",
		"SLIDER",
		["Respawn Timer (seconds)", "Number of seconds player waves need to wait before respawn (0 -> 600 (10 minutes))"],
		["Viking Studios Zeus", "Respawn"],
		[1, 600, 5, 0],
		1,
		{
			setPlayerRespawnTime _this;
		}
	],
	[
		"VS_core_map_volume",
		"SLIDER",
		["Map Volume", "Volume to set when in a vehicle and looking at the map (so that you don't have to listen to loud as fuck helicopter rotors)"],
		"Viking Studios Common",
		[0, 1, 0.20, 2]
	],
	[
		"VS_core_arsenal_whitelist_mission",
		"EDITBOX",
		["Mission", "Mission specific equipment whitelist"],
		["Viking Studios Arsenal", "Arsenal Whitelists"],
		"[]",
		1,
		{
			// One day this will re-init all arsenals that have this filter set
		},
		true
	],
	[
        "VS_core_arsenal_whitelist_Standard",
        "EDITBOX",
        ["Standard", "Default equipment whitelist"],
        ["Viking Studios Arsenal", "Arsenal Whitelists"],
        "['ItemMap','ItemGPS','TFAR_anprc152','ItemCompass','ACE_Altimeter','ItemWatch','optic_Yorris','optic_Aco','optic_MRCO','optic_ERCO_blk_F','ACE_elasticBandage','ACE_packingBandage','ACE_adenosine','ACE_epinephrine','ACE_morphine','ACE_tourniquet','ACE_EarPlugs','ACE_EntrenchingTool','ACE_IR_Strobe_Item','ACE_Flashlight_XL50','ACE_MapTools','ACE_SpraypaintBlue','ACE_SpraypaintGreen','ACE_SpraypaintRed','ACE_SpraypaintBlack','ACE_wirecutter','ACE_CableTie','Chemlight_blue','Chemlight_green','ACE_Chemlight_IR','Chemlight_red','SmokeShell','acex_intelitems_notepad','ACE_HuntIR_M203','tsp_lockpick','optic_ACO_grn','optic_Aco','ACE_quikclot','VSM_LBT1961_Black','VSM_balaclava2_Black','VSM_Balaclava2_black_glasses','VSM_Balaclava2_black_Goggles','VSM_balaclava_Black','VSM_Balaclava_black_glasses','VSM_Balaclava_black_Goggles','G_Spectacles','fsob_Beard01_Brown','fsob_Beard01_Dark','fsob_Beard01_Light','fsob_Beard02_Brown','fsob_Beard02_Dark','fsob_Beard02_Light','fsob_Beard03_Brown','fsob_Beard03_Dark','fsob_Beard03_Light','tsp_breach_popper_mag','kat_Carbonate','kat_chestSeal','kat_Painkiller','rhsusf_mag_17Rnd_9x19_JHP','muzzle_snds_H','ACE_muzzle_mzls_L','Laserbatteries','sma_spitfire_01_black','sma_spitfire_01_sc_black','SMA_MICRO_T2_LM','SMA_MICRO_T2','SMA_ELCAN_SPECTER','SMA_ELCAN_SPECTER_RDS','SMA_ELCAN_SPECTER_ARDRDS','rhsusf_acc_premier','rhsusf_acc_premier_mrds','rhsusf_acc_premier_anpvs27','RKSL_optic_PMII_525','RKSL_optic_PMII_312','RKSL_optic_PMII_312_sunshade','RKSL_optic_LDS','UK3CB_BAF_Kite','SMA_eotech','SMA_ANPEQ15_BLK','SMA_ANPEQ15_TOP_BLK','SMA_ANPEQ15_TOP_417BLK','SMA_SFPEQ_HK417TOP_BLK','SMA_SFPEQ_HKTOP_BLK','SMA_SFPEQ_MK18TOP_BLK','SMA_SFPEQ_SCARTOP_BLK','SMA_SFPEQ_ACRTOP_BLK_LIGHT','SMA_SFPEQ_ACRTOP_BLK','rhsusf_acc_anpeq15side_bk','ACE_muzzle_mzls_B','muzzle_snds_B','SMA_supp1BB_556','SMA_supp1b_556','SMA_FLASHHIDER1','UK3CB_underbarrel_acc_afg','rhsusf_acc_grip2','sma_mk18afg','sma_mk18_gl','sma_acrblk','sma_acrgl_b','sma_hk416afg','sma_hk416gl','sma_hk416vfg','sma_hk416customcqbvfgb','sma_hk416glcqb_b','sma_hk416customcqbafgb','sma_hk417_16in','sma_minimi_mk3_762tsb','sma_minimi_mk3_762tlb','rhs_weap_m32','rhsusf_weap_MP7A2','rhs_weap_m40a5','rhs_weap_XM2010','rhs_weap_XM2010_wd','rhs_weap_M107','UK3CB_BAF_L129A1','uk3cb_baf_l128a1','uk3cb_baf_l119a1','uk3cb_baf_l119a1_cqb','UK3CB_BAF_L119A1_RIS','UK3CB_BAF_L119A1_UKUGL','uk3cb_baf_l118a1_covert_bl','uk3cb_baf_l118a1_covert','uk3cb_baf_l115a3','UK3CB_BAF_L115A3_BL','uk3cb_baf_l115a3_ghillie','uk3cb_baf_l115a3_bl_ghillie','uk3cb_baf_l7a2','1Rnd_SmokeOrange_Grenade_shell','rhs_mag_M397_HET','rhsusf_5Rnd_762x51_m993_Mag','UK3CB_BAF_762_200Rnd_T','1Rnd_SmokeGreen_Grenade_shell','UK3CB_BAF_762_L42A1_10Rnd_T''UK3CB_BAF_762_200Rnd','rhs_mag_M441_HE','rhsusf_5Rnd_300winmag_xm2010','1Rnd_SmokeBlue_Grenade_shell','UK3CB_BAF_762_L42A1_20Rnd_T','1Rnd_Smoke_Grenade_shell','UK3CB_BAF_762_L42A1_10Rnd','rhs_mag_M433_HEDP','UK3CB_BAF_762_100Rnd','rhsusf_mag_10Rnd_STD_50BMG_mk211','SMA_150Rnd_762_M80A1_Tracer','rhsusf_mag_10Rnd_STD_50BMG_M33','1Rnd_SmokeYellow_Grenade_shell','1Rnd_SmokeRed_Grenade_shell','1Rnd_SmokePurple_Grenade_shell','rhsusf_mag_17Rnd_9x19_FMJ','rhsusf_5Rnd_762x51_m118_special_Mag','SMA_150Rnd_762_M80A1','rhsusf_mag_40Rnd_46x30_FMJ','rhsusf_mag_40Rnd_46x30_JHP','UK3CB_BAF_338_5Rnd','UK3CB_BAF_762_L42A1_20Rnd','UK3CB_BAF_338_5Rnd_Tracer','50Rnd_570x28_SMG_03','UK3CB_BAF_762_100Rnd_T','UK3CB_BAF_12G_Slugs','rhsusf_mag_40Rnd_46x30_AP','UK3CB_BAF_12G_Pellets','rhsusf_5Rnd_762x51_m62_Mag','sma_mk16_black','sma_mk16_blackqcb','UK3CB_BAF_Silencer_L115A3','muzzle_snds_L','UK3CB_BAF_Silencer_L85','UK3CB_BAF_SFFH','SMA_supp_762','sma_gemtech_one_blk','SMA_supp2b_556','rhsusf_acc_M2010S','rhsusf_acc_rotex_mp7','muzzle_snds_570','Black_Crye_SS_Camo','Black_Black_SS_Camo','Multicam_black_casual_Camo','black_Crye_Camo','Black_Black_Camo','TRYK_U_B_PCUs','TRYK_U_B_PCUGs_BLK_R','TRYK_U_B_PCUGs_BLK','VSM_OGA_tan_casual_Camo','VSM_OGA_OD_casual_Camo','VSM_OGA_grey_casual_Camo','VSM_Scorpion_casual_Camo','Multicam_Arid_Black_casual_Camo','VSM_fasthelmet_black','VSM_highcutslick_black','dr_BLKfacp_op','dr_BLKlbt_op','dr_BLKpar_op','dr_BLKpar_br','dr_BLKlbt_br','dr_BLKfacp_br','BLK_MBSS_PACA','Black_Backpack_kitbag','VSM_SkiMask_Black','VSM_Facemask_black_glasses','VSM_Facemask_black_Goggles','VSM_FaceMask_black','VSM_FaceMask_Ghost','VSM_beard_3_hair','VSM_beard_3','VSM_beard_2_hair','VSM_beard_2','VSM_beard_hair','VSM_balaclava_Black_Skull','PB_Balaclava_black','G_Balaclava_blk','G_Balaclava_Halloween_01','G_Balaclava_Skull1','G_Balaclava_Scarecrow_01','G_Balaclava_TI_blk_F','G_Balaclava_TI_G_blk_F','G_Balaclava_BlueStrips','kat_Armband_Kat_Goggles','G_Tactical_Black','G_Spectacles_Tinted','G_Balaclava_lowprofile','G_Lowprofile','G_Bandanna_shades','G_Shades_Black','G_Shades_Red','G_Shades_Green','G_Shades_Blue','G_Bandanna_beast','G_Bandanna_blk','G_Bandanna_BlueFlame1','G_Bandanna_BlueFlame2','G_Bandanna_CandySkull','G_Bandanna_OrangeFlame1','G_Bandanna_RedFlame1','G_Bandanna_Skull1','G_Bandanna_Skull2','G_Bandanna_Vampire_01','Rangefinder','ACE_Chemlight_White','Chemlight_yellow','ACE_Chemlight_Orange','tsp_flashbang_m84','tsp_breach_linear_mag','kat_IV_16','kat_aatKit','kat_accuvac','kat_X_AED','kat_atropine','kat_amiodarone','kat_crossPanel','kat_plate','kat_BVM','kat_Caffeine','kat_clamp','ACE_DefusalKit','kat_EACA','kat_etomidate','kat_IO_FAST','kat_fentanyl','KAT_Empty_bloodIV_500','kat_flumazenil','kat_guedel','ACE_HuntIR_monitor','kat_ketamine','kat_larynx','kat_lidocaine','kat_lorazepam','ACE_Clacker','kat_suction','kat_nalbuphine','kat_naloxone','kat_nasal','kat_ncdKit','kat_nitroglycerin','kat_norepinephrine','kat_Penthrox','kat_Pervitin','kat_phenylephrine','kat_phenylephrineAuto','ACE_plasmaIV','ACE_plasmaIV_250','ACE_plasmaIV_500','kat_pocketBVM','kat_oxygenTank_150','ACE_surgicalKit','kat_stethoscope','ACE_SpareBarrel','kat_scalpel','ACE_salineIV_250','kat_retractor','kat_Pulseoximeter','ToolKit','kat_TXA','ACE_splint','ACE_VMM3','sma_mk17_16_black','sma_mk16_eglm_black','rhs_weap_rpg7','UK3CB_BAF_AT4_CS_AP_Launcher','tsp_breach_linear_auto_mag','tsp_breach_popper_auto_mag','launch_MRAWS_green_F','launch_MRAWS_olive_F','launch_MRAWS_sand_F','MRAWS_HEAT_F','MRAWS_HEAT55_F','MRAWS_HE_F','optic_DMS','rhsusf_acc_M8541','rhsusf_acc_M8541_mrds','DemoCharge_Remote_Mag','ClaymoreDirectionalMine_Remote_Mag','APERSMineDispenser_Mag','rhs_acc_pgo7v3','rhs_rpg7_OG7V_mag','rhs_rpg7_PG7VL_mag','rhs_rpg7_PG7V_mag','rhs_rpg7_PG7VM_mag','rhs_rpg7_PG7VR_mag','rhs_rpg7_PG7VS_mag','rhs_rpg7_TBG7V_mag','SmokeShellYellow','SmokeShellRed','SmokeShellPurple','SmokeShellOrange','SmokeShellGreen','SmokeShellBlue','rhs_mag_m18_red','rhs_mag_m18_purple','rhs_mag_m18_green','ACE_suture','UK3CB_BAF_Javelin_Slung_Tube','UK3CB_BAF_Javelin_CLU','UK3CB_underbarrel_acc_grippod','rhsusf_acc_grip1','UK3CB_underbarrel_acc_fgrip','UK3CB_underbarrel_acc_fgrip_bipod','rhsusf_acc_grip3','tsp_breach_package_mag','tsp_breach_block_mag','tsp_breach_block_auto_mag','muzzle_snds_acp','ACE_muzzle_mzls_smg_01','rhsusf_mag_7x45acp_MHP','rhsusf_mag_15Rnd_9x19_FMJ','rhsusf_mag_15Rnd_9x19_JHP','UK3CB_underbarrel_acc_bipod','SMA_Gripod_01','rhsusf_acc_harris_swivel','clf_black_prc117g_co','rhsusf_hgu56p_visor_mask_Empire_black','ACE_Vector','ACE_SpottingScope','ACE_ATragMX','ACE_Kestrel4500','ACE_Tripod','U_O_R_Gorka_01_black_F','V_PlateCarrier1_blk','ACE_UAVBattery','Laserbatteries','ACE_rope6','ACE_rope36','ACE_rope3','ACE_rope27','ACE_rope18','ACE_rope15','ACE_rope12','ace_marker_flags_blue','ace_marker_flags_red','VS_C_ED_1E_Item','VS_C_ED_1D_Item','VS_C_AR2_Item','I_UavTerminal','KAT_Katmin','kat_ultrasound','sma_aug_a3_f','rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger','rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger_Tracer_Red','SMA_supp1BB_556','sma_aug_eglm','muzzle_snds_L','rhsusf_acc_nt4_black','QIN_CZ_BREN2_556_8','QIN_CZ_BREN2_556_14_GL','QIN_CZ_BREN2_556_14','QIN_CZ_BREN2_556_11_GL','QIN_CZ_BREN2_556_11','30Rnd_762x39_Mag_F','QIN_CZ_BREN2_762_8','QIN_CZ_BREN2_762_14_GL','QIN_CZ_BREN2_762_14','rhs_weap_g36kv_ag36','rhs_weap_g36kv','rhssaf_30rnd_556x45_EPR_G36','rhssaf_30rnd_556x45_Tracers_G36','rhs_weap_g36c','SMG_01_F','30Rnd_45ACP_Mag_SMG_01','30Rnd_45ACP_Mag_SMG_01_Tracer_Red','SMA_AAC_MPW_9_Black','SMA_30Rnd_762x35_BLK_EPR','SMA_AAC_MPW_12_Black','16Rnd_9x21_Mag','16Rnd_9x21_red_Mag','hgun_Rook40_F','rhsusf_acc_omega9k','30Rnd_45ACP_Mag_SMG_01','UK3CB_FNFAL_OSW','UK3CB_FNFAL_20rnd_762x51','UK3CB_Bren_30Rnd_762x51_Magazine','UK3CB_FNFAL_30rnd_762x51','UK3CB_V_Pilot_Vest_Black','Uniform_Coveralls_GRANITEB','UK3CB_BAF_H_CrewHelmet_B','rhsusf_hgu56p_visor_black','rhsusf_hgu56p_black','UK3CB_CW_US_B_LATE_U_SF_CombatUniform_01_BLK','UK3CB_MEE_O_U_07_B','unv_black_big_rt1523g','UK3CB_ION_B_B_RIF_MED_BLK','rhs_mag_m67','rhsusf_weap_glock17g4','hlc_rifle_m27iar','hlc_rifle_acr_carb_black','SMG_02_F','USP_GPNVG18_WP_CB2_BLK','USP_GPNVG18_CB2_TAR_BLK','USP_GPNVG18_WP_CB2_TAR_BLK','USP_GPNVG18_WP_CB3_BLK','USP_GPNVG18_WP_BLK','USP_GPNVG18_WP_BLK2','USP_GPNVG18_BLK','USP_GPNVG18_BLK2','rhs_weap_m14ebrri','UK3CB_M14_20rnd_762x51','UK3CB_M14_20rnd_762x51_RT','UK3CB_MG3_Railed','UK3CB_MG3','UK3CB_MG3_KWS_B','UK3CB_MG3_100rnd_762x51','UK3CB_MG3_100rnd_762x51_R','UK3CB_MG3_100rnd_762x51_RM','hlc_smg_mp5n_tac','hlc_30Rnd_9x19_B_MP5','hlc_30Rnd_9x19_GD_MP5','hlc_30Rnd_9x19_SD_MP5','hlc_smg_mp5sd6','rhsusf_weap_MP7A2','UK3CB_P90_50rnd_570x28_Magazine','UK3CB_P90_50rnd_570x28_Magazine_RM','UK3CB_P90_50rnd_570x28_Magazine_RT','UK3CB_P90C_TR_black','UK3CB_P90_TR_black','hlc_rifle_falosw','hlc_rifle_osw_gl','hlc_30Rnd_762x51_B_L4','hlc_30rnd_762x51_MDIM_L4','hlc_30rnd_762x51_M_L4','UK3CB_CZ75','UK3CB_CZ75_9_20Rnd','rhsusf_weap_m9','rhsusf_weap_m1911a1','UK3CB_BAF_NLAW_Launcher','rhs_weap_fim92','rhs_fim92_mag','UK3CB_BAF_Soflam_Laserdesignator','UK3CB_ION_B_U_Tshirt_Uniform_01_URB','UK3CB_V_MBAV_LIGHT_BLK','UK3CB_V_MBAV_MG_BLK','UK3CB_V_MBAV_MEDIC_BLK','UK3CB_V_MBAV_RIFLEMAN_BLK','VSM_fast_helmet_covermcblack','VSM_Black_OPS','BLK2_opscore','VSM_Black_OPS_2','BLK_opscore_2','rhsusf_hgu56p_mask_black_skull','rhsusf_hgu56p_visor_mask_black_skull','USP_BASEBALL_CAPB_BLK_CD','USP_BASEBALL_CAPB_MCB_CD','USP_BASEBALL_CAPB_BLK','USP_BASEBALL_CAPB_MCB','USP_BASEBALL_CAP_BLK_CD','USP_BASEBALL_CAP_MCB_CD']",
        1,
        {
            // One day this will re-init all arsenals that have this filter set
        },
        true
    ],
	[
        "VS_core_arsenal_blacklist_cdt",
        "EDITBOX",
        ["Cadet", "Cadet equipment Restrictions"],
        ["Viking Studios Arsenal Restrictions", "Blacklist"],
        "[]",
        1,
        {
        },
        true
    ],
	[
        "VS_core_arsenal_blacklist_rct",
        "EDITBOX",
        ["Recruit", "Recruit equipment Restrictions"],
        ["Viking Studios Arsenal Restrictions", "Blacklist"],
        "[]",
        1,
        {
        },
        true
    ],
	[
        "VS_core_arsenal_blacklist_pvt",
        "EDITBOX",
        ["Private", "Private equipment Restrictions"],
        ["Viking Studios Arsenal Restrictions", "Blacklist"],
        "[]",
        1,
        {
        },
        true
    ],
	[
        "VS_core_arsenal_allowlist_ic",
        "EDITBOX",
        ["IC", "IC equipment Additions"],
        ["Viking Studios Arsenal Restrictions", "Allowlist"],
        "[]",
        1,
        {
        },
        true
    ],
		[
        "VS_core_arsenal_allowlist_medic",
        "EDITBOX",
        ["Medic", "Medic equipment Additions"],
        ["Viking Studios Arsenal Restrictions", "Allowlist"],
        "[]",
        1,
        {
        },
        true
    ],
		[
        "VS_core_arsenal_allowlist_surgeon",
        "EDITBOX",
        ["Surgeon", "Surgeon equipment Additions"],
        ["Viking Studios Arsenal Restrictions", "Allowlist"],
        "[]",
        1,
        {
        },
        true
    ]
];

{_x call CBA_Settings_fnc_init;} forEach _VS_core_settings;
CHVD_allowNoGrass = false;
