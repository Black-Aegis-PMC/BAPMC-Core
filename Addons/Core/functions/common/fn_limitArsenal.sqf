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
    Carmichael
    License GPL-2.0
---------------------------------------------------------------------------- */
params [["_player", player, [objNull]]];

// Check if the player object is valid
if (isNull _player) exitWith {
    diag_log "[vs_core_fnc_limitArsenal] Invalid player object.";
    false
};

private _isIC = (
    (_player get3DENAttribute "description" isEqualTo "1IC") ||
    (_player get3DENAttribute "description" isEqualTo "2IC") ||
	(_player get3DENAttribute "description" isEqualTo "IC") ||
    (typeOf _player == "BAPMC_IC") ||
    (typeOf _player == "BAPMC_Helicopter_Pilot") ||
    (typeOf _player == "BAPMC_Pilot") ||
    (typeOf _player == "BAPMC_Vic_Crew") ||
    (typeOf _player == "BAPMC_Helicopter_Crew") ||
    (typeOf _player == "BAPMC_Fixed_Wing_Crew") ||
	(_player getUnitTrait "Leader")
);

private _medicClass = player getVariable ["ace_medical_medicclass", -1];

private _isMedic = (
    (_player get3DENAttribute "description" isEqualTo "medic") ||
    (typeOf _player == "BAPMC_Medic") ||
	(_player getUnitTrait "Medic") ||
    (_medicClass == 1)

);

private _isSurgeon = (
    (_player get3DENAttribute "description" isEqualTo "Surgeon") ||
    (typeOf _player == "BAPMC_Surgeon") ||
	(_player getUnitTrait "Doctor") ||
    (_medicClass == 2)

);

private _ICList = parseSimpleArray VS_core_arsenal_allowlist_IC;
private _MedicAllowList = parseSimpleArray VS_core_arsenal_allowlist_medic;
private _SurgeonAllowList = parseSimpleArray VS_core_arsenal_allowlist_surgeon;
private _surgicalAllowlist = _SurgeonAllowList + _MedicAllowList;
private _ICAllowList = __blacklistPrivate + _blacklistRecruit + _blacklistCadet + _ICList;

// Parse and concatenate the blacklists
_blacklistPrivate = parseSimpleArray VS_core_arsenal_blacklist_pvt;
_blacklistRecruit = parseSimpleArray VS_core_arsenal_blacklist_rct;
_blacklistCadet = parseSimpleArray VS_core_arsenal_blacklist_cdt;

// Define ranks and their corresponding blacklists
private _ranks = [
    ["cdt", _blacklistCadet],
    ["rct", _blacklistRecruit],
    ["pvt", _blacklistPrivate]
];

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

// Loop through ranks and find the corresponding blacklist for the player's rank
{
    if (_x select 0 == _playerRank) then {
        _blacklistedItems = _x select 1;
    };
} forEach _ranks;

// Log if no blacklist is found for the player's rank
if (_blacklistedItems isEqualTo []) then {
    diag_log format ["[vs_core_fnc_limitArsenal] No blacklist found for player rank '%1'.", _playerRank];
};

// Proceed to limit the arsenal if blacklist is available
if (hasInterface) then {
    // Client-side logic for limiting the arsenal
    {
        if (!isNil { _x getVariable "ace_arsenal_virtualItems" }) then {
            // Apply rank-based limitation
            [_x, _blacklistedItems, false] call ace_arsenal_fnc_removeVirtualItems;

            // If the player is IC, Give extra stuff and remove stuff for non ICs (idiot proofing arsenal issues)
            if (!_isIC) then {
                [_x, _ICAllowList, false] call ace_arsenal_fnc_removeVirtualItems;
            };

            if (_isIC) then {
                [_x, _ICAllowList, false] call ace_arsenal_fnc_addVirtualItems;
            };

            if (!_isSurgeon || !_isMedic) then {
                [_x, _surgicalAllowlist, false] call ace_arsenal_fnc_removeVirtualItems;
            };

            if (_isMedic) then {
                [_x, _MedicAllowList, false] call ace_arsenal_fnc_addVirtualItems;
            };

            if (_isSurgeon) then {
                [_x, _surgicalAllowlist, false] call ace_arsenal_fnc_addVirtualItems;
            };
        };
    } forEach allMissionObjects "All";
} else {
    // If not on the client, log that this function is being run outside a client context
    diag_log "[vs_core_fnc_limitArsenal] Arsenal limitation attempted on a non-client machine.";
};
