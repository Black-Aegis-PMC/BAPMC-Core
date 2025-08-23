class CfgPatches
{
    class VS_Markers
    {
        name = "Black Aegis - Markers";
        author = "Viking Studios";
        authors[] = {"Amateur-god", "Welshy"};
        url = "https://discord.gg/bkdGvUNFbb";
        version = 1.0;
        versionAr[] = {1,0,0,0};
        versionStr = "v1.0.0";
        units[] = {};
        weapons[] = {};
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
        icon = "\BAPMC-Core\Addons\markers\data\logos\bapmc_ca.paa";
        color[] = {1,1,1,1};
        size = 48;
        scope = 2;
        side = 2;
        shadow = 0;
        markerClass = "VS_MarkerClass";
    };

    class VS_BA_Flag_Alt
    {
        name = "Black Aegis - Logo (Alternative)";
        icon = "\BAPMC-Core\Addons\markers\data\logos\bapmc_alt_ca.paa";
        color[] = {1,1,1,1};
        size = 48;
        scope = 2;
        side = 2;
        shadow = 0;
        markerClass = "VS_MarkerClass";
    };

    class VS_BA_Mkr_Dragon
    {
        name = "Black Aegis - Dragon Team";
        icon = "\BAPMC-Core\Addons\markers\data\logos\bapmc_dragon_ca.paa";
        color[] = {1,1,1,1};
        size = 48;
        scope = 2;
        side = 2;
        shadow = 0;
        markerClass = "VS_MarkerClass";
    };

    class VS_BA_Mkr_Havoc
    {
        name = "Black Aegis - Havoc Team";
        icon = "\BAPMC-Core\Addons\markers\data\logos\bapmc_havoc_ca.paa";
        color[] = {1,1,1,1};
        size = 48;
        scope = 2;
        side = 2;
        shadow = 0;
        markerClass = "VS_MarkerClass";
    };
};
