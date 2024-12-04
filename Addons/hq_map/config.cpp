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
		pictureShot = "x\vs_c\hq_map\img\bapmc.paa";
		newRoadsShape = "x\vs_c\hq_map\data\roads\roads.shp";
		ilsDirection[] = {-0.13917310096006544411249666330111, 0, 0.99026806874157031508377486734485};
		ilsPosition[] = {897.274, 3686.55};
		ilsAltitude = 1.56;
        ilsTaxiIn[] = {817.151, 3671.482, 817.151, 3671.482};
        ilsTaxiOff[] = {1110.361, 2137.272, 1027.830, 2125.861, 817.151, 3671.482};
		drawTaxiway = 1;
		satelliteBlend = 1;
		textureLayer = 150;
		textureGrid = 50;
		satelliteNormalBlendStart = 10;
		satelliteNormalBlendEnd = 500;
		satelliteNormalOnDetail = 1;
		class OutsideTerrain
		{
			enableTerrainSynth = 0;
		};
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
