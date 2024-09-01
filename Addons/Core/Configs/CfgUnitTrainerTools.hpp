/* ----------------------------------------------------------------------------
Config: Unit Trainer Tools

Description:
	Registers ACE Interactions for Unit Trainers to use as tools of their trade.

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_Actions {
			class VS_CORE_FullHeal {
				displayName = "Heal player";
				condition = "[_player] call VS_Core_fnc_isCurator";
				statement = "[_player, _target] call ace_medical_treatment_fnc_fullHeal;hint format[""%1 healed!"", name _target];";
				icon = "x\VS_C\core\red-cross.paa";
				position = "(_target selectionPosition [""spine3"", ""Memory""]) vectorAdd [0,0.1,0]";
				distance = 4;
				exceptions[] = {"isNotInside", "isNotSitting"};
			};
		};
	};
};

