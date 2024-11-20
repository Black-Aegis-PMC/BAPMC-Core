
latitude=-24.65788264; // positive is south
longitude=124.6991022; // positive is east 

mapArea[] = {
    24.62763594, 124.6651885, //Bottom Left => SW
	24.68812068, 124.7330322 //Top Right => NE
}; 
mapSize=6784;
mapZone=51;

centerPosition[]={3392,3392};

class OutsideTerrain
{
    colorOutside[] = {0.227451,0.27451,0.384314,1};
	enableTerrainSynth = 0;
	satellite = "x\vs_c\hq_map\data\satout_ca.paa";
    class Layers
    {
		class Layer0
        {
			nopx    = "a3\map_data\gdt_seabed_nopx.paa";
			texture = "a3\map_data\gdt_seabed_co.paa"; 
		};
    };
};

class Grid {
    offsetX = 0;
    offsetY = 6784;
    class Zoom1 {
        zoomMax = 0.2264;
        format = "XY";
        formatX = "000";
        formatY = "000";
        stepX = 100;
        stepY = -100;
    };
    class Zoom2 {
        zoomMax = 2.2642;
        format = "XY";
        formatX = "00";
        formatY = "00";
        stepX = 1000;
        stepY = -1000;
    };
    class Zoom3 {
        zoomMax = 1e+030;
        format = "XY";
        formatX = "0";
        formatY = "0";
        stepX = 10000;
        stepY = -10000;
    };
};
