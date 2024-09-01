class CfgPatches {
	class VS_core_FursnishBuildings{
    author = "Tinter";
		name = "Viking Studios - Building Furnisher";
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {}; //
	};
};
class CfgFunctions {
  #include "furniture\func.hpp"
};
class Extended_PreInit_EventHandlers {
    class tinter_furniture_pre_init {
        init = "call compile preprocessFileLineNumbers 'x\VS_C\Furnish_Buildings\furniture\XEH_preInit.sqf'";
    };
};
