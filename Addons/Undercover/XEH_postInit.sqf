/* ----------------------------------------------------------------------------
File: XEH_postInit.sqf

Description:
    Initializes the Undercover system in post-init, ensuring that all game state
    and player data are fully available.

Author:
    Amateur-god

License GPL-3.0
---------------------------------------------------------------------------- */

// Add initialization function to the CBA mission loaded handler
["CBA_missionLoaded", {
    [] spawn {
        hint "Undercover system initialized."; // Shows once when mission loads
        while {true} do {
            [] call VS_Undercover_fnc_checkDisguise;
            [] call VS_Undercover_fnc_interactWithCivilians;
            sleep 5; // Wait 5 seconds before the next check
        };
    };
}] call CBA_fnc_addEventHandler;
