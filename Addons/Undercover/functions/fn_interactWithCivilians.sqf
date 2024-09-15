/* ----------------------------------------------------------------------------
Function: VS_Undercover_fnc_interactWithCivilians

Description:
    Enables interactions with nearby civilians to manage suspicion levels. Allows
    players to ask for information or threaten civilians.

Usage:
    [] call VS_Undercover_fnc_interactWithCivilians;

Author:
    Amateur-god

License GPL-3.0
---------------------------------------------------------------------------- */

private _player = player;
private _suspicionLevel = _player getVariable ["suspicionLevel", 0];
private _nearbyCivilians = allUnits select {side _x == civilian && _x distance _player < 10};

// Interact with nearby civilians
{
    private _civilian = _x;

    // Check if player is undercover and close enough
    if (_civilian distance _player < 5 && _player getVariable ["isUndercover", false]) then {
        // Create a hint action
        _civilian addAction ["Ask for Information", {
            hint "You gained some useful information.";
            _player setVariable ["suspicionLevel", (_suspicionLevel - 10) max 0, true];
        }];

        _civilian addAction ["Threaten Civilian", {
            hint "Civilian is scared and runs away!";
            _civilian setBehaviour "COMBAT";
            _civilian setUnitPos "UP";
            _civilian doMove (getPos _player vectorAdd [10, 10, 0]);
            _player setVariable ["suspicionLevel", _suspicionLevel + 20, true];
        }];
    };
} forEach _nearbyCivilians;
