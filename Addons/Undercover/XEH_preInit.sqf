/* ----------------------------------------------------------------------------
File: XEH_preinit.sqf

Description:
    Initializes the CBA settings for the Undercover mod to allow in-game configuration
    under the "Viking Studios Undercover" category in the addon options.

Author:
    Amateur-god

License GPL-3.0
---------------------------------------------------------------------------- */

private _VS_undercover_settings = [
    [
        "VS_Undercover_suspicionIncreaseRate",
        "SLIDER",
        ["Suspicion Increase Rate", "Rate at which suspicion increases (0.1 to 3.0)"],
        ["Viking Studios Undercover", "General"],
        [0.1, 3.0, 1.0, 1, false]
    ],
    [
        "VS_Undercover_enableCivInteraction",
        "CHECKBOX",
        ["Enable Civilian Interaction", "Allows interactions with civilians to affect suspicion."],
        ["Viking Studios Undercover", "General"],
        true
    ],
    [
        "VS_Undercover_suspicionThreshold",
        "SLIDER",
        ["Suspicion Threshold for Exposure", "The level of suspicion above which the player will be exposed (0 to 100)."],
        ["Viking Studios Undercover", "General"],
        [0, 100, 50, 0, false]
    ],
    // Undercover settings for West faction
    [
        "VS_Undercover_safeUniformsWest",
        "EDITBOX",
        ["Safe Uniforms (West)", "List of uniform classnames for going undercover as West ."],
        ["Viking Studios Undercover", "Disguises - West"],
        "[]"
    ],
    [
        "VS_Undercover_safeVestsWest",
        "EDITBOX",
        ["Safe Vests (West)", "List of vest classnames for going undercover as West ."],
        ["Viking Studios Undercover", "Disguises - West"],
        "[]"
    ],
    [
        "VS_Undercover_safeHeadgearWest",
        "EDITBOX",
        ["Safe Headgear (West)", "List of headgear classnames for going undercover as West ."],
        ["Viking Studios Undercover", "Disguises - West"],
        "[]"
    ],
    [
        "VS_Undercover_safeBackpacksWest",
        "EDITBOX",
        ["Safe Backpacks (West)", "List of backpack classnames for going undercover as West ."],
        ["Viking Studios Undercover", "Disguises - West"],
        "[]"
    ],
    // Undercover settings for East faction
    [
        "VS_Undercover_safeUniformsEast",
        "EDITBOX",
        ["Safe Uniforms (East)", "List of uniform classnames for going undercover as East ."],
        ["Viking Studios Undercover", "Disguises - East"],
        "[]"
    ],
    [
        "VS_Undercover_safeVestsEast",
        "EDITBOX",
        ["Safe Vests (East)", "List of vest classnames for going undercover as East ."],
        ["Viking Studios Undercover", "Disguises - East"],
        "[]"
    ],
    [
        "VS_Undercover_safeHeadgearEast",
        "EDITBOX",
        ["Safe Headgear (East)", "List of headgear classnames for going undercover as East ."],
        ["Viking Studios Undercover", "Disguises - East"],
        "[]"
    ],
    [
        "VS_Undercover_safeBackpacksEast",
        "EDITBOX",
        ["Safe Backpacks (East)", "List of backpack classnames for going undercover as East ."],
        ["Viking Studios Undercover", "Disguises - East"],
        "[]"
    ],
    // Undercover settings for Independent faction
    [
        "VS_Undercover_safeUniformsInd",
        "EDITBOX",
        ["Safe Uniforms (Independent)", "List of uniform classnames for going undercover as Independent ."],
        ["Viking Studios Undercover", "Disguises - Independent"],
        "[]"
    ],
    [
        "VS_Undercover_safeVestsInd",
        "EDITBOX",
        ["Safe Vests (Independent)", "List of vest classnames for going undercover as Independent ."],
        ["Viking Studios Undercover", "Disguises - Independent"],
        "[]"
    ],
    [
        "VS_Undercover_safeHeadgearInd",
        "EDITBOX",
        ["Safe Headgear (Independent)", "List of headgear classnames for going undercover as Independent ."],
        ["Viking Studios Undercover", "Disguises - Independent"],
        "[]"
    ],
    [
        "VS_Undercover_safeBackpacksInd",
        "EDITBOX",
        ["Safe Backpacks (Independent)", "List of backpack classnames for going undercover as Independent ."],
        ["Viking Studios Undercover", "Disguises - Independent"],
        "[]"
    ],
    // Undercover settings for Civ faction
    [
        "VS_Undercover_safeUniformsCiv",
        "EDITBOX",
        ["Safe Uniforms (Civ)", "List of uniform classnames for going undercover as Civilian ."],
        ["Viking Studios Undercover", "Disguises - Civ"],
        "[]"
    ],
    [
        "VS_Undercover_safeVestsCiv",
        "EDITBOX",
        ["Safe Vests (Civ)", "List of vest classnames for going undercover as Civilian ."],
        ["Viking Studios Undercover", "Disguises - Civ"],
        "[]"
    ],
    [
        "VS_Undercover_safeHeadgearCiv",
        "EDITBOX",
        ["Safe Headgear (Civ)", "List of headgear classnames for going undercover as Civilian ."],
        ["Viking Studios Undercover", "Disguises - Civ"],
        "[]"
    ],
    [
        "VS_Undercover_safeBackpacksCiv",
        "EDITBOX",
        ["Safe Backpacks (Civ)", "List of backpack classnames for going undercover as Civilian."],
        ["Viking Studios Undercover", "Disguises - Civ"],
        "[]"
    ]
];

// Initialize the settings
{_x call CBA_Settings_fnc_init;} forEach _VS_undercover_settings;
