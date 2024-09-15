/* ----------------------------------------------------------------------------
Dialog: dialog.hpp

Description:
    Defines the custom UI elements for displaying the player's suspicion level.

Author:
    Amateur-god

License GPL-3.0
---------------------------------------------------------------------------- */

class VS_Undercover_RscSuspicionLevel {
    idd = -1;
    movingEnable = 0;
    duration = 1e+011;
    fadein = 0;
    fadeout = 0;
    name = "VS_Undercover_RscSuspicionLevel";
    onLoad = "uiNamespace setVariable ['VS_Undercover_RscSuspicionLevel', _this select 0]";
    controlsBackground[] = {};
    objects[] = {};
    class controls {
        class RscText_Suspicion {
            idc = 1000;
            type = 0;
            style = 0;
            x = safeZoneX + safeZoneW - 0.3;
            y = safeZoneY + 0.1;
            w = 0.25;
            h = 0.05;
            font = "PuristaMedium";
            sizeEx = 0.04;
            colorBackground[] = {0, 0, 0, 0.5};
            colorText[] = {1, 1, 1, 1};
            text = "Suspicion Level: 0";
        };
    };
};
