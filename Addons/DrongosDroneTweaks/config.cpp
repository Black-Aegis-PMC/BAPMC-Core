class CfgPatches
{
	class DrongosDroneTweaks
	{
		author="Drongo";
		name="Drongo's Drone Tweaks";
		units[]={"DDT_Options","DDT_Infoshare"};
		weapons[]={};
		requiredAddons[]={"A3_Air_F_Exp_UAV_04","cba_main"};
	};
};

class Extended_PostInit_EventHandlers 
{
	ddtInit="execVM'\DrongosDroneTweaks\Scripts\Start.sqf'";
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class DDT_faction: NO_CATEGORY
	{
		displayName="Drongo's Drone Tweaks";
		priority=0.1;
		side=7;
	};
};

class CfgVehicleClasses
{
	class DDT_class
	{
		displayName="DDT class";
	};
};

class cfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
            class Edit; //Text input
            class Combo; //Drop down list
            class CheckBox; //Checkbox that returns true or false
            class CheckboxNumber; //Checkbox that returns 1 or 0
            class ModuleDescription; //Description of module
        };
        class ModuleDescription
        {
            class Anything;
        };
    };

	class DDT_Options: Module_F
	{
		scope=2;
		displayName="Options";
		icon = "\A3\ui_f\data\map\markers\nato\n_uav.paa";
		category="DDT_faction";
		function="";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class DDT_Debug: Checkbox
			{
				property="DDT_Debug";
				displayName="Debug";
				tooltip="Show debug text";
				typeName="BOOL";
			};
			class DDT_DroneVisibility: Edit
			{
				property="DDT_DroneVisibility";
				displayName="Drone visibility";
				tooltip="setUnitTrait camouflageCoef setting (0-1, see BIKI)";
				typeName="NUMBER";
				defaultValue=".1";
			};
			class DDT_DroneAudibility: Edit
			{
				property="DDT_DroneAudibility";
				displayName="Drone audibility";
				tooltip="setUnitTrait audibleCoef setting (0-1, see BIKI)";
				typeName="NUMBER";
				defaultValue=".1";
			};
			class DDT_SideWest: Checkbox
			{
				property="DDT_SideWest";
				displayName="West";
				tooltip="Use system for WEST";
				typeName="BOOL";
				defaultValue="TRUE";
			};
			class DDT_SideEast: Checkbox
			{
				property="DDT_SideEast";
				displayName="East";
				tooltip="Use system for EAST";
				typeName="BOOL";
				defaultValue="TRUE";
			};
			class DDT_SideRes: Checkbox
			{
				property="DDT_SideRes";
				displayName="Resistance";
				tooltip="Use system for RESISTANCE";
				typeName="BOOL";
				defaultValue="TRUE";
			};
			class DDT_BehaviourCareless: Checkbox
			{
				property="DDT_BehaviourCareless";
				displayName="Careless";
				tooltip="Launch drones when CARELESS";
				typeName="BOOL";
			};
			class DDT_BehaviourSafe: Checkbox
			{
				property="DDT_BehaviourSafe";
				displayName="Safe";
				tooltip="Launch drones when SAFE";
				typeName="BOOL";
				defaultValue="TRUE";
			};
			class DDT_BehaviourAware: Checkbox
			{
				property="DDT_BehaviourAware";
				displayName="Aware";
				tooltip="Launch drones when AWARE";
				typeName="BOOL";
				defaultValue="TRUE";
			};
			class DDT_BehaviourCombat: Checkbox
			{
				property="DDT_BehaviourCombat";
				displayName="Combat";
				tooltip="Launch drones when COMBAT";
				typeName="BOOL";
				defaultValue="TRUE";
			};
			class DDT_BehaviourStealth: Checkbox
			{
				property="DDT_BehaviourStealth";
				displayName="Stealth";
				tooltip="Launch drones when STEALTH";
				typeName="BOOL";
			};
			class DDT_CycleRecon: Edit
			{
				property="DDT_CycleRecon";
				displayName="Cycle (recon)";
				tooltip="Seconds between checks (recon)";
				typeName="NUMBER";
				defaultValue="30";
			};
			class DDT_CycleAttack: Edit
			{
				property="DDT_CycleAttack";
				displayName="Cycle (FPV/grenade)";
				tooltip="Seconds between checks (FPV and grenade drones)";
				typeName="NUMBER";
				defaultValue="30";
			};
			class DDT_CycleRC40: Edit
			{
				property="DDT_CycleRC40";
				displayName="Cycle (RC40 HE)";
				tooltip="Seconds between checks (RC40 HE drones)";
				typeName="NUMBER";
				defaultValue="30";
			};
			class DDT_ReconAlt: Edit
			{
				property="DDT_ReconAlt";
				displayName="Recon altitude";
				tooltip="Altitude of recon drones [min,max]";
				typeName="STRING";
				defaultValue="""[100,200]""";	
			};
			class DDT_ReconRadius: Edit
			{
				property="DDT_ReconRadius";
				displayName="Recon radius";
				tooltip="Radius of recon drones [min,max]";
				typeName="STRING";
				defaultValue="""[2000,4000]""";	
			};
			class DDT_LoiterChance: Edit
			{
				property="DDT_LoiterChance";
				displayName="Loiter chance (recon)";
				tooltip="Chance a recon drone will loiter instead of patrol";
				typeName="NUMBER";
				defaultValue="50";
			};
			class DDT_RangeFPV: Edit
			{
				property="DDT_RangeFPV";
				displayName="Range (FPV)";
				tooltip="Range for FPV drones";
				typeName="NUMBER";
				defaultValue="3000";
			};
			class DDT_RangeBomber: Edit
			{
				property="DDT_RangeBomber";
				displayName="Range (Grenade)";
				tooltip="Range for grenade-drop drones";
				typeName="NUMBER";
				defaultValue="2000";
			};
			class DDT_CooldownAttack: Edit
			{
				property="DDT_CooldownAttack";
				displayName="Cooldown (Attack)";
				tooltip="Seconds between a group launching drone attacks";
				typeName="NUMBER";
				defaultValue="120";
			};
			class DDT_ExclusionRadiusRecon: Edit
			{
				property="DDT_ExclusionRadiusRecon";
				displayName="Exclusion radius (Recon)";
				tooltip="Drones will not be deployed if one exists in this radius";
				typeName="NUMBER";
				defaultValue="1500";
			};
			class DDT_ExclusionRadiusFPV: Edit
			{
				property="DDT_ExclusionRadiusFPV";
				displayName="Exclusion radius (FPV)";
				tooltip="Drones will not be deployed if one exists in this radius";
				typeName="NUMBER";
				defaultValue="2000";
			};
			class DDT_ExclusionRadiusGrenade: Edit
			{
				property="DDT_ExclusionRadiusGrenade";
				displayName="Exclusion radius (Grenade)";
				tooltip="Drones will not be deployed if one exists in this radius";
				typeName="NUMBER";
				defaultValue="1000";
			};
			class DDT_SoftThreshold: Edit
			{
				property="DDT_SoftThreshold";
				displayName="Soft threshold";
				tooltip="Maximum armour value at which vehicles are considered soft";
				typeName="NUMBER";
				defaultValue="100";
			};
			class DDT_AR2XAP: Checkbox
			{
				property="DDT_AR2XAP";
				displayName="AR2X AP";
				tooltip="AR2X drones also attack infantry";
				typeName="BOOL";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module overwrites CBA settings for this mission only.",
				"Position and syncing do not affect anything."
			};
			position=1;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

	class DDT_InfoShare: Module_F
	{
		scope=2;
		displayName="Infoshare";
		icon = "\A3\ui_f\data\map\markers\nato\n_uav.paa";
		category="DDT_faction";
		function="";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class DDT_Cycle: Edit
			{
				property="DDT_Cycle";
				displayName="Cycle";
				tooltip="Seconds between checks";
				typeName="NUMBER";
				defaultValue="60";
			};
			class DDT_Radius: Edit
			{
				property="DDT_Radius";
				displayName="Radius";
				tooltip="Get targets from friendly groups within this radius";
				typeName="NUMBER";
				defaultValue="4000";
			};
			class DDT_TargetRange: Edit
			{
				property="DDT_TargetRange";
				displayName="Target range";
				tooltip="Max distance of targets from reporting group";
				typeName="NUMBER";
				defaultValue="1000";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"Sync group leaders to this module to make them receive target info.",
				"Position does not affect anything."
			};
			position=1;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};


/*
	class B_CombinationUnitRespirator_01_F;
	class DDT_BackpackJammer: B_CombinationUnitRespirator_01_F
	{
		displayName = "Drone Jammer Pack";
		maximumLoad = 10;
	};
	
	//Land_Router_01_black_F
	
	class RuggedTerminal_Base_F;
	class RuggedTerminal_01_communications_hub_F: RuggedTerminal_Base_F
	{
		class EventHandlers;
	};
	//class RuggedTerminal_01_communications_hub_F;
	class DDT_HeavyDroneJammer_B: RuggedTerminal_01_communications_hub_F
	{
		displayName="Heavy Drone Jammer (BLUFOR)";
		editorCategory = "EdCat_DDTjammers";
		//editorSubcategory = "EdSubCat_DDTjammers";
		armor = 20;
		//destrType = "DestructNo";
		destrType = "DestructDefault";
		class EventHandlers: Eventhandlers
		{
			init = "THIS execVM""DrongosDroneTweaks\Scripts\Jammers\InitHeavy.sqf"";";
		};
	};
	class DDT_HeavyDroneJammer_O: DDT_HeavyDroneJammer_B
	{
		displayName="Heavy Drone Jammer (OPFOR)";
	};
	class DDT_HeavyDroneJammer_I: DDT_HeavyDroneJammer_B
	{
		displayName="Heavy Drone Jammer (INDFOR)";
	};
*/
};