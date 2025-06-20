    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
				class ED1D_Unpack {
                    displayName = "Deploy ED-1D (Demining)";
                    condition = """VS_C_ED_1D_Item"" in backpackItems _player";
                    statement = "_player call VS_C_Drone_fnc_ED1D_Create";
                    exceptions[] = {"isNotOnMap","isNotInside", "isNotSwimming","isNotSitting"};
                    icon = ""; // icontodo
				};
				class ED1E_Unpack {
                    displayName = "Deploy ED-1E (Science)";
                    condition = """VS_C_ED_1E_Item"" in backpackItems _player";
                    statement = "_player call VS_C_Drone_fnc_ED1E_Create";
                    exceptions[] = {"isNotOnMap","isNotInside", "isNotSwimming","isNotSitting"};
                    icon = ""; // icontodo
				};
				class AR2_Unpack {
                    displayName = "Deploy AR-2 (Darter)";
                    condition = """VS_C_AR2_Item"" in backpackItems _player";
                    statement = "_player call VS_C_Drone_fnc_AR2_Create";
                    exceptions[] = {"isNotOnMap","isNotInside", "isNotSwimming","isNotSitting"};
                    icon = ""; // icontodo
				};
                    class Mavik_3_Unpack {
                    displayName = "Deploy Mavik-3";
                    condition = """VS_C_Mavik_3_Item"" in backpackItems _player";
                    statement = "_player call VS_C_Drone_fnc_Mavik3_Create";
                    exceptions[] = {"isNotOnMap","isNotInside", "isNotSwimming","isNotSitting"};
                    icon = ""; // icontodo
                    };
                    class Mavik_3T_Unpack
                    {
                    displayName = "Deploy Mavik-3T";
                    condition = """VS_C_Mavik_3T_Item"" in backpackItems _player";
                    statement = "_player call VS_C_Drone_fnc_Mavik3T_Create";
                    exceptions[] = {"isNotOnMap","isNotInside", "isNotSwimming","isNotSitting"};
                    icon = ""; // icontodo
                    };
			};
		};
	};
