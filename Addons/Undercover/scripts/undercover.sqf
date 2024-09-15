/* ----------------------------------------------------------------------------
Script: undercover.sqf

Description:
    Main script to manage complex logic for undercover operations, like handling
    suspicion levels and player actions.

Usage:
    [] execVM "x\VS_C\Undercover\scripts\undercover.sqf";

Author:
    Amateur-god

License GPL-3.0
---------------------------------------------------------------------------- */

private _player = player;
private _suspicionLevel = _player getVariable ["suspicionLevel", 0];
private _isUndercover = _player getVariable ["isUndercover", false];
private _disguisedAsFaction = _player getVariable ["disguisedAsFaction", ""];

// Example logic to manage suspicion based on actions
if (_player isFiring) then {
    // Increase suspicion if the player is not being fired at or is not in a combat scenario
    if (!(combatMode _player in ["RED", "YELLOW"]) && !(_player isTargetedBy [] select 0)) then {
        _suspicionLevel = _suspicionLevel + 15;
    };
};

// Adjust suspicion level based on proximity, actions, and other factors
{
    private _unit = _x;
    private _dist = _player distance _unit;

    // Adjust suspicion level based on faction
    switch (_disguisedAsFaction) do {
        case "West": {
            if (side _unit == east || side _unit == independent) then {
                if (_dist < 30) then {
                    _suspicionLevel = _suspicionLevel + (30 - _dist) * 0.3;
                };
            };
        };
        case "East": {
            if (side _unit == west || side _unit == independent) then {
                if (_dist < 30) then {
                    _suspicionLevel = _suspicionLevel + (30 - _dist) * 0.3;
                };
            };
        };
        case "Independent": {
            if (side _unit == west || side _unit == east) then {
                if (_dist < 30) then {
                    _suspicionLevel = _suspicionLevel + (30 - _dist) * 0.3;
                };
            };
        };
        case "Civ": {
            if (side _unit == east || side _unit == west) then {
                if (_dist < 30) then {
                    _suspicionLevel = _suspicionLevel + (30 - _dist) * 0.3;
                };
            };
        };
        default {
            // Default behavior if no valid disguise is detected
            if (_dist < 30) then {
                _suspicionLevel = _suspicionLevel + (30 - _dist) * 0.5;
            };
        };
    };
} forEach (allUnits select {side _x == east || side _x == west || side _x == independent || side _x == civilian});

// Cap and update suspicion level
_suspicionLevel = _suspicionLevel max 0 min 100;
_player setVariable ["suspicionLevel", _suspicionLevel, true];

// If suspicion level is too high, remove disguise status
if (_suspicionLevel > _suspicionThreshold) then {
    [_player] joinSilent _playerOriginalGroup;
    _player setVariable ["isUndercover", false, true];
    hint "Your disguise has been compromised!";
};
