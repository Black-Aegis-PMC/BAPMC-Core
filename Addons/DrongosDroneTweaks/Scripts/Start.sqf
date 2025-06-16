// Exclude units/groups with _x setVariable["ddtExclude",TRUE,TRUE];
sleep .1;

if(missionNamespace getVariable["ddtExit",FALSE])exitWith{};

ddtReady=FALSE;
ddtDebug=FALSE;
//ddtDebug=TRUE;

/*
// NOTE: This is overwritten by CBA settings
missionNamespace setVariable["ddtVisibility",.1,TRUE];
missionNamespace setVariable["ddtAudibility",.1,TRUE];
missionNamespace setVariable["ddtCycleRecon",30,TRUE];
missionNamespace setVariable["ddtCycleAttack",30,TRUE];
missionNamespace setVariable["ddtCycleRC40",30,TRUE];
missionNamespace setVariable["ddtSoftThreshold",100,TRUE];
missionNamespace setVariable["ddtCooldownValue",120,TRUE];
missionNamespace setVariable["ddtAttackRangeFPV",3000,TRUE];
missionNamespace setVariable["ddtAttackRangeBomber",1500,TRUE];
missionNamespace setVariable["ddtReconAlt",[100,200],TRUE];
missionNamespace setVariable["ddtReconRadius",[1000,2000],TRUE];
missionNamespace setVariable["ddtLoiterChance",50,TRUE];
//missionNamespace setVariable["ddtLoiterRadius",[200,900],TRUE];
missionNamespace setVariable["ddtExclusionRadiusRecon",2000];
missionNamespace setVariable["ddtExclusionRadiusFPV",3000];
missionNamespace setVariable["ddtExclusionRadiusBomber",1500];
*/

ddtJammers=["DDT_DroneJammerPack"];

//ddtDeploySides=[WEST,EAST,RESISTANCE];
ddtDeploySides=[];
ddtDeployBehaviour=[];

ddtClassesRecon=[
"B_UAV_02_lxWS",
"ION_UAV_02_lxWS",
"O_UAV_02_lxWS",
"I_UAV_02_lxWS",
"sps_black_hornet_01_Static_F", // item name
"sps_black_hornet_01_F", // vehicle name
"1Rnd_RC40_shell_RF", // mag name
"ItemMavic3T", // improved
"Mavic_3T_BLU", // improved
"Mavic_3T_OPF", // improved
"Mavic_3T_IND", // improved
"Item_Mavic3T", // mag name
"mavik_3T_BLU",
"mavik_3T_OPF",
"mavik_3T_IND"
];
//private _array=[];{_array pushBack(toUpper _x)}forEach ddtClassesRecon;ddtClassesRecon=[]+_array;

ddtClassesFPV=[
"B_Crocus_AP_Bag",
"O_Crocus_AP_Bag",
"I_Crocus_AP_Bag",
"B_SwitchBlade_300",
"SwitchBlade_300_Tube_Desert",
"SwitchBlade_300_Tube_Woodland",
"1Rnd_RC40_HE_shell_RF", // mag name
"B_CROCUS_AP",
"O_CROCUS_AP",
"I_CROCUS_AP"
];
//_array=[];{_array pushBack(toUpper _x)}forEach ddtClassesFPV;ddtClassesFPV=[]+_array;

ddtClassesFPVAT=[
"B_Crocus_AT_Bag",
"O_Crocus_AT_Bag",
"I_Crocus_AT_Bag",
"B_SwitchBlade_600",
"SwitchBlade_600_Tube_Desert",
"SwitchBlade_600_Tube_Woodland",
"B_CROCUS_AT",
"O_CROCUS_AT",
"I_CROCUS_AT",
"DRA_UAV_01_B",
"DRA_UAV_01_0",
"DRA_UAV_01_I"
];
//_array=[];{_array pushBack(toUpper _x)}forEach ddtClassesFPVAT;ddtClassesFPVAT=[]+_array;

ddtClassesBomber=[
"B_G_UAV_02_IED_lxWS",
"B_Tura_UAV_02_IED_lxWS",
"O_G_UAV_02_IED_lxWS",
"O_Tura_UAV_02_IED_lxWS",
"I_G_UAV_02_IED_lxWS",
"I_Tura_UAV_02_IED_lxWS",
"DRA_UAV_01G_B",
"DRA_UAV_01G_O",
"DRA_UAV_01G_I",
"ItemMavic3", // improved
"Mavic_3_BLU", // improved
"Mavic_3_OPF", // improved
"Mavic_3_IND", // improved
"Item_Mavic", // mag name
"mavik_3_BLU",
"mavik_3_OPF",
"mavik_3_IND",
"C_IDAP_UAV_06_antimine_F"
];
//_array=[];{_array pushBack(toUpper _x)}forEach ddtClassesBomber;ddtClassesBomber=[]+_array;

ddtClassesUGV=[
"UGV_02_Base_F"
];

DDT_fnc_Debug=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\Debug.sqf";

DDT_fnc_RemovePack=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\RemovePack.sqf";
DDT_fnc_FireRC40=compile preprocessFile"DrongosDroneTweaks\Scripts\RC40\Fire.sqf";
DDT_fnc_ReportContacts=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\ReportContacts.sqf";
DDT_fnc_Move=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\Move.sqf";
DDT_fnc_DroneGroupAlive=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\DroneGroupAlive.sqf";
DDT_fnc_TakeOff=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\TakeOff.sqf";

DDT_fnc_Loiter=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\Loiter.sqf";
DDT_fnc_RTB=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\AI_RTB.sqf";

DDT_fnc_DRAaimedAtTarget2=compile preprocessFile"DrongosDroneTweaks\Scripts\DRA\AimedAtTarget2.sqf";
DDT_fnc_DRAattack=compile preprocessFile"DrongosDroneTweaks\Scripts\DRA\Attack.sqf";
DDT_fnc_DRAguideDrone=compile preprocessFile"DrongosDroneTweaks\Scripts\DRA\Guide.sqf";

DDT_fnc_RC40recon=compile preprocessFile"DrongosDroneTweaks\Scripts\RC40\Recon.sqf";
lxRF_fnc_RC40_recon=compile preprocessFile"DrongosDroneTweaks\Scripts\RC40\RC40_recon.sqf";

DDT_fnc_InArray=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\InArray.sqf";

DDT_fnc_GetLocations=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\GetLocations.sqf";

DDT_fnc_GuideToTarget3=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\GuideToTarget3.sqf";
DDT_fnc_GuideToTargetBomber=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\GuideToTargetBomber.sqf";
DDT_fnc_GuideToTarget2=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\GuideToTarget2.sqf";
DDT_fnc_GuideToTarget=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\GuideToTarget.sqf";

DDT_fnc_GetTargetsBomber=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\GetTargetsBomber.sqf";
DDT_fnc_GetSoftTargets=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\GetSoftTargets.sqf";
DDT_fnc_GetTargetsAT=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\GetTargetsAT.sqf";

DDT_fnc_BackpackToDroneName=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\BackpackToDroneName.sqf";
DDT_fnc_BackpackIsFPV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\BackpackIsFPV.sqf";
DDT_fnc_BackpackIsFPVAT=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\BackpackIsFPVAT.sqf";
DDT_fnc_BackpackIsBomber=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\BackpackIsBomber.sqf";
DDT_fnc_BackpackIsRecon=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\BackpackIsRecon.sqf";
DDT_fnc_BackpackIsUGV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\BackpackIsUGV.sqf";

DDT_fnc_DroneIsFPV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\DroneIsFPV.sqf";
DDT_fnc_DroneIsFPVAT=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\DroneIsFPVAT.sqf";
DDT_fnc_DroneIsBomber=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\DroneIsBomber.sqf";
DDT_fnc_DroneIsRecon=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\DroneIsRecon.sqf";

DDT_fnc_ManGetUAV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\ManGetUAV.sqf";

DDT_fnc_FriendlyReconNear=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\FriendlyReconNear.sqf";
DDT_fnc_FriendlyFPVATNear=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\FriendlyFPVATNear.sqf";
DDT_fnc_FriendlyFPVNear=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\FriendlyFPVNear.sqf";
DDT_fnc_FriendlyBomberNear=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\FriendlyBomberNear.sqf";

DDT_fnc_PosIsInside=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\PosIsInside.sqf";
DDT_fnc_ManIsInside=compile preprocessFile"DrongosDroneTweaks\Scripts\Misc\ManIsInside.sqf";

DDT_fnc_ManHasFPV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\ManHasFPV.sqf";
DDT_fnc_ManHasFPVAT=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\ManHasFPVAT.sqf";
DDT_fnc_ManHasBomber=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\ManHasBomber.sqf";
DDT_fnc_ManHasRecon=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\ManHasRecon.sqf";
DDT_fnc_ManHasUGV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\ManHasUGV.sqf";

DDT_fnc_GroupHasFPV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\GroupHasFPV.sqf";
DDT_fnc_GroupHasFPVAT=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\GroupHasFPVAT.sqf";
DDT_fnc_GroupHasBomber=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\GroupHasBomber.sqf";
DDT_fnc_GroupHasRecon=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\GroupHasRecon.sqf";
DDT_fnc_GroupHasUGV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\GroupHasUGV.sqf";

DDT_fnc_ManHasRC40=compile preprocessFile"DrongosDroneTweaks\Scripts\RC40\ManHasRC40.sqf";
DDT_fnc_GroupHasRC40=compile preprocessFile"DrongosDroneTweaks\Scripts\RC40\GroupHasRC40.sqf";
DDT_fnc_ManHasRC40HE=compile preprocessFile"DrongosDroneTweaks\Scripts\RC40\ManHasRC40HE.sqf";
DDT_fnc_GroupHasRC40HE=compile preprocessFile"DrongosDroneTweaks\Scripts\RC40\GroupHasRC40HE.sqf";

DDT_fnc_DeployUAV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\DeployUAV.sqf";
DDT_fnc_GroupDeployUAV=compile preprocessFile"DrongosDroneTweaks\Scripts\Drones\GroupDeployUAV.sqf";

DDT_fnc_JamDrone=compile preprocessFile"DrongosDroneTweaks\Scripts\Jammers\JamDrone.sqf";
DDT_fnc_JammerPack=compile preprocessFile"DrongosDroneTweaks\Scripts\Jammers\JammerPack.sqf";
DDT_fnc_JammerObject=compile preprocessFile"DrongosDroneTweaks\Scripts\Jammers\JammerObject.sqf";

sleep .1;

[
    "ddtDebug", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Debug", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{
			ddtDebug=TRUE;publicVariable"ddtDebug";
		}else{
			ddtDebug=FALSE;publicVariable"ddtDebug";
		};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtCycleLength", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Time between check (RECON)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtCycleRecon",30]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtCycleRecon",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtCycleLengthAttack", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Time between check (FPV/GRENADE)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtCycleAttack",30]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtCycleAttack",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtCycleLengthRC40", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Time between check (RC40)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtCycleRC40",30]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtCycleRC40",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtReconAltCBA", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Altitude of recon drones [min,max]", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtReconAlt",[100,200]]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtReconAlt",(parseSimpleArray _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtReconRad", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Radius of recon drones [min,max]", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtReconRadius",[2000,4000]]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtReconRadius",(parseSimpleArray _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtLoiterChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Chance recon drones will loiter", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtLoiterChance",50]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtLoiterChance",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtRangeFPV", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Attack range FPV", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtAttackRangeFPV",3000]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtAttackRangeFPV",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtRangeBomber", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Attack range GRENADE", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtAttackRangeBomber",2000]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtAttackRangeBomber",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtCooldownSeconds", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Cooldown between attacks", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtCooldownValue",120]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtCooldownValue",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtExclusionRecon", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Exclusion radius RECON", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtExclusionRadiusRecon",1500]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtExclusionRadiusRecon",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtExclusionFPV", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Exclusion radius FPV", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtExclusionRadiusFPV",2000]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtExclusionRadiusFPV",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtExclusionBomber", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Exclusion radius GRENADE BOMBER", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtExclusionRadiusBomber",1000]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtExclusionRadiusBomber",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtSoftThreshold", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Max armour to be classed as soft vehicle", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    str(missionNamespace getVariable["ddtSoftThreshold",100]), // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
		missionNamespace setVariable["ddtSoftThreshold",(parseNumber _value),TRUE];
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;


[
    "ddtAR2XAP", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AR2X drones can also attack men", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{
			ddtClassesFPV=ddtClassesFPV+["DRA_UAV_01_B","DRA_UAV_01_0","DRA_UAV_01_I"];
		}else{
			ddtClassesFPV=ddtClassesFPV-["DRA_UAV_01_B","DRA_UAV_01_0","DRA_UAV_01_I"];
		};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

/*
[
    "ddtRC40s", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "AI use RC-40 HE rounds from Reaction Forces CDLC", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtRC40=_value};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;
*/

[
    "ddtSideWest", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable deploying drones for BLUFOR", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtDeploySides pushBack WEST}else{ddtDeploySides=ddtDeploySides-[WEST]};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtSideEast", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable deploying drones for OPFOR", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtDeploySides pushBack EAST}else{ddtDeploySides=ddtDeploySides-[EAST]};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtSideRes", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable deploying drones for INDFOR", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtDeploySides pushBack RESISTANCE}else{ddtDeploySides=ddtDeploySides-[RESISTANCE]};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtBehaviourCareless", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable deploying drones in CARELESS", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    FALSE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtDeployBehaviour pushBack"CARELESS"}else{ddtDeployBehaviour=ddtDeployBehaviour-["CARELESS"]};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtBehaviourSafe", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable deploying drones in SAFE", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtDeployBehaviour pushBack"SAFE"}else{ddtDeployBehaviour=ddtDeployBehaviour-["SAFE"]};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtBehaviourAware", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable deploying drones in AWARE", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtDeployBehaviour pushBack"AWARE"}else{ddtDeployBehaviour=ddtDeployBehaviour-["AWARE"]};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtBehaviourCombat", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable deploying drones in COMBAT", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtDeployBehaviour pushBack"COMBAT"}else{ddtDeployBehaviour=ddtDeployBehaviour-["COMBAT"]};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

[
    "ddtBehaviourStealth", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable deploying drones in STEALTH", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Drongo's Drone Tweaks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    FALSE, // data for this setting: [min, max, default, number of shown trailing decimals]
    TRUE, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params["_value"];
        if(_value)then{ddtDeployBehaviour pushBack"STEALTH"}else{ddtDeployBehaviour=ddtDeployBehaviour-["STEALTH"]};
    } // function that will be executed once on mission start and every time the setting is changed.
]call CBA_fnc_addSetting;

if!(isServer)exitWith{};
private _module=objNull;
if((count(entities"DDT_Options"))>0)then{
	_module=(entities"DDT_Options")select 0;
	private _num=-1;
	private _str="";
	private _arr=[];
	ddtDeploySides=[];
	ddtDeployBehaviour=[];
	ddtDebug=_module getVariable["DDT_Debug",FALSE];publicVariable"ddtDebug";
	_num=_module getVariable["DDT_DroneVisibility",.1];
	missionNamespace setVariable["ddtVisibility",_num,TRUE];
	_num=_module getVariable["DDT_DroneAudibility",.1];
	missionNamespace setVariable["ddtAudibility",_num,TRUE];
	if(_module getVariable["DDT_SideWest",FALSE])then{ddtDeploySides pushBackUnique WEST};
	if(_module getVariable["DDT_SideEast",FALSE])then{ddtDeploySides pushBackUnique EAST};
	if(_module getVariable["DDT_SideRes",FALSE])then{ddtDeploySides pushBackUnique RESISTANCE};
	if(_module getVariable["DDT_BehaviourCareless",FALSE])then{
		ddtDeployBehaviour pushBack"CARELESS";
	};
	if(_module getVariable["DDT_BehaviourSafe",FALSE])then{
		ddtDeployBehaviour pushBack"SAFE";
	};
	if(_module getVariable["DDT_BehaviourAware",FALSE])then{
		ddtDeployBehaviour pushBack"AWARE";
	};
	if(_module getVariable["DDT_BehaviourCombat",FALSE])then{
		ddtDeployBehaviour pushBack"COMBAT";
	};
	if(_module getVariable["DDT_BehaviourStealth",FALSE])then{
		ddtDeployBehaviour pushBack"STEALTH";
	};
	_num=_module getVariable["DDT_CycleRecon",30];
	missionNamespace setVariable["ddtCycleRecon",_num,TRUE];
	_num=_module getVariable["DDT_CycleAttack",30];
	missionNamespace setVariable["ddtCycleAttack",_num,TRUE];
	_num=_module getVariable["DDT_CycleRC40",30];
	missionNamespace setVariable["ddtCycleRC40",_num,TRUE];
	_arr=parseSimpleArray(_module getVariable["DDT_ReconAlt","[100,200]"]);
	missionNamespace setVariable["ddtReconAlt",_arr,TRUE];
	_arr=parseSimpleArray(_module getVariable["DDT_ReconRadius","[2000,4000]"]);
	missionNamespace setVariable["ddtReconRadius",_arr,TRUE];
	_num=_module getVariable["ddtLoiterChance",50];
	missionNamespace setVariable["ddtLoiterChance",_num,TRUE];
	_num=_module getVariable["DDT_RangeFPV",3000];
	missionNamespace setVariable["ddtAttackRangeFPV",_num,TRUE];
	_num=_module getVariable["DDT_RangeBomber",2000];
	missionNamespace setVariable["ddtAttackRangeBomber",_num,TRUE];
	_num=_module getVariable["DDT_CooldownAttack",120];
	missionNamespace setVariable["ddtCooldownValue",_num,TRUE];
	_num=_module getVariable["DDT_ExclusionRadiusRecon",1500];
	missionNamespace setVariable["ddtExclusionRadiusRecon",_num,TRUE];
	_num=_module getVariable["DDT_ExclusionRadiusFPV",2000];
	missionNamespace setVariable["ddtExclusionRadiusFPV",_num,TRUE];
	_num=_module getVariable["DDT_ExclusionRadiusBomber",1000];
	missionNamespace setVariable["ddtExclusionRadiusBomber",_num,TRUE];
	_num=_module getVariable["DDT_SoftThreshold",100];
	missionNamespace setVariable["ddtSoftThreshold",_num,TRUE];
	_num=_module getVariable["DDT_SoftThreshold",100];
	if(_module getVariable["DDT_AR2XAP",FALSE])then{
		ddtClassesFPV=ddtClassesFPV+["DRA_UAV_01_B","DRA_UAV_01_0","DRA_UAV_01_I"];
	}else{
		ddtClassesFPV=ddtClassesFPV-["DRA_UAV_01_B","DRA_UAV_01_0","DRA_UAV_01_I"];
	};
	{deleteVehicle _x}forEach(entities"DDT_Options");
};
publicVariable"ddtDebug";
publicVariable"ddtDeploySides";
publicVariable"ddtDeployBehaviour";

{
_module=_x;
private _cycle=_module getVariable["DDT_Cycle",60];
private _radius=_module getVariable["DDT_Radius",4000];
private _targetRange=_module getVariable["DDT_TargetRange",1000];
{
[(group _x),_cycle,_radius,_targetRange]execVM"DrongosDroneTweaks\Scripts\Infoshare\Loop.sqf";
}forEach(synchronizedObjects _module);
deleteVehicle _module;
}forEach(entities"DDT_Infoshare");
sleep 5;

private _delay=missionNamespace getVariable["ddtStartDelay",-1];
if(_delay>0)then{sleep _delay};

execVM"DrongosDroneTweaks\Scripts\Drones\Register.sqf";
//execVM"DrongosDroneTweaks\Scripts\Jammers\Register.sqf";
execVM"DrongosDroneTweaks\Scripts\Drones\DeployLoopRecon.sqf";
execVM"DrongosDroneTweaks\Scripts\Drones\DeployLoopAttack.sqf";

if(isClass(configFile>>"cfgPatches">>"RF_Data"))then{
	execVM"DrongosDroneTweaks\Scripts\RC40\DeployLoop.sqf";
};

sleep 1;
ddtReady=TRUE;
publicVariable"ddtReady";