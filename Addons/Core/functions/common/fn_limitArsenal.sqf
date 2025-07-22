/* ----------------------------------------------------------------------------
    Function: vs_core_fnc_limitArsenal

    Description:
    Limits arsenal based on player rank and further restricts for non-IC players.

    Parameters:
    0: _player

    Returns:
    Nothing.

    Examples:
    [player] call vs_core_fnc_limitArsenal;

    Authors:
    Met
    Amateur-God (Carmichael)
    License GPL-2.0
---------------------------------------------------------------------------- */
params [["_player", player, [objNull]]];

// Check if the player object is valid
if (isNull _player) exitWith {
    diag_log "[vs_core_fnc_limitArsenal] Invalid player object.";
    false
};

private _description = _player get3DENAttribute "description";
private _type = typeOf _player;
private _medicClass = _player getVariable ["ace_medical_medicclass", -1];

private _isIC = (
    (_description in ["1: Section Leader", "5: Team Leader"]) ||
    (_type in [
        "BAPMC_IC"
    ])
);

private _isPilot = (
    (_type in [
        "BAPMC_Helicopter_Pilot",
        "BAPMC_Pilot",
        "BAPMC_Helicopter_Crew",
        "BAPMC_Fixed_Wing_Crew"
    ])
);

private _isVicCrew = (
    (_type in [
        "BAPMC_Vic_Crew"
    ])
);

private _isMedic = (
    (_description in ["medic"]) ||
    (_type in ["BAPMC_Medic"]) ||
    (_player getUnitTrait "Medic") ||
    (_medicClass == 1)
);

private _isSurgeon = (
    (_description in ["Surgeon"]) ||
    (_type in ["BAPMC_Surgeon"]) ||
    (_player getUnitTrait "Doctor") ||
    (_medicClass == 2)
);

// Parse and concatenate the blacklists
private _blacklistPrivate = parseSimpleArray VS_core_arsenal_blacklist_pvt;
private _blacklistRecruit = parseSimpleArray VS_core_arsenal_blacklist_rct;
private _blacklistCadet = parseSimpleArray VS_core_arsenal_blacklist_cdt;
private _SurgeonList = parseSimpleArray VS_core_arsenal_allowlist_surgeon;
private _pilotList = parseSimpleArray VS_core_arsenal_allowlist_pilot;
private _vicCrewList = parseSimpleArray VS_core_arsenal_allowlist_vicCrew;
private _MedicAllowList = parseSimpleArray VS_core_arsenal_allowlist_medic;
private _ICAllowList = parseSimpleArray VS_core_arsenal_allowlist_IC;
private _surgicalAllowlist = _SurgeonList + _MedicAllowList;
private _pilotAllowList = _ICAllowList + _pilotList;
private _vicCrewAllowList = _ICAllowList + _vicCrewList;
private _generalBlacklist = _pilotAllowList + _vicCrewList + _surgicalAllowlist;

// Get the player's name in lowercase and split by the first period (.)
private _playerName = toLower name _player;
private _splitName = _playerName splitString ". ";

// Ensure that the player's name contains a rank, else exit
if (count _splitName < 2) exitWith {
    diag_log format ["[vs_core_fnc_limitArsenal] Player name '%1' does not contain a rank.", _playerName];
    false
};

// Get the player's rank (assumed to be the first part of the name)
private _playerRank = _splitName select 0;
diag_log format ["[vs_core_fnc_limitArsenal] Player rank detected as: %1", _playerRank];

// Initialize blacklist for this player
private _blacklistedItems = [];
switch (_playerRank) do {
    case "cdt": { _blacklistedItems = _blacklistCadet; };
    case "rct": { _blacklistedItems = _blacklistRecruit; };
    case "pvt": { _blacklistedItems = _blacklistPrivate; };
};

// Log if no blacklist is found for the player's rank
if (_blacklistedItems isEqualTo []) then {
    diag_log format ["[vs_core_fnc_limitArsenal] No blacklist found for player rank '%1'.", _playerRank];
};

private _masterBlacklist = _blacklistedItems + _generalBlacklist;

// Proceed to limit the arsenal if blacklist is available
if (hasInterface) then {
        if (!isNil { _x getVariable "ace_arsenal_virtualItems" }) then {
            // 1. Apply Blacklist (Optimized)
            [_x, _masterBlacklist, false] call ace_arsenal_fnc_removeVirtualItems;

            // 2. Handle Role Allowlists
            if (_isPilot) then { [_x, _pilotAllowList, false] call ace_arsenal_fnc_addVirtualItems; };
            if (_isVicCrew) then { [_x, _vicCrewAllowList, false] call ace_arsenal_fnc_addVirtualItems; };
            if (_isIC) then { [_x, _ICAllowList, false] call ace_arsenal_fnc_addVirtualItems; };
            if (_isSurgeon) then { [_x, _surgicalAllowlist, false] call ace_arsenal_fnc_addVirtualItems; };
            if (_isMedic) then { [_x, _MedicAllowList, false] call ace_arsenal_fnc_addVirtualItems; };
        } forEach allMissionObjects "All";
    } else {
    // If not on the client, log that this function is being run outside a client context
    diag_log "[vs_core_fnc_limitArsenal] Arsenal limitation attempted on a non-client machine.";
};
