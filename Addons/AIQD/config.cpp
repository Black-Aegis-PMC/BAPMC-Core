////////////////////////////////////////////////////////////////////
//DeRap: D:\viking studios\@Vision Guard AI\addons\AIQD\config.bin
//Produced from mikero's Dos Tools Dll version 9.87
//https://mikero.bytex.digital/Downloads
//'now' is Fri Jun 20 00:26:38 2025 : 'file' last modified on Fri Jun 20 00:26:33 2025
////////////////////////////////////////////////////////////////////

#define _ARMA_

class CfgPatches
{
	class AIQD
	{
		name = "AI Quadratic Detection";
		author = "DarkBall";
		url = "";
		requiredVersion = 1.6;
		requiredAddons[] = {"A3_Data_F_Decade_Loadorder"};
		units[] = {""};
		weapons[] = {};
	};
};
class CfgFunctions
{
	class DB_AIQD
	{
		class AIQD
		{
			file = "\AIQD\functions";
			class findAndDrawTargets{};
			class cancelDrawTargets{};
		};
	};
};
class Extended_PreInit_EventHandlers
{
	class AIQD_preInit
	{
		init = "call compile preProcessFileLineNumbers '\AIQD\XEH_preInit.sqf'";
	};
};
class cfgMods
{
	author = "[SEAL TEAM] DarkBall";
	timepacked = "1712266541";
};
