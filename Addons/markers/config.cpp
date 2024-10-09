class CfgPatches
{
    class VS_Markers
    {
        name = "Black Aegis - Markers";
		author = "Viking Studios";
		authors[] = {"Amateur-god"};
		url = "https://discord.gg/bkdGvUNFbb";
		version = 1.0;
		versionAr[] = {1,0,0,0};
		versionStr = "v1.0.0";
		units[] = {"VS_BA_Flag"};
        weapons[]={};
		magazines[] = {};
		ammo[] = {};
		worlds[] = {};
    };
};

class CfgMarkerClasses
{
    class VS_MarkerClass
    {
        displayName = "Black Aegis";
    };
};

class CfgMarkers
{
    class VS_BA_Flag
    {
        name = "Black Aegis - Logo";
        icon = "x\VS_C\Markers\data\logos\bapmc.paa";
        color[] = {1,1,1,1};
        size = 48;
        scope = 2;
        side = 2;
        shadow = 0;
        markerClass = "VS_MarkerClass";
    };
};
