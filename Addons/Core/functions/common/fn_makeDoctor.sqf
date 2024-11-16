/* ----------------------------------------------------------------------------
    Function: vs_core_fnc_makeDocto

    Description:
    Sets the ACE medical class for units based on their display name. If a unit's
    display name contains "doctor" or "surgeon" (case-insensitive), it assigns
    an advanced medical role by setting the `ace_medical_medicClass` variable to 2.

    Parameters:
    0: _unit (Object) - The unit to check and potentially set as an advanced medic.

    Returns:
    Nothing.

    Examples:
    [unit] call vs_core_fnc_makeDoctor;

    Authors:
    Carmichael
    License: GPL-3.0
---------------------------------------------------------------------------- */

private _unit = _this select 0; // The unit passed to the script
private _unitDisplayName = toLower getText (configOf _unit >> "displayName");

if (str _unitDisplayName find "doctor" >= 0 || str _unitDisplayName find "surgeon" >= 0) then {
    _unit setVariable ["ace_medical_medicClass", 2, true];
};
