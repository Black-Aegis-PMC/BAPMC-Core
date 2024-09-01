/*License GPL-2.0*/
class Cfg3DEN
{
	class Object
	{
		class AttributeCategories
		{
			class VS_Core
			{
				displayName = "VS Core";
				collapsed = 1;
				class Attributes
				{
					class VS_CORE_IsLoadout
					{
						displayName = "Default Loadout?";
						tooltip = "Use this unit as a default loadout for the mission";
						property = "VS_CORE_3den_Loadout";
						control = "CheckboxState";
						expression = "if (_value == true) then {_this setVariable ['VS_Core_isLoadout',true, true];}";
						defaultValue = "false";
						condition = "objectControllable";
					};
					class VS_CORE_LoadoutRole
					{
						displayName = "Name:";
						tooltip = "Name of the loadout in the Arsenal; Accepts any string, including nothing. Duplicates will overwrite.";
						property = "VS_CORE_3den_LoadoutName";
						control = "Edit";
						expression = "_this setVariable ['VS_Core_loadout_role',_value, true];";
						defaultValue = "''";
						typeName = "STRING";
						condition = "objectControllable";
					};
				};
			};
		};
	};
};
