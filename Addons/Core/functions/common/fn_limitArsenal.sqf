/* ----------------------------------------------------------------------------
	Function: vs_core_fnc_limitArsenal
	
	Description:
	Limits arsenal based on player rank
	
	Parameters:
	0: _player
	
	Returns:
	Nothing.
	
	Examples:
	[player] call vs_core_fnc_limitArsenal;
	
	Author:
	Met
	License GPL-2.0
---------------------------------------------------------------------------- */
params [["_player", player, [objNull]]];

if (isNull _player) exitWith {
	diag_log "[vs_core_fnc_limitArsenal] invalid player";
	false
};


private _ranks = [
	["cdt", ["VSM_fasthelmet_black","PMCA_tanktop_uniform_t_b","PMCA_tanktop_uniform_o_b","PMCA_tanktop_uniform_g_b","CUP_I_B_PMC_Unit_20","PMCA_tanktop_uniform_b_b","CUP_I_B_PMC_Unit_17","PMCA_sweater_uniform_t_b","CUP_I_B_PMC_Unit_7","PMCA_sweater_uniform_o_b","PMCA_sweater_uniform_g_b","CUP_I_B_PMC_Unit_42","PMCA_sweater_uniform_b_b","CUP_I_B_PMC_Unit_24","CUP_I_B_PMC_Unit_24","CUP_I_B_PMC_Unit_13","CUP_I_B_PMC_Unit_3","CUP_I_B_PMC_Unit_11","dr_BLKpar_op","dr_BLKlbt_op","VKN_LBT6094_Operator_Loki","VKN_RAV_Operator_Loki","VKN_FAPC_Gunner_Black_Medical","dr_BLKfacp_op","kat_Armband_Kat_Goggles","VSM_FaceMask_black","CUP_PMC_Facewrap_Black","VSM_Facemask_black_glasses","CUP_G_PMC_Facewrap_Black_Glasses_Dark_Headset","VSM_Facemask_black_Goggles","CUP_G_PMC_Facewrap_Black_Glasses_Ember","CUP_PMC_Facewrap_Red","CUP_PMC_Facewrap_Tan","CUP_G_PMC_Facewrap_Tan_Glasses_Dark_Headset","ACE_HuntIR_monitor","CUP_G_PMC_Facewrap_Tan_Glasses_Ember","CUP_PMC_Facewrap_Tropical","CUP_G_PMC_Facewrap_Tropical_Glasses_Dark_Headset","CUP_G_PMC_Facewrap_Tropical_Glasses_Dark","CUP_G_PMC_Facewrap_Tropical_Glasses_Ember","kat_IV_16","kat_X_AED","kat_amiodarone","ACE_quikclot","kat_plate","kat_BVM","kat_clamp","kat_EACA","kat_etomidate","kat_IO_FAST","kat_fentanyl","KAT_Empty_bloodIV_500","kat_flumazenil","kat_guedel","kat_ketamine","kat_larynx","kat_lidocaine","kat_lorazepam","kat_suction","kat_nalbuphine","kat_naloxone","kat_nasal","kat_ncdKit","kat_nitroglycerin","kat_norepinephrine","kat_phenylephrine","ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","kat_pocketBVM","kat_Pulseoximeter","kat_retractor","ACE_salineIV_250","kat_scalpel","kat_stethoscope","ACE_surgicalKit","kat_TXA","kat_accuvac","kat_aatKit","ACE_DefusalKit","ToolKit","optic_DMS","UK3CB_BAF_Kite","RKSL_optic_LDS","CUP_optic_LeupoldMk4_20x40_LRT","CUP_optic_LeupoldMk4_25x50_LRT","rhsusf_acc_M8541","rhsusf_acc_M8541_mrds","rhsusf_acc_premier_anpvs27","rhsusf_acc_premier","rhsusf_acc_premier_mrds","RKSL_optic_PMII_312","RKSL_optic_PMII_312_sunshade","RKSL_optic_PMII_525","CUP_optic_SB_11_4x20_PM","CUP_optic_SB_3_12x50_PMII","VKN_Stealth_Balaclava_BLK","VKN_CombatUniform_Black_Loki","VSM_balaclava_Black_Skull","VKN_CombatUniform_TshirtB_Green","VKN_RAV_Breacher_Loki","VKN_B_OPS_Loki_alt","dr_BLKfacp_br","VKN_B_OPS_Black","VSM_balaclava_Black","VKN_CombatUniform_TshirtB_Multi","dr_BLKlbt_br","VKN_B_OPS_Loki","VKN_CombatUniform_TshirtB_Tan","dr_BLKpar_br","VKN_Black_Tshirt","TRYK_U_B_PCUGs_BLK","TRYK_U_B_PCUGs_BLK_R","TRYK_U_B_PCUs","VKN_CombatUniform_Tactical_Sweater_7","Black_Black_Camo","black_Crye_Camo","Multicam_Arid_Black_casual_Camo","Multicam_black_casual_Camo","Multicam_black_casual_Camo","VSM_OGA_grey_casual_Camo","VSM_OGA_OD_casual_Camo","VSM_OGA_tan_casual_Camo","VSM_Scorpion_casual_Camo","CUP_I_B_PMC_Unit_14","G_Balaclava_TI_blk_F","CUP_RUS_Balaclava_blk","G_Balaclava_TI_G_blk_F","VSM_Balaclava_black_glasses","VSM_Balaclava_black_Goggles","VSM_balaclava2_Black","VSM_Balaclava2_black_glasses","CUP_H_PMC_Cap_Back_Grey","G_Balaclava_blk","G_Balaclava_lowprofile","VSM_Balaclava2_black_Goggles","PB_Balaclava_black","VKN_CombatUniform_Black_Loki","TRYK_U_B_PCUGs_BLK","TRYK_U_B_PCUGs_BLK_R","TRYK_U_B_PCUs","VKN_CombatUniform_Tactical_Sweater_7","Black_Black_Camo","black_Crye_Camo","Black_Black_SS_Camo","Black_Crye_SS_Camo","dr_BLKpar_br","dr_BLKlbt_br","VKN_RAV_Breacher_Loki","dr_BLKfacp_br","VSM_SkiMask_Black","G_Balaclava_BlueStrips","CUP_PMC_Facewrap_Skull","G_Balaclava_Halloween_01","CUP_PMC_Facewrap_Smilie","G_Balaclava_Scarecrow_01","G_Balaclava_Skull1","G_Bandanna_beast","G_Bandanna_BlueFlame1","CUP_G_ESS_RGR_Facewrap_Skull","G_Bandanna_Vampire_01","G_Bandanna_Skull2","G_Bandanna_BlueFlame2","G_Bandanna_CandySkull","G_Bandanna_Skull1","G_Bandanna_OrangeFlame1","G_Bandanna_RedFlame1", "VSM_balaclava_Black_Skull", "VSM_FaceMask_Ghost","VKN_v_blackops_rt_1523g","VKN_v_blackops_nicecomm2","VKN_v_loki_nicecomm2","VKN_Kitbag_Black_Medical","Chemlight_blue","Chemlight_green","ACE_Chemlight_IR","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_White","Chemlight_yellow","rhs_mag_m18_green","rhs_mag_m18_purple","rhs_mag_m18_red","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellYellow","tsp_flashbang_m84","tsp_breach_package_mag","APERSMineDispenser_Mag","CUP_Mine_M","tsp_breach_block_mag","tsp_breach_block_auto_mag","tsp_breach_linear_mag","tsp_breach_linear_auto_mag","DemoCharge_Remote_Mag","ClaymoreDirectionalMine_Remote_Mag","kat_Penthrox","kat_Pervitin","kat_oxygenTank_150","ACE_splint", "ACE_SpraypaintBlack", "ACE_SpraypaintGreen", "ACE_SpraypaintRed", "ACE_suture","CUP_smg_BallisticShield_MP7","uk3cb_baf_l115a3","cup_lmg_mg3","cup_lmg_mg3_rail","sma_minimi_mk3_762tlb","sma_minimi_mk3_762tsb","sma_mk18afg","CUP_hgun_Colt1911","sma_mk18_gl","CUP_hgun_M9","cup_smg_mp5a5","ACE_VMM3","CUP_smg_MP5A5_Rail","CUP_smg_MP5A5_Rail_VFG","CUP_smg_MP5A5_Rail_AFG","cup_smg_mp5sd6","cup_smg_mp7","rhsusf_weap_MP7A2","cup_smg_p90_black","cup_smg_ps90_olive","sma_mk17_16_black","sma_mk16_blackqcb","sma_mk16_black","sma_mk16_eglm_black","UK3CB_BAF_Javelin_Slung_Tube","launch_MRAWS_green_F","launch_MRAWS_olive_F","launch_MRAWS_sand_F","rhs_weap_rpg7","UK3CB_BAF_Javelin_CLU","Rangefinder","uk3cb_baf_l7a2","cup_arifle_acr_dmr_blk_556","sma_hk416gl","sma_hk416glcqb_b","sma_hk417_16in","UK3CB_BAF_L115A3_BL","uk3cb_baf_l115a3_ghillie","uk3cb_baf_l118a1_covert","uk3cb_baf_l115a3_bl_ghillie","uk3cb_baf_l118a1_covert_bl","uk3cb_baf_l119a1","uk3cb_baf_l119a1_cqb","UK3CB_BAF_L119A1_UKUGL","UK3CB_BAF_L119A1_RIS","uk3cb_baf_l128a1","UK3CB_BAF_L129A1","cup_sgun_m1014_vfg","cup_sgun_m1014","cup_sgun_m1014_solidstock","cup_sgun_m1014_entry","cup_sgun_m1014_entry_vfg","rhs_weap_M107","cup_srifle_m110_kac_black","cup_srifle_m110_black","rhs_weap_XM2010","rhs_weap_XM2010_wd","cup_arifle_hk_m27_ag36","rhs_weap_m32","rhs_weap_m40a5","sma_acrblk","sma_acrgl_b","VKN_B_OPS_Black_alt","VSM_highcutslick_black","CUP_G_ESS_BLK_Facewrap_Black","CUP_G_ESS_BLK_Facewrap_Black_GPS","CUP_G_ESS_CBR_Facewrap_Red","CUP_G_ESS_KHK_Facewrap_Tan","CUP_G_ESS_RGR_Facewrap_Tropical","CUP_G_PMC_Facewrap_Black_Glasses_Dark","CUP_G_PMC_Facewrap_Black_Glasses_Dark_Headset","CUP_G_PMC_Facewrap_Tan_Glasses_Dark","CUP_G_PMC_Facewrap_Tan_Glasses_Dark_Headset","VKN_B_OPS_BLACK_alt"]],
	["rct", ["VKN_Stealth_Balaclava_BLK","VKN_CombatUniform_Black_Loki","VSM_balaclava_Black_Skull","VKN_CombatUniform_TshirtB_Green","VKN_RAV_Breacher_Loki","VKN_B_OPS_Loki_alt","dr_BLKfacp_br","VKN_B_OPS_Black","VSM_balaclava_Black","VKN_CombatUniform_TshirtB_Multi","dr_BLKlbt_br","VKN_B_OPS_Loki","VKN_CombatUniform_TshirtB_Tan","dr_BLKpar_br","VKN_Black_Tshirt","TRYK_U_B_PCUGs_BLK","TRYK_U_B_PCUGs_BLK_R","TRYK_U_B_PCUs","VKN_CombatUniform_Tactical_Sweater_7","Black_Black_Camo","black_Crye_Camo","Multicam_Arid_Black_casual_Camo","Multicam_black_casual_Camo","Multicam_black_casual_Camo","VSM_OGA_grey_casual_Camo","VSM_OGA_OD_casual_Camo","VSM_OGA_tan_casual_Camo","VSM_Scorpion_casual_Camo","CUP_I_B_PMC_Unit_14","G_Balaclava_TI_blk_F","CUP_RUS_Balaclava_blk","G_Balaclava_TI_G_blk_F","VSM_Balaclava_black_glasses","VSM_Balaclava_black_Goggles","VSM_balaclava2_Black","VSM_Balaclava2_black_glasses","CUP_H_PMC_Cap_Back_Grey","G_Balaclava_blk","G_Balaclava_lowprofile","VSM_Balaclava2_black_Goggles","PB_Balaclava_black","VKN_CombatUniform_Black_Loki","TRYK_U_B_PCUGs_BLK","TRYK_U_B_PCUGs_BLK_R","TRYK_U_B_PCUs","VKN_CombatUniform_Tactical_Sweater_7","Black_Black_Camo","black_Crye_Camo","Black_Black_SS_Camo","Black_Crye_SS_Camo","dr_BLKpar_br","dr_BLKlbt_br","VKN_RAV_Breacher_Loki","dr_BLKfacp_br","VSM_SkiMask_Black","G_Balaclava_BlueStrips","CUP_PMC_Facewrap_Skull","G_Balaclava_Halloween_01","CUP_PMC_Facewrap_Smilie","G_Balaclava_Scarecrow_01","G_Balaclava_Skull1","G_Bandanna_beast","G_Bandanna_BlueFlame1","CUP_G_ESS_RGR_Facewrap_Skull","G_Bandanna_Vampire_01","G_Bandanna_Skull2","G_Bandanna_BlueFlame2","G_Bandanna_CandySkull","G_Bandanna_Skull1","G_Bandanna_OrangeFlame1","G_Bandanna_RedFlame1", "VSM_balaclava_Black_Skull", "VSM_FaceMask_Ghost","VKN_B_OPS_BLACK_alt"]],
	["pvt", ["VKN_CombatUniform_Black_Loki","TRYK_U_B_PCUGs_BLK","TRYK_U_B_PCUGs_BLK_R","TRYK_U_B_PCUs","VKN_CombatUniform_Tactical_Sweater_7","Black_Black_Camo","black_Crye_Camo","Black_Black_SS_Camo","Black_Crye_SS_Camo","dr_BLKpar_br","dr_BLKlbt_br","VKN_RAV_Breacher_Loki","dr_BLKfacp_br","VSM_SkiMask_Black","G_Balaclava_BlueStrips","CUP_PMC_Facewrap_Skull","G_Balaclava_Halloween_01","CUP_PMC_Facewrap_Smilie","G_Balaclava_Scarecrow_01","G_Balaclava_Skull1","G_Bandanna_beast","G_Bandanna_BlueFlame1","CUP_G_ESS_RGR_Facewrap_Skull","G_Bandanna_Vampire_01","G_Bandanna_Skull2","G_Bandanna_BlueFlame2","G_Bandanna_CandySkull","G_Bandanna_Skull1","G_Bandanna_OrangeFlame1","G_Bandanna_RedFlame1", "VSM_balaclava_Black_Skull", "VSM_FaceMask_Ghost"]]
];

private _playername = toLower name _player;
private _splitName = _playerName splitString ". ";

if (count _splitName < 2) exitWith {
	diag_log format ["[vs_core_fnc_limitArsenal] player name '%1' does not contain a rank.", _playerName];
	false
};

private _playerRank = _splitName select 0;

private _blacklistedItems = [];
{
	if (_x select 0 == _playerRank) then {
		_blacklistedItems = _x select 1;
	};
} forEach _ranks;

{
	if (!isNil {
		_x getVariable "ace_arsenal_virtualItems"
	}) then {
		[_x, _blacklistedItems, false] call ace_arsenal_fnc_removeVirtualItems;
		diag_log format ["Object %1 has ace_arsenal_virtualItems", _x];
	};
} forEach allMissionObjects "All";