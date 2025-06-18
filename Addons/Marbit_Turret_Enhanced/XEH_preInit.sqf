/*
	Written 2019-02-03 by Erik Kofahl
	Last Edited 2019-02-04 - Adding more CBA options
	2019-11-30 - Adding Azimuth and Elevation indicators
*/

//diag_log "===FAT_LURCH DEDUG: XEH_preInit.sqf called===";

[
    "Fat_Lurch_ShowNorth", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Show North", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        //params ["_value"];
        //setViewDistance _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "Fat_Lurch_ShowAz", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Show Azimuth", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        //params ["_value"];
        //setViewDistance _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "Fat_Lurch_ShowEl", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Show Elevation", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        //params ["_value"];
        //setViewDistance _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "Fat_Lurch_ShowTarget", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Show Target Grid", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "Fat_Lurch_MapSlew", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Allow Map Slew", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "Fat_Lurch_Markers", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Allow Markers", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "Fat_Lurch_Grid", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Allow Slew to Grid", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "Fat_Lurch_Measure", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Allow Measuring", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    TRUE, // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "Fat_Lurch_GridNum", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type. CHECKBOX, EDITBOX, SLIDER, LIST or COLOR
    "Target Grid Digits", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Turret Enhanced", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[6,8,10],["6 Digit", "8 Digit", "10 Digit"],0 ], // data for this setting: [min, max, default, number of shown trailing decimals]
    nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

["Marbit_sideMarkerCounterPre", "SLIDER",  ["Marker Count Init", "Number to start counting when placing down markers"], ["Turret Enhanced","Overall Marker Settings"], [0,9990,0,0]] call CBA_fnc_addSetting;


["Marbit_MarkerZeroEnabler", "CHECKBOX", ["Mark with Text Enabled", "Enable/Disable displaying option in scrollwheel menu"], ["Turret Enhanced","Mark with Text - Settings"], true] call CBA_Settings_fnc_init;
["Marbit_MarkerZeroLabel", "EDITBOX",  ["Mark with Text Label", "Writes text before custom entered text"], ["Turret Enhanced","Mark with Text - Settings"], "HM"] call CBA_fnc_addSetting;
["Marbit_MarkerZeroLabelPost", "EDITBOX",  ["Mark with Text Label 2", "Writes text after custom entered text"], ["Turret Enhanced","Mark with Text - Settings"], ""] call CBA_fnc_addSetting;
["Marbit_MarkerZeroIcon", "EDITBOX",  ["Mark with Text Icon", "https://community.bistudio.com/wiki/Arma_3:_CfgMarkers"], ["Turret Enhanced","Mark with Text - Settings"], "hd_dot"] call CBA_fnc_addSetting;
["Marbit_MarkerZeroColor", "LIST",  ["Mark with Text Color", "Choose a color"], ["Turret Enhanced","Mark with Text - Settings"], [["ColorRed","ColorBlue","ColorBlack","ColorGrey","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorPink","ColorWhite","ColorWEST","ColorEAST","ColorGUER","ColorCIV","ColorUNKNOWN","colorBLUFOR","colorOPFOR","colorIndependent","colorCivilian"],["Red","Blue","Black","Grey","Brown","Orange","Yellow","Khaki","Green","Pink","White","WEST","EAST","GREENFOR","CIV","UNKNOWN","BLUFOR","OPFOR","Independent","Civilian"],5]] call CBA_fnc_addSetting;


["Marbit_MarkerOneEnabler", "CHECKBOX", ["Marker 1 Enabled", "Enable/Disable displaying option in scrollwheel menu"], ["Turret Enhanced","Marker 1 - Settings"], true] call CBA_Settings_fnc_init;
["Marbit_MarkerOneLabel", "EDITBOX",  ["Marker 1 Label", "Writes text before #"], ["Turret Enhanced","Marker 1 - Settings"],"HM"] call CBA_fnc_addSetting;
["Marbit_MarkerOneLabelPost", "EDITBOX",  ["Marker 1 Label 2", "Writes text after #"], ["Turret Enhanced","Marker 1 - Settings"]," "] call CBA_fnc_addSetting;
["Marbit_MarkerOneLabelPostCustom", "CHECKBOX",  ["Marker 1 Custom Dialog", "Enable/Disable displaying custom dialog for text input"], ["Turret Enhanced","Marker 1 - Settings"], false] call CBA_Settings_fnc_init;
["Marbit_MarkerOneIcon", "EDITBOX",  ["Marker 1 Icon", "https://community.bistudio.com/wiki/Arma_3:_CfgMarkers"], ["Turret Enhanced","Marker 1 - Settings"],"hd_dot"] call CBA_fnc_addSetting;
["Marbit_MarkerOneColor", "LIST",  ["Marker 1 Color", "Choose a color"],["Turret Enhanced","Marker 1 - Settings"], [["ColorRed","ColorBlue","ColorBlack","ColorGrey","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorPink","ColorWhite","ColorWEST","ColorEAST","ColorGUER","ColorCIV","ColorUNKNOWN","colorBLUFOR","colorOPFOR","colorIndependent","colorCivilian"],["Red","Blue","Black","Grey","Brown","Orange","Yellow","Khaki","Green","Pink","White","WEST","EAST","GREENFOR","CIV","UNKNOWN","BLUFOR","OPFOR","Independent","Civilian"],0]] call CBA_fnc_addSetting;

["Marbit_MarkerTwoEnabler", "CHECKBOX", ["Marker 2 Enabled", "Enable/Disable displaying option in scrollwheel menu"], ["Turret Enhanced","Marker 2 - Settings"], true] call CBA_Settings_fnc_init;
["Marbit_MarkerTwoLabel", "EDITBOX",  ["Marker 2 Label", "Writes text before #"], ["Turret Enhanced","Marker 2 - Settings"], "FM"] call CBA_fnc_addSetting;
["Marbit_MarkerTwoLabelPost", "EDITBOX",  ["Marker 2 Label 2", "Writes text after #"], ["Turret Enhanced","Marker 2 - Settings"], " "] call CBA_fnc_addSetting;
["Marbit_MarkerTwoLabelPostCustom", "CHECKBOX",  ["Marker 2 Custom Dialog", "Enable/Disable displaying custom dialog for text input"], ["Turret Enhanced","Marker 2 - Settings"], false] call CBA_Settings_fnc_init;
["Marbit_MarkerTwoIcon", "EDITBOX",  ["Marker 2 Icon", "https://community.bistudio.com/wiki/Arma_3:_CfgMarkers"], ["Turret Enhanced","Marker 2 - Settings"], "hd_dot"] call CBA_fnc_addSetting;
["Marbit_MarkerTwoColor", "LIST",  ["Marker 2 Color", "Choose a color"], ["Turret Enhanced","Marker 2 - Settings"], [["ColorRed","ColorBlue","ColorBlack","ColorGrey","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorPink","ColorWhite","ColorWEST","ColorEAST","ColorGUER","ColorCIV","ColorUNKNOWN","colorBLUFOR","colorOPFOR","colorIndependent","colorCivilian"],["Red","Blue","Black","Grey","Brown","Orange","Yellow","Khaki","Green","Pink","White","WEST","EAST","GREENFOR","CIV","UNKNOWN","BLUFOR","OPFOR","Independent","Civilian"],1]] call CBA_fnc_addSetting;

["Marbit_MarkerThreeEnabler", "CHECKBOX", ["Marker 3 Enabled", "Enable/Disable displaying option in scrollwheel menu"], ["Turret Enhanced","Marker 3 - Settings"], true] call CBA_Settings_fnc_init;
["Marbit_MarkerThreeLabel", "EDITBOX",  ["Marker 3 Label", "Writes text before #"], ["Turret Enhanced","Marker 3 - Settings"], ""] call CBA_fnc_addSetting;
["Marbit_MarkerThreeLabelPost", "EDITBOX",  ["Marker 3 Label 2", "Writes text after #"], ["Turret Enhanced","Marker 3 - Settings"], " "] call CBA_fnc_addSetting;
["Marbit_MarkerThreeLabelPostCustom", "CHECKBOX",  ["Marker 3 Custom Dialog", "Enable/Disable displaying custom dialog for text input"], ["Turret Enhanced","Marker 3 - Settings"], false] call CBA_Settings_fnc_init;
["Marbit_MarkerThreeIcon", "EDITBOX",  ["Marker 3 Icon", "https://community.bistudio.com/wiki/Arma_3:_CfgMarkers"], ["Turret Enhanced","Marker 3 - Settings"], "hd_dot"] call CBA_fnc_addSetting;
["Marbit_MarkerThreeColor", "LIST",  ["Marker 3 Color", "Choose a color"], ["Turret Enhanced","Marker 3 - Settings"], [["ColorRed","ColorBlue","ColorBlack","ColorGrey","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorPink","ColorWhite","ColorWEST","ColorEAST","ColorGUER","ColorCIV","ColorUNKNOWN","colorBLUFOR","colorOPFOR","colorIndependent","colorCivilian"],["Red","Blue","Black","Grey","Brown","Orange","Yellow","Khaki","Green","Pink","White","WEST","EAST","GREENFOR","CIV","UNKNOWN","BLUFOR","OPFOR","Independent","Civilian"],2]] call CBA_fnc_addSetting;

["Marbit_MarkerFourEnabler", "CHECKBOX", ["Marker 4 Enabled", "Enable/Disable displaying option in scrollwheel menu"], ["Turret Enhanced","Marker 4 - Settings"], true] call CBA_Settings_fnc_init;
["Marbit_MarkerFourLabel", "EDITBOX",  ["Marker 4 Label", "Writes text before #"], ["Turret Enhanced","Marker 4 - Settings"], ""] call CBA_fnc_addSetting;
["Marbit_MarkerFourLabelPost", "EDITBOX",  ["Marker 4 Label 2", "Writes text after #"], ["Turret Enhanced","Marker 4 - Settings"], " "] call CBA_fnc_addSetting;
["Marbit_MarkerFourLabelPostCustom", "CHECKBOX",  ["Marker 4 Custom Dialog", "Enable/Disable displaying custom dialog for text input"], ["Turret Enhanced","Marker 4 - Settings"], false] call CBA_Settings_fnc_init;
["Marbit_MarkerFourIcon", "EDITBOX",  ["Marker 4 Icon", "https://community.bistudio.com/wiki/Arma_3:_CfgMarkers"], ["Turret Enhanced","Marker 4 - Settings"], "hd_dot"] call CBA_fnc_addSetting;
["Marbit_MarkerFourColor", "LIST",  ["Marker 4 Color", "Choose a color"], ["Turret Enhanced","Marker 4 - Settings"], [["ColorRed","ColorBlue","ColorBlack","ColorGrey","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorPink","ColorWhite","ColorWEST","ColorEAST","ColorGUER","ColorCIV","ColorUNKNOWN","colorBLUFOR","colorOPFOR","colorIndependent","colorCivilian"],["Red","Blue","Black","Grey","Brown","Orange","Yellow","Khaki","Green","Pink","White","WEST","EAST","GREENFOR","CIV","UNKNOWN","BLUFOR","OPFOR","Independent","Civilian"],8]] call CBA_fnc_addSetting;

["Marbit_MarkerBHEnabler", "CHECKBOX", ["Marker Enabled", "Enable/Disable displaying option in scrollwheel menu"], ["Turret Enhanced","Black Hornet/Darter/Etc - Settings"], true] call CBA_Settings_fnc_init;
["Marbit_MarkerBHColor", "LIST",  ["Marker Color", "Choose a color"], ["Turret Enhanced","Black Hornet/Darter/Etc - Settings"], [["ColorRed","ColorBlue","ColorBlack","ColorGrey","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorPink","ColorWhite","ColorWEST","ColorEAST","ColorGUER","ColorCIV","ColorUNKNOWN","colorBLUFOR","colorOPFOR","colorIndependent","colorCivilian"],["Red","Blue","Black","Grey","Brown","Orange","Yellow","Khaki","Green","Pink","White","WEST","EAST","GREENFOR","CIV","UNKNOWN","BLUFOR","OPFOR","Independent","Civilian"],2]] call CBA_fnc_addSetting;
