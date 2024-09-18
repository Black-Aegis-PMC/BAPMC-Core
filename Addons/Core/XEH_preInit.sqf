/*
License GPL-2.0
*/
private _VS_core_settings = [
    [
		"VS_core_debug",
		"CHECKBOX",
		["Enable Debug", "Tick enable Viking Studios debug messages to appear in RPT and systemChat"],
		["Viking Studios Common", "Development"],
		false
	],
	[
		"VS_core_arsenal_objects",
		"EDITBOX",
		["Arsenal Objects", "Classnames, separated by commas and without double quotations, of objects that are spawnable by ""Add Filtered Arsenal"" module"],
		["Viking Studios Zeus", "Modules"],
		"C_supplyCrate_F,B_Slingload_01_Ammo_F"
	],
	[
		"VS_core_respawn_timer",
		"SLIDER",
		["Respawn Timer (seconds)", "Number of seconds player waves need to wait before respawn (0 -> 600 (10 minutes))"],
		["Viking Studios Zeus", "Respawn"],
		[1, 600, 5, 0],
		1,
		{
			setPlayerRespawnTime _this;
		}
	],
	[
		"VS_core_map_volume",
		"SLIDER",
		["Map Volume", "Volume to set when in a vehicle and looking at the map (so that you don't have to listen to loud as fuck helicopter rotors)"],
		"Viking Studios Common",
		[0, 1, 0.20, 2]
	],
	[
		"VS_core_arsenal_whitelist_mission",
		"EDITBOX",
		["Mission", "Mission specific equipment whitelist"],
		["Viking Studios Arsenal", "Arsenal Whitelists"],
		"[]",
		1,
		{
			// One day this will re-init all arsenals that have this filter set
		},
		true
	],
	[
        "VS_core_arsenal_whitelist_Standard",
        "EDITBOX",
        ["Standard", "Default equipment whitelist"],
        ["Viking Studios Arsenal", "Arsenal Whitelists"],
        "[]",
        1,
        {
            // One day this will re-init all arsenals that have this filter set
        },
        true
    ],
	[
        "VS_core_arsenal_blacklist_cdt",
        "EDITBOX",
        ["Cadet", "Cadet equipment Restrictions"],
        ["Viking Studios Arsenal Restrictions", "Blacklist"],
        "[]",
        1,
        {
        },
        true
    ],
	[
        "VS_core_arsenal_blacklist_rct",
        "EDITBOX",
        ["Recruit", "Recruit equipment Restrictions"],
        ["Viking Studios Arsenal Restrictions", "Blacklist"],
        "[]",
        1,
        {
        },
        true
    ],
	[
        "VS_core_arsenal_blacklist_pvt",
        "EDITBOX",
        ["Private", "Private equipment Restrictions"],
        ["Viking Studios Arsenal Restrictions", "Blacklist"],
        "[]",
        1,
        {
        },
        true
    ]
];

{_x call CBA_Settings_fnc_init;} forEach _VS_core_settings;
CHVD_allowNoGrass = false;
