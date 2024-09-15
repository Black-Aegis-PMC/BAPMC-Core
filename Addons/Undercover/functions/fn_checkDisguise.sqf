/* ----------------------------------------------------------------------------
Function: VS_Undercover_fnc_checkDisguise

Description:
    Checks the player's disguise status and determines which faction they are undercover as,
    based on the uniform, vest, headgear, and backpack they are wearing. Adjusts suspicion
    levels accordingly and initializes the suspicion level UI when the player is undercover.

Usage:
    [] call VS_Undercover_fnc_checkDisguise;

Author:
    Amateur-god

License GPL-3.0
---------------------------------------------------------------------------- */

private _player = player;
private _playerOriginalSide = side _player; // Get the player's original side
private _playerOriginalGroup = group _player; // Get the player's original group
private _playerUniform = uniform _player;
private _playerVest = vest _player;
private _playerHeadgear = headgear _player;
private _playerBackpack = backpack _player;
private _suspicionLevel = _player getVariable ["suspicionLevel", 0];
private _isUndercover = false;
private _disguisedAsFaction = "";
private _undercoverSide = ""; // Stores the side the player is disguised as

// Retrieve CBA settings values correctly
private _suspicionThreshold = ["VS_Undercover_suspicionThreshold", 50] call CBA_settings_fnc_get;
private _suspicionIncreaseRate = ["VS_Undercover_suspicionIncreaseRate", 1.0] call CBA_settings_fnc_get;

// Function to check if the player is undercover based on their equipment
private _checkUndercover = {
    params ["_uniforms", "_vests", "_headgear", "_backpacks", "_faction"];
    if ((_playerUniform in _uniforms) && (_playerVest in _vests) && (_playerHeadgear in _headgear) && (_playerBackpack in _backpacks)) then {
        _disguisedAsFaction = _faction;
        true
    } else {
        false
    };
};

// Debugging output to verify player's equipment
hint format ["Checking disguise...\nUniform: %1\nVest: %2\nHeadgear: %3\nBackpack: %4", _playerUniform, _playerVest, _playerHeadgear, _playerBackpack];

// Determine which faction the player is disguised as
if ([VS_Undercover_safeUniformsWest, VS_Undercover_safeVestsWest, VS_Undercover_safeHeadgearWest, VS_Undercover_safeBackpacksWest, "West"] call _checkUndercover) then {
    _isUndercover = true;
    _undercoverSide = west; // Set the undercover side
} else {
    if ([VS_Undercover_safeUniformsEast, VS_Undercover_safeVestsEast, VS_Undercover_safeHeadgearEast, VS_Undercover_safeBackpacksEast, "East"] call _checkUndercover) then {
        _isUndercover = true;
        _undercoverSide = east; // Set the undercover side
    } else {
        if ([VS_Undercover_safeUniformsInd, VS_Undercover_safeVestsInd, VS_Undercover_safeHeadgearInd, VS_Undercover_safeBackpacksInd, "Independent"] call _checkUndercover) then {
            _isUndercover = true;
            _undercoverSide = independent; // Set the undercover side
        } else {
            if ([VS_Undercover_safeUniformsCiv, VS_Undercover_safeVestsCiv, VS_Undercover_safeHeadgearCiv, VS_Undercover_safeBackpacksCiv, "Civilian"] call _checkUndercover) then {
                _isUndercover = true;
                _undercoverSide = civilian; // Set the undercover side
            };
        };
    };
};

// Manage suspicion level, player side, and initialize UI if undercover
if (_isUndercover) then {
    private _enemyGroup = createGroup _undercoverSide; // Create new group for the undercover side
    [_player] joinSilent _enemyGroup; // Join player to the new enemy group (use array)

    hint format ["You are disguised as: %1", _disguisedAsFaction];
    _player setVariable ["isUndercover", true, true]; // Store the undercover status

    // Initialize the suspicion UI if not already displayed
    [] spawn {
        waitUntil { !isNull (findDisplay 46) }; // Wait for the main display to be ready
        if (isNull (uiNamespace getVariable ["VS_Undercover_RscSuspicionLevel", displayNull])) then {
            createDialog "VS_Undercover_RscSuspicionLevel";
        };
    };

    // Update the suspicion level UI
    private _ctrlSuspicion = (uiNamespace getVariable "VS_Undercover_RscSuspicionLevel") displayCtrl 1000;
    _ctrlSuspicion ctrlSetText format ["Suspicion Level: %1", _suspicionLevel];

} else {
    [_player] joinSilent _playerOriginalGroup; // Restore original group (use array)
    _suspicionLevel = _suspicionLevel + (10 * _suspicionIncreaseRate); // Increase suspicion for improper disguise, scaled by rate
    _player setVariable ["isUndercover", false, true]; // Store the undercover status
};

// Proximity and line-of-sight checks for suspicion increase
{
    private _enemy = _x;
    private _distance = _player distance _enemy;
    if (_distance < 20) then {
        _suspicionLevel = _suspicionLevel + ((20 - _distance) * 0.5 * _suspicionIncreaseRate); // Increase suspicion based on distance, scaled by rate
    };

    if ([_player, _enemy, eyePos _enemy, true] call BIS_fnc_checkVisibility) then {
        _suspicionLevel = _suspicionLevel + (1 * _suspicionIncreaseRate); // Line of sight detected, scaled by rate
    };

} forEach (allUnits select {side _x == east || side _x == west || side _x == independent || side _x == civilian});

// Cap suspicion level between 0 and 100
_suspicionLevel = _suspicionLevel max 0 min 100;
_player setVariable ["suspicionLevel", _suspicionLevel, true];

// Check for exposure and revert to original side
if (_suspicionLevel > _suspicionThreshold) then {
    [_player] joinSilent _playerOriginalGroup; // Expose the player and reset to the original group (use array)
};

// Debug output
hint format ["Suspicion Level: %1", _suspicionLevel];
