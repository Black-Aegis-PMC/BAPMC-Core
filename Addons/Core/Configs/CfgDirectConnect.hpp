/* ----------------------------------------------------------------------------
Config: Direct Connect

Description:
	Registers direct connection tiles to the main menu spotlight.

Author:
	Arend
---------------------------------------------------------------------------- */
class CfgMainMenuSpotlight {
	class Server_Join {
		text = "Main Server";
		textIsQuote = 0;
		picture = "\x\VS_C\core\img\bapmc.paa";
		video = "";
		action = "connectToServer [""45.92.44.67"", 2302, """"]"; //This Goes [""IP"", Port, ""Password""], if you dont want the password visible just leave the pasword section empty.
		actionText = "Connect to server";
		condition = "true"; //Lies
	};
        class Viking_Welcome {
            text = "VKN Offical Mod";
            textIsQuote = 0;
            picture = "\VKN_Misc\VikingLogo512.paa";
            video = "\VKN_Misc\VKNLOGO_512x.ogv";
            action = "disableserialization; _script = [] execVM '\VKN_Functions\Functions\fn_ORBATCreate.sqf'; _code = uiNamespace getvariable 'CUR_bis_fnc_credits'; [_code] spawn _code;";
            actionText = "Developed By Viking PMC";
            condition = "false";
        };

};
