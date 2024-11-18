/* ----------------------------------------------------------------------------
    Function: vs_core_fnc_checkMedicClass

    Description:
    Continuously monitors the ACE medical class of the player and triggers the
    `vs_core_fnc_limitArsenal` function remotely on the server whenever the
    medical class changes. This is used to apply dynamic restrictions or
    modifications to the player's arsenal based on their medical role.

    Parameters:
    None (runs on the client for the local player).

    Returns:
    Nothing.

    Examples:
    This script is intended to be executed in an initialization script or client-side event handler.

    Authors:
    Carmichael
    License: GPL-3.0
---------------------------------------------------------------------------- */

[] spawn {
    private _previousMedicalClass = -1;

    while {true} do {
        private _currentMedicalClass = player getVariable ["ace_medical_medicClass", -1];

        if (_currentMedicalClass != _previousMedicalClass) then {
            _previousMedicalClass = _currentMedicalClass;

            [player] call vs_core_fnc_limitArsenal;
        };
        sleep 2;
    };
};
