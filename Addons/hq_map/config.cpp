class CfgPatches
{
	class bapmc_maps
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "A3_Map_Data" };
	};
};
class CfgWorldList
{
	class bapmc_hq {};
};
class CfgWorlds
{
	class Stratis;
	class bapmc_hq: Stratis
	{
		cutscenes[] = {};
		description = "Black Aegis Island - HQ";
		worldName = "x\vs_c\hq_map\data\bapmc_hq.wrp";
		author = "Amateur-God";
		icon = "x\vs_c\hq_map\img\bapmc.paa";
		previewVideo = "";
		pictureShot = "";
		newRoadsShape = "x\vs_c\hq_map\data\roads\roads.shp";
		ilsDirection[] = { 0, 0.08, 1 };
		ilsPosition[] = {0, 0};
		ilsTaxiIn[] = {};
		ilsTaxiOff[] = {};
		drawTaxiway = 0;
		satelliteBlend = 1.0;
		class SecondaryAirports{};
		class ReplaceObjects{};
		class Sounds
		{
			sounds[] = {};
		};
		class Animation
		{
			vehicles[] = {};
		};
		minTreesInForestSquare = 5;
		minRocksInRockSquare = 10;
		class Subdivision{};
		class Names {
			#include "hpp\names.hpp"
		};
        class DefaultClutter;
		class clutter {
			#include "hpp\clutter.hpp"
		};
		#include "hpp\mapinfos.hpp"
		#include "hpp\ace-weather.hpp"
		loadingTexts[]={
			"Loading..."
		};
		pictureMap = "x\vs_c\hq_map\data\picturemap_ca.paa";
	};
};
#include "hpp\surfaces.hpp"
