/* ----------------------------------------------------------------------------
Config: Direct Connect

Description:
	Registers direct connection tiles to the main menu spotlight.

Author:
	Carmichael
---------------------------------------------------------------------------- */

class CfgMainMenuSpotlight {
	class bapmc_operations_server {
		text = "Main Server";
		textIsQuote = 0;
		picture = "\x\VS_C\core\img\bapmc.paa";
		video = "";
		action = "connectToServer [""45.92.44.67"", 2302, ""Athena""]"; //This Goes [""IP"", Port, ""Password""], if you dont want the password visible just leave the pasword section empty.
		actionText = "Connect";
		condition = true; //Lies
	};
    class bapmc_Dev_server {
		text = "2nd Server";
		textIsQuote = 0;
		picture = "\x\VS_C\core\img\bapmc.paa";
		video = "";
		action = "connectToServer [""45.92.44.67"", 2402, ""Athena""]"; //This Goes [""IP"", Port, ""Password""], if you dont want the password visible just leave the pasword section empty.
		actionText = "Connect";
		condition = true;
	};
};
