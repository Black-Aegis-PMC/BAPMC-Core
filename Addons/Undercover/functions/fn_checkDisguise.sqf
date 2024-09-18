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

License:
    GPL-3.0
---------------------------------------------------------------------------- */

_player = player;
_playerOriginalSide = side _player;
_playerOriginalGroup = group _player;
_playerUniform = uniform _player;
_playerVest = vest _player;
_playerHeadgear = headgear _player;
_playerBackpack = backpack _player;
_suspicionLevel = _player getVariable ["suspicionLevel", 0];
_isUndercover = false;
_disguisedAsFaction = "";
_undercoverSide = objNull; // Stores the side the player is disguised as

// Retrieve CBA settings values correctly
_suspicionThreshold = VS_Undercover_suspicionThreshold;
_suspicionIncreaseRate = VS_Undercover_suspicionIncreaseRate;

_safeUniformsWest = if (!isNil VS_Undercover_safeUniformsWest) then [{parseSimpleArray VS_Undercover_safeUniformsWest}, {[]}];
_safeVestsWest = if (!isNil VS_Undercover_safeVestsWest) then [{parseSimpleArray VS_Undercover_safeVestsWest}, {[]}];
_safeHeadgearWest = if (!isNil VS_Undercover_safeHeadgearWest) then [{parseSimpleArray VS_Undercover_safeHeadgearWest}, {[]}];
_safeBackpacksWest = if (!isNil VS_Undercover_safeBackpacksWest) then [{parseSimpleArray VS_Undercover_safeBackpacksWest}, {[]}];

_safeUniformsEast = if (!isNil VS_Undercover_safeUniformsEast) then [{parseSimpleArray VS_Undercover_safeUniformsEast}, {[]}];
_safeVestsEast = if (!isNil VS_Undercover_safeVestsEast) then [{parseSimpleArray VS_Undercover_safeVestsEast}, {[]}];
_safeHeadgearEast = if (!isNil VS_Undercover_safeHeadgearEast) then [{parseSimpleArray VS_Undercover_safeHeadgearEast}, {[]}];
_safeBackpacksEast = if (!isNil VS_Undercover_safeBackpacksEast) then [{parseSimpleArray VS_Undercover_safeBackpacksEast}, {[]}];

_safeUniformsInd = if (!isNil VS_Undercover_safeUniformsInd) then [{parseSimpleArray VS_Undercover_safeUniformsInd}, {[]}];
_safeVestsInd = if (!isNil VS_Undercover_safeVestsInd) then [{parseSimpleArray VS_Undercover_safeVestsInd}, {[]}];
_safeHeadgearInd = if (!isNil VS_Undercover_safeHeadgearInd) then [{parseSimpleArray VS_Undercover_safeHeadgearInd}, {[]}];
_safeBackpacksInd = if (!isNil VS_Undercover_safeBackpacksInd) then [{parseSimpleArray VS_Undercover_safeBackpacksInd}, {[]}];

_safeUniformsCiv = if (!isNil VS_Undercover_safeUniformsCiv) then [{parseSimpleArray VS_Undercover_safeUniformsCiv}, {[]}];
_safeVestsCiv = if (!isNil VS_Undercover_safeVestsCiv) then [{parseSimpleArray VS_Undercover_safeVestsCiv}, {[]}];
_safeHeadgearCiv = if (!isNil VS_Undercover_safeHeadgearCiv) then [{parseSimpleArray VS_Undercover_safeHeadgearCiv}, {[]}];
_safeBackpacksCiv = if (!isNil VS_Undercover_safeBackpacksCiv) then [{parseSimpleArray VS_Undercover_safeBackpacksCiv}, {[]}];

// Function to check if the player is undercover based on their equipment
_checkUndercover = {
    params ["_uniforms", "_vests", "_headgear", "_backpacks", "_faction", "_side"];
    if (
        (
            (_uniforms isEqualTo [] || { _playerUniform in _uniforms }) ||
            (_vests isEqualTo [] || { _playerVest in _vests }) ||
            (_headgear isEqualTo [] || { _playerHeadgear in _headgear }) ||
            (_backpacks isEqualTo [] || { _playerBackpack in _backpacks })
        )
    ) then {
        _disguisedAsFaction = _faction;
        _undercoverSide = _side;
        true
    } else {
        false
    };
};

// Function to update the suspicion level UI
_updateSuspicionUI = {
    _display = uiNamespace getVariable "VS_Undercover_RscSuspicionLevel";
    if (!isNull _display) then {
        _ctrlSuspicion = _display displayCtrl 1000;
        if (!isNull _ctrlSuspicion) then {
            _ctrlSuspicion ctrlSetText format ["Suspicion Level: %1", _suspicionLevel];
        };
    };
};

// Determine which faction the player is disguised as
_isUndercover = false;

_factions = [
    [_safeUniformsWest, _safeVestsWest, _safeHeadgearWest, _safeBackpacksWest, "West", west],
    [_safeUniformsEast, _safeVestsEast, _safeHeadgearEast, _safeBackpacksEast, "East", east],
    [_safeUniformsInd, _safeVestsInd, _safeHeadgearInd, _safeBackpacksInd, "Independent", resistance],
    [_safeUniformsCiv, _safeVestsCiv, _safeHeadgearCiv, _safeBackpacksCiv, "Civilian", civilian]
];

{
    if (_isUndercover) exitWith {};
    if (_x call _checkUndercover) then {
        _isUndercover = true;
    };
} forEach _factions;

// Manage suspicion level, player side, and initialize UI if undercover
if (_isUndercover) then {
    if (side _player != _undercoverSide) then {
        _enemyGroup = createGroup _undercoverSide;
        [_player] joinSilent _enemyGroup;
    };

    hint format ["You are disguised as: %1", _disguisedAsFaction];
    _player setVariable ["isUndercover", true, true];

} else {
    if (side _player != _playerOriginalSide) then {
        [_player] joinSilent _playerOriginalGroup;
    };
    _suspicionLevel = _suspicionLevel + (10 * _suspicionIncreaseRate);
    _player setVariable ["isUndercover", false, true];

    // Close the suspicion UI if it's open
    _display = uiNamespace getVariable "VS_Undercover_RscSuspicionLevel";
    if (!isNull _display) then {
        _display closeDisplay 1;
        uiNamespace setVariable ["VS_Undercover_RscSuspicionLevel", nil];
    };
};

// Proximity and line-of-sight checks for suspicion increase
{
    _enemy = _x;
    if (_enemy != _player) then {
        _distance = _player distance _enemy;
        if (_distance < 20) then {
            _suspicionLevel = _suspicionLevel + ((20 - _distance) * 0.5 * _suspicionIncreaseRate);
        };

        if ([_player, _enemy] call BIS_fnc_checkVisibility) then {
            _suspicionLevel = _suspicionLevel + (1 * _suspicionIncreaseRate);
        };
    };
} forEach (allUnits select {side _x != side _player && {side _x != civilian}});

// Cap suspicion level between 0 and 100
_suspicionLevel = _suspicionLevel max 0 min 100;
_player setVariable ["suspicionLevel", _suspicionLevel, true];

// Function to update the suspicion level and display a hint
_updateSuspicionLevel = {
    params ["_delta"];

    // Update the suspicion level
    _suspicionLevel = (_suspicionLevel + _delta) max 0 min 100;
    _player setVariable ["suspicionLevel", _suspicionLevel, true];

    // Display the suspicion level as a hint
    hint format ["Suspicion Level: %1", _suspicionLevel];
};


// Check for exposure and revert to original side
if (_suspicionLevel >= _suspicionThreshold) then {
    if (side _player != _playerOriginalSide) then {
        [_player] joinSilent _playerOriginalGroup;
        hint "You have been exposed!";
        _player setVariable ["isUndercover", false, true];

        // Close the suspicion UI if it's open
        _display = uiNamespace getVariable "VS_Undercover_RscSuspicionLevel";
        if (!isNull _display) then {
            _display closeDisplay 1;
            uiNamespace setVariable ["VS_Undercover_RscSuspicionLevel", nil];
        };
    };
};


// Debug output
hint format ["Suspicion Level: %1", _suspicionLevel];
