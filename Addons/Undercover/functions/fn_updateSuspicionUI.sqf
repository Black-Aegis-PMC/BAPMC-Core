/* ----------------------------------------------------------------------------
Function: VS_Undercover_fnc_updateSuspicionUI

Description:
    Updates the custom UI element to display the current suspicion level of the player.

Usage:
    [] call VS_Undercover_fnc_updateSuspicionUI;

Author:
    Amateur-god

License GPL-3.0
---------------------------------------------------------------------------- */

private _display = uiNamespace getVariable ["VS_Undercover_RscSuspicionLevel", displayNull];
private _suspicionLevel = player getVariable ["suspicionLevel", 0];

if (!isNull _display) then {
    private _ctrl = _display displayCtrl 1000;
    _ctrl ctrlSetText format ["Suspicion Level: %1", _suspicionLevel];
};
