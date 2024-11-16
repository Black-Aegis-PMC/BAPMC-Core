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

// Parse and concatenate the blacklists
_blacklistPrivate = parseSimpleArray VS_core_arsenal_blacklist_pvt;
_blacklistRecruit = _blacklistPrivate + (parseSimpleArray VS_core_arsenal_blacklist_rct);
_blacklistCadet = _blacklistRecruit + (parseSimpleArray VS_core_arsenal_blacklist_cdt);

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

// Check if the player matches IC criteria
private _isIC = (
    (_player get3DENAttribute "description" isEqualTo "1IC") ||
    (_player get3DENAttribute "description" isEqualTo "2IC") ||
	(_player get3DENAttribute "description" isEqualTo "IC") ||
    (typeOf _player == "BAPMC_IC")
);

// Parse additional items to be removed for non-IC players
private _nonICBlacklist = parseSimpleArray VS_core_arsenal_allowlist_IC;

// Proceed to limit the arsenal if blacklist is available
if (hasInterface) then {
    // Client-side logic for limiting the arsenal
    {
        if (!isNil { _x getVariable "ace_arsenal_virtualItems" }) then {
            // Apply rank-based limitation
            [_x, _blacklistedItems, false] call ace_arsenal_fnc_removeVirtualItems;

            // If the player is not IC, apply additional restrictions
            if (!_isIC) then {
                [_x, _nonICBlacklist, false] call ace_arsenal_fnc_removeVirtualItems;
                diag_log format ["[vs_core_fnc_limitArsenal] Additional items removed for non-IC player %1.", name _player];
            };

            diag_log format ["[vs_core_fnc_limitArsenal] Object %1 has ace_arsenal_virtualItems and is having items removed.", _x];
        };
    } forEach allMissionObjects "All";

    // Log successful limitation
    if (!(_blacklistedItems isEqualTo [])) then {
        systemChat format ["Arsenal limited according to your rank: %1", _playerRank];
    };
    if (!_isIC) then {
        systemChat "Additional items have been removed as you do not meet IC criteria.";
    };
} else {
    // If not on the client, log that this function is being run outside a client context
    diag_log "[vs_core_fnc_limitArsenal] Arsenal limitation attempted on a non-client machine.";
};
