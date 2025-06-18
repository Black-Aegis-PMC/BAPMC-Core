/* class CfgUserActions
{
	class TAG_MyActionName // This class name is used for internal representation and also for the inputAction command.
	{
		displayName = "";
		tooltip = "";
		onActivate = "['TAG_MyActionName', true] call TAG_fnc_MyHandler";		// _this is always true.
		onDeactivate = "['TAG_MyActionName', false] call TAG_fnc_MyHandler";	// _this is always false.
		onAnalog = "['TAG_MyActionName', _this] call TAG_fnc_MyAnalogHandler";	// _this is the scalar analog value.
		analogChangeThreshold = 0.01; // Minimum change required to trigger the onAnalog EH (default: 0.01).
		modifierBlocking = 1; // Whether this action would block other actions if the assigned key has modifier keys on it. (Since Arma 2.12)
	};
};

 */

class CfgUserActions
{
	class MarbitMarkBlk // This class name is used for internal representation and also for the inputAction command.
	{
		displayName = "Mark Target 3 (Black)";
		tooltip = "Test";
		onActivate = "";		// _this is always true.
		onDeactivate = "_this call fatlurch_fnc_preaddMarkerBlk";	// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.01; // Minimum change required to trigger the onAnalog EH (default: 0.01).
		modifierBlocking = 1; // Whether this action would block other actions if the assigned key has modifier keys on it. (Since Arma 2.12)
	};
		class MarbitMarkGreen // This class name is used for internal representation and also for the inputAction command.
	{
		displayName = "Mark Target 4 (Green)";
		tooltip = "Test";
		onActivate = "";		// _this is always true.
		onDeactivate = "_this call fatlurch_fnc_preaddMarkerGreen";	// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.01; // Minimum change required to trigger the onAnalog EH (default: 0.01).
		modifierBlocking = 1; // Whether this action would block other actions if the assigned key has modifier keys on it. (Since Arma 2.12)
	};
		class MarbitMarkRed // This class name is used for internal representation and also for the inputAction command.
	{
		displayName = "Mark Target 1 (Red)";
		tooltip = "Test";
		onActivate = "";		// _this is always true.
		onDeactivate = "_this call fatlurch_fnc_preaddMarkerRed";	// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.01; // Minimum change required to trigger the onAnalog EH (default: 0.01).
		modifierBlocking = 1; // Whether this action would block other actions if the assigned key has modifier keys on it. (Since Arma 2.12)
	};
		class MarbitMarkBlue // This class name is used for internal representation and also for the inputAction command.
	{
		displayName = "Mark Target 2 (Blue)";
		tooltip = "Test";
		onActivate = "";		// _this is always true.
		onDeactivate = "_this call fatlurch_fnc_preaddMarkerBlue";	// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.01; // Minimum change required to trigger the onAnalog EH (default: 0.01).
		modifierBlocking = 1; // Whether this action would block other actions if the assigned key has modifier keys on it. (Since Arma 2.12)
	};
		class MarbitSlewToGrid // This class name is used for internal representation and also for the inputAction command.
	{
		displayName = "Slew To Grid";
		tooltip = "Test";
		onActivate = "";		// _this is always true.
		onDeactivate = "_this call fatlurch_fnc_preinputGrid;";	// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.01; // Minimum change required to trigger the onAnalog EH (default: 0.01).
		modifierBlocking = 1; // Whether this action would block other actions if the assigned key has modifier keys on it. (Since Arma 2.12)
	};
		class MarbitMarkWithText // This class name is used for internal representation and also for the inputAction command.
	{
		displayName = "Mark With Text";
		tooltip = "Test";
		onActivate = "";		// _this is always true.
		onDeactivate = "_this call fatlurch_fnc_preinputText;";	// _this is always false.
		onAnalog = "";	// _this is the scalar analog value.
		analogChangeThreshold = 0.01; // Minimum change required to trigger the onAnalog EH (default: 0.01).
		modifierBlocking = 1; // Whether this action would block other actions if the assigned key has modifier keys on it. (Since Arma 2.12)
	};
};

class UserActionGroups
{
	class ModSection // unique classname for your category
	{
		name = "Turret Enhanced"; // display name of your category
		group[] = {
			"MarbitMarkRed",
			"MarbitMarkBlue",
			"MarbitMarkBlk",
			"MarbitMarkGreen",
			"MarbitSlewToGrid",
			"MarbitMarkWithText"
		};
	};
};


class changeAltitude
{
	idd=-1;
	class ControlsBackground
	{
	};
	class Controls
	{
		class Background
		{
			type=0;
			idc=-1;
			x="safeZoneX + safeZoneW * 0.43177084";
			y="safeZoneY + safeZoneH * 0.42037038";
			w="safeZoneW * 0.13645834";
			h="safeZoneH * 0.16018519";
			style=0;
			text="";
			colorBackground[]={0,0,0,0.80000001};
			colorText[]={0.30590001,0.60780001,0.74119997,1};
			font="PuristaMedium";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class Label
		{
			type=0;
			idc=-1;
			x="safeZoneX + safeZoneW * 0.43177084";
			y="safeZoneY + safeZoneH * 0.42037038";
			w="safeZoneW * 0.13645834";
			h="safeZoneH * 0.01944445";
			style=2;
			text="Input New Altitude";
			colorBackground[]={0.79610002,0.93730003,0.1176,0};
			colorText[]={0,1,0,1};
			font="PuristaBold";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1)";
		};
		class Input
		{
			type=2;
			idc=500;
			x="safeZoneX + safeZoneW * 0.43645834";
			y="safeZoneY + safeZoneH * 0.46018519";
			w="safeZoneW * 0.03020834";
			h="safeZoneH * 0.02962963";
			style=0;
			text="1000";
			autocomplete="";
			colorBackground[]={0.2,0.2,0.2,1};
			colorDisabled[]={0.2,0.2,0.2,1};
			colorSelection[]={1,0,0,1};
			colorText[]={0,1,0,1};
			font="PuristaMedium";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class Label_Meters
		{
			type=0;
			idc=-1;
			x="safeZoneX + safeZoneW * 0.46979167";
			y="safeZoneY + safeZoneH * 0.45370371";
			w="safeZoneW * 0.09010417";
			h="safeZoneH * 0.03796297";
			style=0;
			text="Altitude (m ASL)";
			colorBackground[]={0.79610002,0.93730003,0.1176,0};
			colorText[]={0,1,0,1};
			font="PuristaLight";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			tooltip="The vehicle will attempt to maintain this altitude in meters Above Sea Level";
		};
		class OK
		{
			type=1;
			idc=1;
			x="safeZoneX + safeZoneW * 0.44947917";
			y="safeZoneY + safeZoneH * 0.5425926";
			w="safeZoneW * 0.0390625";
			h="safeZoneH * 0.02870371";
			style="0+2";
			text="OK";
			borderSize=0;
			colorBackground[]={0.2,0.2,0.2,1};
			colorBackgroundActive[]={1,0,0,1};
			colorBackgroundDisabled[]={0.2,0.2,0.2,1};
			colorBorder[]={0,0,0,0};
			colorDisabled[]={0.2,0.2,0.2,1};
			colorFocused[]={0.2,0.2,0.2,1};
			colorShadow[]={0,0,0,1};
			colorText[]={0,1,0,1};
			font="PuristaMedium";
			offsetPressedX=0.0099999998;
			offsetPressedY=0.0099999998;
			offsetX=0.0099999998;
			offsetY=0.0099999998;
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundClick",
				0.090000004,
				1
			};
			soundEnter[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundEnter",
				0.090000004,
				1
			};
			soundEscape[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundEscape",
				0.090000004,
				1
			};
			soundPush[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundPush",
				0.090000004,
				1
			};
			onMouseButtonUp="[] call fatLurch_fnc_altitudeDialogClose";
		};
		class Cancel
		{
			type=1;
			idc=2;
			x="safeZoneX + safeZoneW * 0.5078125";
			y="safeZoneY + safeZoneH * 0.5425926";
			w="safeZoneW * 0.0390625";
			h="safeZoneH * 0.02870371";
			style="0+2";
			text="Cancel";
			borderSize=0;
			colorBackground[]={0.2,0.2,0.2,1};
			colorBackgroundActive[]={1,0,0,1};
			colorBackgroundDisabled[]={0.2,0.2,0.2,1};
			colorBorder[]={0,0,0,0};
			colorDisabled[]={0.2,0.2,0.2,1};
			colorFocused[]={0.2,0.2,0.2,1};
			colorShadow[]={0,0,0,1};
			colorText[]={0,1,0,1};
			font="PuristaMedium";
			offsetPressedX=0.0099999998;
			offsetPressedY=0.0099999998;
			offsetX=0.0099999998;
			offsetY=0.0099999998;
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundClick",
				0.090000004,
				1
			};
			soundEnter[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundEnter",
				0.090000004,
				1
			};
			soundEscape[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundEscape",
				0.090000004,
				1
			};
			soundPush[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundPush",
				0.090000004,
				1
			};
		};
		class TerrainAvoidanceInput
		{
			type=2;
			idc=501;
			x="safeZoneX + safeZoneW * 0.43645834";
			y="safeZoneY + safeZoneH * 0.49722223";
			w="safeZoneW * 0.03020834";
			h="safeZoneH * 0.02962963";
			style=0;
			text="100";
			autocomplete="";
			colorBackground[]={0.2,0.2,0.2,1};
			colorDisabled[]={0.2,0.2,0.2,1};
			colorSelection[]={1,0,0,1};
			colorText[]={0,1,0,1};
			font="PuristaMedium";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			tooltip="If the vehicle is closer than this value to the ground, it will attempt to avoid the ground";
		};
		class Label_TA
		{
			type=0;
			idc=-1;
			x="safeZoneX + safeZoneW * 0.46979167";
			y="safeZoneY + safeZoneH * 0.49074075";
			w="safeZoneW * 0.1";
			h="safeZoneH * 0.03796297";
			style=0;
			text="Terrain Avoidance (m)";
			colorBackground[]={0.79610002,0.93730003,0.1176,0};
			colorText[]={0,1,0,1};
			font="PuristaLight";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};
};
class changeLoiter
{
	idd=-1;
	class ControlsBackground
	{
	};
	class Controls
	{
		class Background
		{
			type=0;
			idc=-1;
			x="safeZoneX + safeZoneW * 0.43177084";
			y="safeZoneY + safeZoneH * 0.45740741";
			w="safeZoneW * 0.13645834";
			h="safeZoneH * 0.12314815";
			style=0;
			text="";
			colorBackground[]={0,0,0,0.80000001};
			colorText[]={0.30590001,0.60780001,0.74119997,1};
			font="PuristaMedium";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class Label
		{
			type=0;
			idc=-1;
			x="safeZoneX + safeZoneW * 0.43177084";
			y="safeZoneY + safeZoneH * 0.45740741";
			w="safeZoneW * 0.13645834";
			h="safeZoneH * 0.01944445";
			style=2;
			text="Input New Loiter Radius";
			colorBackground[]={0.79610002,0.93730003,0.1176,0};
			colorText[]={0,1,0,1};
			font="PuristaBold";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1)";
		};
		class Input
		{
			type=2;
			idc=500;
			x="safeZoneX + safeZoneW * 0.44635417";
			y="safeZoneY + safeZoneH * 0.49722223";
			w="safeZoneW * 0.03020834";
			h="safeZoneH * 0.02962963";
			style=0;
			text="1000";
			autocomplete="";
			colorBackground[]={0.2,0.2,0.2,1};
			colorDisabled[]={0.2,0.2,0.2,1};
			colorSelection[]={1,0,0,1};
			colorText[]={0,1,0,1};
			font="PuristaMedium";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class Label_Meters
		{
			type=0;
			idc=-1;
			x="safeZoneX + safeZoneW * 0.4796875";
			y="safeZoneY + safeZoneH * 0.49074075";
			w="safeZoneW * 0.08020834";
			h="safeZoneH * 0.03796297";
			style=0;
			text="Loiter Radius (m)";
			colorBackground[]={0.79610002,0.93730003,0.1176,0};
			colorText[]={0,1,0,1};
			font="PuristaLight";
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			tooltip="The vehicle will attempt to maintain this altitude in meters Above Sea Level";
		};
		class OK
		{
			type=1;
			idc=1;
			x="safeZoneX + safeZoneW * 0.44947917";
			y="safeZoneY + safeZoneH * 0.5425926";
			w="safeZoneW * 0.0390625";
			h="safeZoneH * 0.02870371";
			style="0+2";
			text="OK";
			borderSize=0;
			colorBackground[]={0.2,0.2,0.2,1};
			colorBackgroundActive[]={1,0,0,1};
			colorBackgroundDisabled[]={0.2,0.2,0.2,1};
			colorBorder[]={0,0,0,0};
			colorDisabled[]={0.2,0.2,0.2,1};
			colorFocused[]={0.2,0.2,0.2,1};
			colorShadow[]={0,0,0,1};
			colorText[]={0,1,0,1};
			font="PuristaMedium";
			offsetPressedX=0.0099999998;
			offsetPressedY=0.0099999998;
			offsetX=0.0099999998;
			offsetY=0.0099999998;
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundClick",
				0.090000004,
				1
			};
			soundEnter[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundEnter",
				0.090000004,
				1
			};
			soundEscape[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundEscape",
				0.090000004,
				1
			};
			soundPush[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundPush",
				0.090000004,
				1
			};
			onMouseButtonUp="[] call fatLurch_fnc_loiterDialogClose";
		};
		class Cancel
		{
			type=1;
			idc=2;
			x="safeZoneX + safeZoneW * 0.5078125";
			y="safeZoneY + safeZoneH * 0.5425926";
			w="safeZoneW * 0.0390625";
			h="safeZoneH * 0.02870371";
			style="0+2";
			text="Cancel";
			borderSize=0;
			colorBackground[]={0.2,0.2,0.2,1};
			colorBackgroundActive[]={1,0,0,1};
			colorBackgroundDisabled[]={0.2,0.2,0.2,1};
			colorBorder[]={0,0,0,0};
			colorDisabled[]={0.2,0.2,0.2,1};
			colorFocused[]={0.2,0.2,0.2,1};
			colorShadow[]={0,0,0,1};
			colorText[]={0,1,0,1};
			font="PuristaMedium";
			offsetPressedX=0.0099999998;
			offsetPressedY=0.0099999998;
			offsetX=0.0099999998;
			offsetY=0.0099999998;
			sizeEx="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundClick",
				0.090000004,
				1
			};
			soundEnter[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundEnter",
				0.090000004,
				1
			};
			soundEscape[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundEscape",
				0.090000004,
				1
			};
			soundPush[]=
			{
				"\A3\ui_f\data\sound\RscButton\soundPush",
				0.090000004,
				1
			};
		};
	};
};
class CfgPatches
{
	class UAV_Turret_Markers
	{
		units[]=
		{
			"Helicopter",
			"UAV"
		};
		weapons[]={};
		requiredVersion=1.8;
		requiredAddons[]=
		{
			"A3_Data_F_Sams_LoadOrder",
			"cba_main"
		};
		version="0.1";
		author="Fat_Lurch";
	};
};
class Extended_PreInit_EventHandlers
{
	class My_pre_init_event
	{
		init="call compile preprocessFileLineNumbers 'Marbit_Turret_Enhanced\XEH_preInit.sqf'";
	};
};
class CfgFunctions
{
	class fatLurch
	{
		class Lurch_Functions2
		{
			class MPaddaction
			{
				file="Marbit_Turret_Enhanced\functions\MPaddaction.sqf";
			};
			class North_Ind
			{
				file="Marbit_Turret_Enhanced\functions\North_Ind.sqf";
			};
			class isViewISR
			{
				file="Marbit_Turret_Enhanced\functions\isViewISR.sqf";
			};
			class addMarkerBlk
			{
				file="Marbit_Turret_Enhanced\functions\createMarkerBlack.sqf";
			};
			class preaddMarkerBlk
			{
				file="Marbit_Turret_Enhanced\functions\precreateMarkerBlack.sqf";
			};
			class addMarkerBlu
			{
				file="Marbit_Turret_Enhanced\functions\createMarkerBlue.sqf";
			};
			class preaddMarkerBlu
			{
				file="Marbit_Turret_Enhanced\functions\precreateMarkerBlue.sqf";
			};
			class addMarkerRed
			{
				file="Marbit_Turret_Enhanced\functions\createMarkerRed.sqf";
			};
			class preaddMarkerRed
			{
				file="Marbit_Turret_Enhanced\functions\precreateMarkerRed.sqf";
			};
			class addMarkerGreen
			{
				file="Marbit_Turret_Enhanced\functions\createMarkerGreen.sqf";
			};
			class preaddMarkerGreen
			{
				file="Marbit_Turret_Enhanced\functions\precreateMarkerGreen.sqf";
			};
			class turretAzEl
			{
				file="Marbit_Turret_Enhanced\functions\turretAzEl.sqf";
			};
			class hasOpticsIn
			{
				file="Marbit_Turret_Enhanced\functions\hasOpticsIn.sqf";
			};
			class changeAltitude
			{
				file="Marbit_Turret_Enhanced\functions\changeAltitude.sqf";
			};
			class altitudeDialogClose
			{
				file="Marbit_Turret_Enhanced\functions\altitudeDialogClose.sqf";
			};
			class blacklistGUI
			{
				file="Marbit_Turret_Enhanced\functions\blacklistGUI.sqf";
			};
			class getTurretIndex
			{
				file="Marbit_Turret_Enhanced\functions\getTurretIndex.sqf";
			};
			class mapSlew
			{
				file="Marbit_Turret_Enhanced\functions\mapSlew.sqf";
			};
			class premapSlew
			{
				file="Marbit_Turret_Enhanced\functions\premapSlew.sqf";
			};
			class inputGrid
			{
				file="Marbit_Turret_Enhanced\functions\inputGrid.sqf";
			};
			class preinputGrid
			{
				file="Marbit_Turret_Enhanced\functions\preinputGrid.sqf";
			};
			class inputText
			{
				file="Marbit_Turret_Enhanced\functions\inputText.sqf";
			};
			class preinputText
			{
				file="Marbit_Turret_Enhanced\functions\preinputText.sqf";
			};
			class measDistance
			{
				file="Marbit_Turret_Enhanced\functions\measDistance.sqf";
			};
			class getPylonAmmo
			{
				file="Marbit_Turret_Enhanced\functions\getPylonAmmo.sqf";
			};
			class weaponReport
			{
				file="Marbit_Turret_Enhanced\functions\weaponReport.sqf";
			};
			class resetUAV
			{
				file="Marbit_Turret_Enhanced\functions\resetUAV.sqf";
			};
			class changeLoiter
			{
				file="Marbit_Turret_Enhanced\functions\changeLoiter.sqf";
			};
			class loiterDialogClose
			{
				file="Marbit_Turret_Enhanced\functions\loiterDialogClose.sqf";
			};
			class blacklistfrommark
			{
				file="Marbit_Turret_Enhanced\functions\blacklistassets.sqf";
			};
			class bh
			{
				file="Marbit_Turret_Enhanced\functions\createMarkerBH.sqf";
			};
			class getNextMarkerNumber
			{
				file="Marbit_Turret_Enhanced\functions\getNextMarkerNumber.sqf";
			};
		};
	};
};
class Extended_Init_EventHandlers
{
	class air;
	class plane: air
	{
		class Fat_Lurch_plane_eh
		{
			init="(_this select 0) spawn fatLurch_fnc_MPaddaction";
		};
	};
	class Helicopter: air
	{
		class Fat_Lurch_Helicopter_eh
		{
			init="(_this select 0) spawn fatLurch_fnc_MPaddaction";
		};
	};
};
class RscTitles
{
	class North
	{
		idd=710;
		fadein=0;
		fadeout=0;
		duration=0.1;
		onLoad="uiNameSpace setVariable ['myUI_LevelTitle', (_this select 0) displayCtrl 654];";
		class controls
		{
			class ExampleControl
			{
				idc=709;
				type=0;
				style=2;
				x="uiNamespace getVariable 'newPosition' select 0";
				y="uiNamespace getVariable 'newPosition' select 1";
				w=1;
				h=1;
				font="EtelkaNarrowMediumPro";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,1};
				text="N";
			};
			class ExampleControl654
			{
				idc=654;
				type=0;
				style=0;
				x=0.84500003;
				y=0.60000002;
				w=1;
				h=1;
				font="RobotoCondensedLight";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,1};
				text="";
			};
		};
	};
	class El
	{
		idd=709;
		fadein=0;
		fadeout=0;
		duration=0.1;
		onLoad="uiNameSpace setVariable ['guiEl', (_this select 0) displayCtrl 655];";
		class controls
		{
			class elControl655
			{
				idc=655;
				type=0;
				style="ST_CENTER";
				x=-0.1;
				y="uiNamespace getVariable 'guiElPos'";
				w=1;
				h=1;
				font="RobotoCondensedLight";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,1};
				text="";
			};
			class elevation
			{
				idc=660;
				type=0;
				style=2096;
				x=-0.31999999;
				y=0.34999999;
				w=0.69999999;
				h=0.55000001;
				font="RobotoCondensedLight";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,1};
				text="Marbit_Turret_Enhanced\images\Elevation.paa";
			};
		};
	};
	class Az
	{
		idd=708;
		fadein=0;
		fadeout=0;
		duration=0.1;
		onLoad="uiNameSpace setVariable ['guiAz', (_this select 0) displayCtrl 656]; uiNameSpace setVariable ['guiHdg', (_this select 0) displayCtrl 657];";
		class controls
		{
			class azControl656
			{
				idc=656;
				type=0;
				style=2;
				x="uiNamespace getVariable 'guiAzPos'";
				y=-0.46000001;
				w=0.1;
				h=1;
				font="RobotoCondensedLight";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,1};
				text="";
			};
			class headingControl657
			{
				idc=657;
				type=0;
				style=162;
				x=0.46000001;
				y=-0.090000004;
				w=0.079999998;
				h=0.050000001;
				font="RobotoCondensedLight";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,1};
				text="";
			};
			class compass
			{
				idc=658;
				type=0;
				style=2096;
				x=0.34999999;
				y=-0.125;
				w=0.30000001;
				h=0.2;
				font="RobotoCondensedLight";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,1};
				text="Marbit_Turret_Enhanced\images\Compass.paa";
			};
			class compassArrow
			{
				idc=659;
				type=0;
				style=2096;
				x="(uiNamespace getVariable 'guiAzPos')+0.0375";
				y=-0.0049999999;
				w=0.025;
				h=0.025;
				font="RobotoCondensedLight";
				sizeEx=0.050000001;
				colorBackground[]={0,0,0,0};
				colorText[]={1,1,1,1};
				text="Marbit_Turret_Enhanced\images\CompassArrow.paa";
			};
		};
	};
};
class inputCoords
{
	idd=585;
	fadein=0;
	fadeout=0;
	duration=9.9999998e+010;
	onUnload="uiNamespace setVariable [""coordReturn"", (_this select 1)];";
	class controls
	{
		class RscText
		{
			idc=1000;
			type=0;
			style=16;
			text="Input Target Grid";
			x="0.446146 * safezoneW + safezoneX";
			y="0.649667 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.022 * safezoneH";
			font="PuristaMedium";
			lineSpacing=1;
			sizeEx=0.029999999;
			colorSelection[]={-1,-1,-1,-1};
			colorText[]={1,1,1,1};
			colorDisabled[]={-1,-1,-1,-1};
			colorBackground[]={0,0,0,0.69999999};
		};
		class RscEdit
		{
			idc=1400;
			maxChars=10;
			type=2;
			style=16;
			x="0.446374 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.022 * safezoneH";
			font="PuristaMedium";
			autoComplete="";
			sizeEx=0.029999999;
			colorSelection[]={-1,-1,-1,-1};
			colorText[]={1,1,1,1};
			colorDisabled[]={-1,-1,-1,-1};
			colorBackground[]={0,0,0,0.69999999};
			text="";
		};
		class RscButton
		{
			idc=1600;
			type=1;
			style=16;
			action="closeDialog 1;_ctrl=(findDisplay 585) displayCtrl 1400;coords = ctrlText _ctrl;_ctrl ctrlSetText '';";
			text="ENTER";
			x="0.517532 * safezoneW + safezoneX";
			y="0.6496 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
			font="PuristaMedium";
			sizeEx=0.029999999;
			colorSelection[]={-1,-1,-1,-1};
			colorText[]={1,1,1,1};
			colorDisabled[]={-1,-1,-1,-1};
			colorBackground[]={0,0,0,0.69999999};
			soundEnter[]=
			{
				"",
				0.1,
				1
			};
			soundPush[]=
			{
				"",
				0.1,
				1
			};
			soundClick[]=
			{
				"",
				0.1,
				1
			};
			soundEscape[]=
			{
				"",
				0.1,
				1
			};
			colorBackgroundDisabled[]={0.60000002,0.60000002,0.60000002,1};
			colorBackgroundActive[]={1,0.5,0,1};
			colorFocused[]={0,0,0,1};
			colorShadow[]={0,0,0,1};
			offsetX=0.0040000002;
			offsetY=0.0040000002;
			offsetPressedX=0.0020000001;
			offsetPressedY=0.0020000001;
			borderSize=0.0080000004;
			colorBorder[]={0,0,0,1};
			tooltip="Enter on numpad to commit. Escape key to cancel";
		};
	};
};
class inputText
{
	idd=585;
	fadein=0;
	fadeout=0;
	duration=9.9999998e+010;
	onUnload="uiNamespace setVariable [""coordReturn"", (_this select 1)];";
	class controls
	{
		class RscText
		{
			idc=1000;
			type=0;
			style=16;
			text="Input Name";
			x="0.446146 * safezoneW + safezoneX";
			y="0.649667 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.022 * safezoneH";
			font="PuristaMedium";
			lineSpacing=1;
			sizeEx=0.029999999;
			colorSelection[]={-1,-1,-1,-1};
			colorText[]={1,1,1,1};
			colorDisabled[]={-1,-1,-1,-1};
			colorBackground[]={0,0,0,0.69999999};
		};
		class RscEdit
		{
			idc=1400;
			maxChars=20;
			type=2;
			style=16;
			x="0.446374 * safezoneW + safezoneX";
			y="0.676 * safezoneH + safezoneY";
			w="0.0670312 * safezoneW";
			h="0.022 * safezoneH";
			font="PuristaMedium";
			autoComplete="";
			sizeEx=0.029999999;
			colorSelection[]={-1,-1,-1,-1};
			colorText[]={1,1,1,1};
			colorDisabled[]={-1,-1,-1,-1};
			colorBackground[]={0,0,0,0.69999999};
			text="";
		};
		class RscButton
		{
			idc=1600;
			type=1;
			style=16;
			action="closeDialog 1;_ctrl=(findDisplay 585) displayCtrl 1400;coords = ctrlText _ctrl;_ctrl ctrlSetText '';";
			text="ENTER";
			x="0.517532 * safezoneW + safezoneX";
			y="0.6496 * safezoneH + safezoneY";
			w="0.0309375 * safezoneW";
			h="0.044 * safezoneH";
			font="PuristaMedium";
			sizeEx=0.029999999;
			colorSelection[]={-1,-1,-1,-1};
			colorText[]={1,1,1,1};
			colorDisabled[]={-1,-1,-1,-1};
			colorBackground[]={0,0,0,0.69999999};
			soundEnter[]=
			{
				"",
				0.1,
				1
			};
			soundPush[]=
			{
				"",
				0.1,
				1
			};
			soundClick[]=
			{
				"",
				0.1,
				1
			};
			soundEscape[]=
			{
				"",
				0.1,
				1
			};
			colorBackgroundDisabled[]={0.60000002,0.60000002,0.60000002,1};
			colorBackgroundActive[]={1,0.5,0,1};
			colorFocused[]={0,0,0,1};
			colorShadow[]={0,0,0,1};
			offsetX=0.0040000002;
			offsetY=0.0040000002;
			offsetPressedX=0.0020000001;
			offsetPressedY=0.0020000001;
			borderSize=0.0080000004;
			colorBorder[]={0,0,0,1};
			tooltip="Enter on numpad to commit. Escape key to cancel";
		};
	};
};
class cfgMods
{
	author="Fat_Lurch";
	timepacked="1615733758";
};
