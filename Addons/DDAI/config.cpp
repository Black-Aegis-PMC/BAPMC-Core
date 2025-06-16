////////////////////////////////////////////////////////////////////
//DeRap: D:\viking studios\@Drongo's Defensive AI\addons\DDAI\config.bin
//Produced from mikero's Dos Tools Dll version 9.87
//https://mikero.bytex.digital/Downloads
//'now' is Mon Jun 16 14:58:54 2025 : 'file' last modified on Mon Jun 16 14:58:35 2025
////////////////////////////////////////////////////////////////////

#define _ARMA_

class cfgPatches
{
	class DDAI
	{
		author = "Drongo";
		name = "Drongo's Defensive AI";
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"lambs_danger"};
	};
};
class CfgFactionClasses
{
	class NO_CATEGORY;
	class DDAI_faction: NO_CATEGORY
	{
		displayName = "Drongo's Defensive AI";
		priority = 0.1;
		side = 7;
	};
};
class CfgVehicleClasses
{
	class DDAI_class
	{
		displayName = "DDAI class";
	};
};
class CfgFunctions
{
	class DDAI
	{
		tag = "DDAI";
		class Start
		{
			file = "\DDAI\functions";
			class Area{};
			class Exclude{};
			class Reserves{};
		};
	};
};
class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription;
	};
	class DDAI_Area: Module_F
	{
		author = "Drongo";
		_generalMacro = "DDAI_Area";
		scope = 2;
		displayName = "Defensive Area";
		category = "DDAI_faction";
		function = "DDAI_fnc_Area";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		class Arguments
		{
			class ddaiSide
			{
				displayName = "Side";
				description = "Only units on this side will be given orders, bunkers, etc";
				typeName = "STRING";
				class values
				{
					class WEST
					{
						name = "West";
						value = "WEST";
						default = 1;
					};
					class EAST
					{
						name = "East";
						value = "EAST";
					};
					class RES
					{
						name = "Resistance";
						value = "RESISTANCE";
					};
				};
			};
			class ddaiPosture
			{
				displayName = "Posture array";
				description = "Possible postures: Defend, DefendFlexible, Counter, Guard, Attack";
				typeName = "STRING";
				defaultValue = """Defend"",""DefendFlexible"",""Counter"",""Guard""";
			};
			class ddaiFacing
			{
				displayName = "Facing";
				description = "General facing of the defensive area (0=North, 180=South). Set to -1 to use module direction";
				typeName = "NUMBER";
				defaultValue = "0";
			};
			class ddaiFaceOut
			{
				displayName = "Bunkers face out";
				description = "Bunkers will face away from module position";
				typeName = "STRING";
				class values
				{
					class TRUE
					{
						name = "True";
						value = "TRUE";
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
						default = 1;
					};
				};
			};
			class ddaiRadius
			{
				displayName = "Radius";
				description = "Radius of the defensive area";
				typeName = "NUMBER";
				defaultValue = "1000";
			};
			class ddaiAttackMarker
			{
				displayName = "Attack marker name";
				description = "Name of marker to assault if ATTACK orders are given";
				typeName = "STRING";
				defaultValue = "";
			};
			class ddaiAttackDelay
			{
				displayName = "Attack delay";
				description = "[min,max] second delay before launching attack on ATTACK orders";
				typeName = "STRING";
				defaultValue = "60,300";
			};
			class ddaiCounterDelay
			{
				displayName = "Counter delay";
				description = "[min,max] second delay before launching a counter-attack on COUNTER orders";
				typeName = "STRING";
				defaultValue = "60,300";
			};
			class ddaiCounterDistance
			{
				displayName = "Counter distance";
				description = "[min,max] maximum distance from defending units at which an enemy triggers a counter attack";
				typeName = "STRING";
				defaultValue = "500,1000";
			};
			class ddaiCounterType
			{
				displayName = "Counter type";
				description = "";
				typeName = "STRING";
				class values
				{
					class RANDOM
					{
						name = "Random";
						value = "RANDOM";
						default = 1;
					};
					class INF
					{
						name = "Infantry";
						value = "INFANTRY";
					};
					class VEH
					{
						name = "Vehicles";
						value = "VEHICLES";
					};
					class BOTH
					{
						name = "Infantry and vehicles";
						value = "BOTH";
					};
				};
			};
			class ddaiScheme
			{
				displayName = "Camo scheme";
				description = "Camo scheme to use for nets and some bunkers";
				typeName = "STRING";
				class values
				{
					class GREEN
					{
						name = "Green";
						value = "GREEN";
						default = 1;
					};
					class BROWN
					{
						name = "Brown";
						value = "BROWN";
					};
				};
			};
			class ddaiBunkerChance
			{
				displayName = "Bunker chance";
				description = "% chance an ungarrisoned infantry squad will spawn a bunker to garrison";
				typeName = "NUMBER";
				defaultValue = "100";
			};
			class ddaiCamoNetChance
			{
				displayName = "Camo net chance";
				description = "% chance a vehicle will spawn a camo net";
				typeName = "NUMBER";
				defaultValue = "100";
			};
			class ddaiDeleteUngarrisoned
			{
				displayName = "Delete ungarrisoned";
				description = "Delete members of garrisoned squads that are not inside structures";
				typeName = "STRING";
				class values
				{
					class TRUE
					{
						name = "True";
						value = "TRUE";
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
						default = 1;
					};
				};
			};
			class ddaiDeleteEmptyStatics
			{
				displayName = "Delete empty statics";
				description = "Delete empty statics after setup is complete";
				typeName = "STRING";
				class values
				{
					class TRUE
					{
						name = "True";
						value = "TRUE";
						default = 1;
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
					};
				};
			};
			class ddaiBreakpoint
			{
				displayName = "Breakpoint";
				description = "[min,max] percentage of casualties taken to make remaining groups flee";
				typeName = "STRING";
				defaultValue = "75,100";
			};
			class ddaiObjectDistance
			{
				displayName = "Object distance";
				description = "Distance from objects used in BIS_fnc_findSafePos when spawning bunkers (see BIKI entry for more detail)";
				typeName = "NUMBER";
				defaultValue = "5";
			};
			class ddaiDelay
			{
				displayName = "Delay";
				description = "Delay from mission start until module starts (in seconds)";
				typeName = "NUMBER";
				defaultValue = "0";
			};
			class ddaiGoCodes
			{
				displayName = "Go codes";
				description = "Strings that must be added to the server-side ddaiGoCodes array to start this module";
				typeName = "STRING";
				defaultValue = "";
			};
			class ddaiDebug
			{
				displayName = "Debug";
				description = "Show debug text";
				typeName = "STRING";
				class values
				{
					class TRUE
					{
						name = "True";
						value = "TRUE";
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
						default = 1;
					};
				};
			};
		};
	};
	class DDAI_Exclude: Module_F
	{
		author = "Drongo";
		_generalMacro = "DDAI_Exclude";
		scope = 2;
		displayName = "Exclude groups";
		category = "DDAI_faction";
		function = "DDAI_fnc_Exclude";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
	};
	class DDAI_Reserves: Module_F
	{
		author = "Drongo";
		_generalMacro = "DDAI_Reserves";
		scope = 2;
		displayName = "Reserves";
		category = "DDAI_faction";
		function = "DDAI_fnc_Reserves";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		class Arguments
		{
			class ddaiDelay
			{
				displayName = "Delay";
				description = "[min,max] delay in seconds between getting the call to react and starting to move";
				typeName = "STRING";
				defaultValue = "30,300";
			};
			class ddaiReactChance
			{
				displayName = "React chance";
				description = "Chance the group will respond to the call to react";
				typeName = "NUMBER";
				defaultValue = "100";
			};
			class ddaiDeleteChance
			{
				displayName = "Delete chance";
				description = "Chance the group will be deleted at mission start";
				typeName = "NUMBER";
				defaultValue = "0";
			};
		};
	};
	class DDAI_BunkerTypes: Module_F
	{
		author = "Drongo";
		_generalMacro = "DDAI_BunkerTypes";
		scope = 2;
		displayName = "BunkerTypes";
		category = "DDAI_faction";
		function = "";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		isDisposable = 0;
		class Arguments
		{
			class ddaiSandbagSmall
			{
				displayName = "Sandbag bunker (small)";
				description = "Sandbag bunker (small)";
				typeName = "STRING";
				class values
				{
					class Land_BagBunker_Small_F
					{
						name = "True";
						value = "Land_BagBunker_Small_F";
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
						default = 1;
					};
				};
			};
			class ddaiSandbagSmallGreen
			{
				displayName = "Sandbag bunker (small, green)";
				description = "Sandbag bunker (small, green)";
				typeName = "STRING";
				class values
				{
					class Land_BagBunker_01_small_green_F
					{
						name = "True";
						value = "Land_BagBunker_01_small_green_F";
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
						default = 1;
					};
				};
			};
			class ddaiSandbag
			{
				displayName = "Sandbag bunker";
				description = "Sandbag bunker";
				typeName = "STRING";
				class values
				{
					class Land_BagBunker_Large_F
					{
						name = "True";
						value = "Land_BagBunker_Large_F";
						default = 1;
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
					};
				};
			};
			class ddaiSandbagGreen
			{
				displayName = "Sandbag bunker (green)";
				description = "Sandbag bunker (green)";
				typeName = "STRING";
				class values
				{
					class Land_BagBunker_01_large_green_F
					{
						name = "True";
						value = "Land_BagBunker_01_large_green_F";
						default = 1;
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
					};
				};
			};
			class ddaiModularSmall
			{
				displayName = "Modular bunker (small)";
				description = "Modular bunker (small)";
				typeName = "STRING";
				class values
				{
					class Land_Bunker_01_small_F
					{
						name = "True";
						value = "Land_Bunker_01_small_F";
						default = 1;
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
					};
				};
			};
			class ddaiModularBig
			{
				displayName = "Modular bunker (big)";
				description = "Modular bunker (big)";
				typeName = "STRING";
				class values
				{
					class Land_Bunker_01_big_F
					{
						name = "True";
						value = "Land_Bunker_01_big_F";
						default = 1;
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
					};
				};
			};
			class ddaiPillboxSmall
			{
				displayName = "Pillbox (small)";
				description = "Pillbox (small)";
				typeName = "STRING";
				class values
				{
					class Land_PillboxBunker_01_hex_F
					{
						name = "True";
						value = "Land_PillboxBunker_01_hex_F";
						default = 1;
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
					};
				};
			};
			class ddaiPillboxBig
			{
				displayName = "Pillbox (big)";
				description = "Pillbox (big)";
				typeName = "STRING";
				class values
				{
					class Land_PillboxBunker_01_big_F
					{
						name = "True";
						value = "Land_PillboxBunker_01_big_F";
						default = 1;
					};
					class FALSE
					{
						name = "False";
						value = "FALSE";
					};
				};
			};
		};
	};
};
class cfgMods
{
	author = "Drongo";
	timepacked = "1659130356";
};
