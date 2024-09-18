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

private _player = player;
private _playerOriginalSide = side _player;
private _playerOriginalGroup = group _player;
private _playerUniform = uniform _player;
private _playerVest = vest _player;
private _playerHeadgear = headgear _player;
private _playerBackpack = backpack _player;
private _suspicionLevel = _player getVariable ["suspicionLevel", 0];
private _isUndercover = false;
private _disguisedAsFaction = "";
private _undercoverSide = objNull; // Stores the side the player is disguised as

// Retrieve CBA settings values correctly
private _suspicionThreshold = VS_Undercover_suspicionThreshold;
private _suspicionIncreaseRate = VS_Undercover_suspicionIncreaseRate;

private _safeUniformsWest = parseSimpleArray VS_Undercover_safeUniformsWest;
private _safeVestsWest = parseSimpleArray VS_Undercover_safeVestsWest;
private _safeHeadgearWest = parseSimpleArray VS_Undercover_safeHeadgearWest;
private _safeBackpacksWest = parseSimpleArray VS_Undercover_safeBackpacksWest;

private _safeUniformsEast = parseSimpleArray VS_Undercover_safeUniformsEast;
private _safeVestsEast = parseSimpleArray VS_Undercover_safeVestsEast;
private _safeHeadgearEast = parseSimpleArray VS_Undercover_safeHeadgearEast;
private _safeBackpacksEast = parseSimpleArray VS_Undercover_safeBackpacksEast;

private _safeUniformsInd = parseSimpleArray VS_Undercover_safeUniformsInd;
private _safeVestsInd = parseSimpleArray VS_Undercover_safeVestsInd;
private _safeHeadgearInd = parseSimpleArray VS_Undercover_safeHeadgearInd;
private _safeBackpacksInd = parseSimpleArray VS_Undercover_safeBackpacksInd;

private _safeUniformsCiv = parseSimpleArray VS_Undercover_safeUniformsCiv;
private _safeVestsCiv = parseSimpleArray VS_Undercover_safeVestsCiv;
private _safeHeadgearCiv = parseSimpleArray VS_Undercover_safeHeadgearCiv;
private _safeBackpacksCiv = parseSimpleArray VS_Undercover_safeBackpacksCiv;

// Function to check if the player is undercover based on their equipment
private _checkUndercover = {
    params ["_uniforms", "_vests", "_headgear", "_backpacks", "_faction", "_side"];
    if (
        (
            (_uniforms isEqualTo [] || { _playerUniform in _uniforms }) &&
            (_vests isEqualTo [] || { _playerVest in _vests }) &&
            (_headgear isEqualTo [] || { _playerHeadgear in _headgear }) &&
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

// Debugging output to verify player's equipment
hint format ["Checking disguise...\nUniform: %1\nVest: %2\nHeadgear: %3\nBackpack: %4", _playerUniform, _playerVest, _playerHeadgear, _playerBackpack];

// Determine which faction the player is disguised as
if ([_safeUniformsWest, _safeVestsWest, _safeHeadgearWest, _safeBackpacksWest, "West", west] call _checkUndercover) then {
    _isUndercover = true;
} else {
    if ([_safeUniformsEast, _safeVestsEast, _safeHeadgearEast, _safeBackpacksEast, "East", east] call _checkUndercover) then {
        _isUndercover = true;
    } else {
        if ([_safeUniformsInd, _safeVestsInd, _safeHeadgearInd, _safeBackpacksInd, "Independent", resistance] call _checkUndercover) then {
            _isUndercover = true;
        } else {
            if ([_safeUniformsCiv, _safeVestsCiv, _safeHeadgearCiv, _safeBackpacksCiv, "Civilian", civilian] call _checkUndercover) then {
                _isUndercover = true;
            };
        };
    };
};

// Manage suspicion level, player side, and initialize UI if undercover
if (_isUndercover) then {
    if (side _player != _undercoverSide) then {
        private _enemyGroup = createGroup _undercoverSide;
        [_player] joinSilent _enemyGroup;
    };

    hint format ["You are disguised as: %1", _disguisedAsFaction];
    _player setVariable ["isUndercover", true, true];

    // Initialize the suspicion UI if not already displayed
    [] spawn {
        waitUntil { !isNull (findDisplay 46) };
        if (isNull (uiNamespace getVariable ["VS_Undercover_RscSuspicionLevel"])) then {
            createDialog "VS_Undercover_RscSuspicionLevel";
        };
    };

    // Update the suspicion level UI
    private _ctrlSuspicion = (uiNamespace getVariable "VS_Undercover_RscSuspicionLevel") displayCtrl 1000;
    if (!isNull _ctrlSuspicion) then {
        _ctrlSuspicion ctrlSetText format ["Suspicion Level: %1", _suspicionLevel];
    };

} else {
    if (side _player != _playerOriginalSide) then {
        [_player] joinSilent _playerOriginalGroup;
    };
    _suspicionLevel = _suspicionLevel + (10 * _suspicionIncreaseRate);
    _player setVariable ["isUndercover", false, true];
};

// Proximity and line-of-sight checks for suspicion increase
{
    private _enemy = _x;
    if (_enemy != _player) then {
        private _distance = _player distance _enemy;
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

// Check for exposure and revert to original side
if (_suspicionLevel >= _suspicionThreshold) then {
    if (side _player != _playerOriginalSide) then {
        [_player] joinSilent _playerOriginalGroup;
        hint "You have been exposed!";
        _player setVariable ["isUndercover", false, true];
    };
};

// Debug output
hint format ["Suspicion Level: %1", _suspicionLevel];
