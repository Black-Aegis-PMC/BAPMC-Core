/* ----------------------------------------------------------------------------
Config: ZEN Menu

Description:
	Registers ZEN Context Menu items to be used by Zeus when right clicking.

Author:
	Arend

License GPL-2.0
---------------------------------------------------------------------------- */
class zen_context_menu_actions {
	class vs_core_barracksFunction {
		displayName = "Add Barracks Functions";
		icon = "\a3\ui_f\data\logos\a_64_ca.paa";
		iconColor = [1,0.27,0,1];
		condition = "!(_objects isEqualTo [])";
		statement = "[_position, _objects] call vs_core_fnc_addBarracks;";

		class vs_core_fullHeal {
			displayName = "Add Full Heal";
			icon = "\x\VS_C\core\img\red-cross.paa";
			statement = "[_objects] remoteExec ['vs_core_fnc_fullHeal', 2];['Full Heal added!'] call vs_core_fnc_notifyZeus;";
		};

		class vs_core_spectator {
			displayName = "Add Spectator";
			icon = "\x\VS_C\core\img\camera.paa";
			statement = "[_objects] remoteExec ['vs_core_fnc_addSpectator', 2];['Spectator added!'] call vs_core_fnc_notifyZeus;";
		};
	};
};
