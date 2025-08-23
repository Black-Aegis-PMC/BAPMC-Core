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
    Amateur-God
    License GPL-2.0
---------------------------------------------------------------------------- */
params [["_player", player, [objNull]]];

// Check if the player object is valid
if (isNull _player) exitWith {
    diag_log "[vs_core_fnc_limitArsenal] Invalid player object.";
    false
};

private _climate = missionNamespace getVariable [format["vs_core_climate_%1", worldName], "all"];

private _TropicalAllowlist = parseSimpleArray VS_core_camo_whitelist_tropical;
private _ArcticAllowlist = parseSimpleArray VS_core_camo_whitelist_arctic;
private _DesertAllowlist = parseSimpleArray VS_core_camo_whitelist_desert;
private _TemperateAllowlist = parseSimpleArray VS_core_camo_whitelist_temperate;
private _allAllowlist = _TropicalAllowlist + _ArcticAllowlist + _DesertAllowlist + _TemperateAllowlist;


private _camoAllowlist = [];
switch (_climate) do {
    case "tropical": { _camoAllowlist = _TropicalAllowlist; };
    case "arctic": { _camoAllowlist = _ArcticAllowlist; };
    case "desert": { _camoAllowlist = _DesertAllowlist; };
    case "temperate": { _camoAllowlist = _TemperateAllowlist; };
    case "all": { _camoAllowlist = _allAllowlist; };
};

// Proceed to limit the arsenal if blacklist is available
if (hasInterface) then {
        if (!isNil { _x getVariable "ace_arsenal_virtualItems" }) then {
        // 3. Handle Camo Allowlists
        if !(_camoAllowlist isEqualTo []) then {
            [_x, _camoAllowlist, false] call ace_arsenal_fnc_addVirtualItems;
            };
        } forEach allMissionObjects "All";
} else {
    // If not on the client, log that this function is being run outside a client context
    diag_log "[vs_core_fnc_limitArsenal] Arsenal limitation attempted on a non-client machine.";
};
