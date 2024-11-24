/*License GPL-2.0*/
class VS_Core_edenGUI {
    idd = 1901;
    movingEnable = 1;
    class Controls {
        // Background and Frame
        class VS_Core_frame: RscFrame {
            idc = 1800;
            x = 0.1;
            y = 0.02;
            w = 0.734999;
            h = 1.0;
        };
        class VS_Core_background: RscBackground {
            idc = 1000;
            x = 0.1;
            y = 0.02;
            w = 0.7375;
            h = 1.0;
            colorBackground[] = {0, 0, 0, 0.6};
            sizeEx = 1.5 * GUI_GRID_H;
        };
        class VS_Core_title: RscText {
            idc = 1004;
            text = "Load Black Aegis - PMC Slots & Modules";
            x = 0.112499;
            y = 0.04;
            w = 0.554999;
            h = 0.04;
            sizeEx = 1.5 * GUI_GRID_H;
        };

        // Dropdown
        class VS_Core_camoSelectionText: RscText {
            idc = 1033;
            text = "Camo Selection:";
            x = 0.112499;
            y = 0.12;
            w = 0.24;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };
        class VS_Core_camoSelectionDropdown: RscCombo {
            idc = 1902;
            x = 0.124999;
            y = 0.18;
            w = 0.225;
            h = 0.06;
            colorBackground[] = {0.5, 0.5, 0.5, 0.6};
            tooltip = "Select camo option";
            sizeEx = 1.1 * GUI_GRID_H;
			class Items {
				class BLACK {
					text = "Black";
					data = "BLACK";
				};
			};
        };

        // Sliders and Counters
        class VS_Core_sectionAmountText: RscText {
            idc = 1003;
            text = "Number of Sections";
            x = 0.112499;
            y = 0.26;
            w = 0.225;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };
        class VS_Core_sectionAmountSlider: RscXSliderH {
            idc = 1900;
            x = 0.112499;
            y = 0.32;
            w = 0.225;
            h = 0.04;
            sliderRange[] = {0, 9};
            sliderPosition = 3;
            sliderStep = 1;
            tooltip = "Number of sections to spawn. Default: 3";
            onSliderPosChanged = "_this call {
                (findDisplay 1901 displayCtrl 1006) ctrlSetText str (_this select 1);
            };";
        };
        class VS_Core_sectionAmountCounter: RscText {
            idc = 1006;
            text = "3";
            x = 0.35;
            y = 0.32;
            w = 0.05;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };

        class VS_Core_ifvCrewText: RscText {
            idc = 1050;
            text = "Full IFV Crew";
            x = 0.112499;
            y = 0.38;
            w = 0.225;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };
        class VS_Core_ifvCrewSlider: RscXSliderH {
            idc = 1904;
            x = 0.112499;
            y = 0.44;
            w = 0.225;
            h = 0.04;
            sliderRange[] = {0, 5};
            sliderPosition = 0;
            sliderStep = 1;
            tooltip = "Number of IFV crew to spawn. x1 would spawn x3 IFV crew.";
            onSliderPosChanged = "_this call {
                (findDisplay 1901 displayCtrl 1007) ctrlSetText str (_this select 1);
            };";
        };
        class VS_Core_ifvCrewCounter: RscText {
            idc = 1007;
            text = "0";
            x = 0.35;
            y = 0.44;
            w = 0.05;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };

        class VS_Core_tankCrewText: RscText {
            idc = 1055;
            text = "Full Tank Crew";
            x = 0.112499;
            y = 0.50;
            w = 0.225;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };
        class VS_Core_tankCrewSlider: RscXSliderH {
            idc = 1912;
            x = 0.112499;
            y = 0.56;
            w = 0.225;
            h = 0.04;
            sliderRange[] = {0, 5};
            sliderPosition = 0;
            sliderStep = 1;
            tooltip = "Number of Tank crew to spawn. x1 would spawn x3 Tank crew.";
            onSliderPosChanged = "_this call {
                (findDisplay 1901 displayCtrl 1012) ctrlSetText str (_this select 1);
            };";
        };
        class VS_Core_tankCrewCounter: RscText {
            idc = 1012;
            text = "0";
            x = 0.35;
            y = 0.56;
            w = 0.05;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };

        class VS_Core_helicoptersText: RscText {
            idc = 1051;
            text = "Full Helicopter Crew";
            x = 0.112499;
            y = 0.62;
            w = 0.225;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };
        class VS_Core_helicoptersSlider: RscXSliderH {
            idc = 1905;
            x = 0.112499;
            y = 0.68;
            w = 0.225;
            h = 0.04;
            sliderRange[] = {0, 5};
            sliderPosition = 0;
            sliderStep = 1;
            tooltip = "Number of helicopter Pilot & Crew to spawn. 1 would spawn 1 pilot & 2 crew";
            onSliderPosChanged = "_this call {
                (findDisplay 1901 displayCtrl 1008) ctrlSetText str (_this select 1);
            };";
        };
        class VS_Core_helicoptersCounter: RscText {
            idc = 1008;
            text = "0";
            x = 0.35;
            y = 0.68;
            w = 0.05;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };

        class VS_Core_jetsText: RscText {
            idc = 1052;
            text = "Jet Pilots";
            x = 0.4;
            y = 0.26;
            w = 0.225;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };
        class VS_Core_jetsSlider: RscXSliderH {
            idc = 1906;
            x = 0.4;
            y = 0.32;
            w = 0.225;
            h = 0.04;
            sliderRange[] = {0, 5};
            sliderPosition = 0;
            sliderStep = 1;
            tooltip = "Number of jet pilots to spawn. x1 = 1 pilot";
            onSliderPosChanged = "_this call {
                (findDisplay 1901 displayCtrl 1909) ctrlSetText str (_this select 1);
            };";
        };
        class VS_Core_jetsCounter: RscText {
            idc = 1909;
            text = "0";
            x = 0.6375;
            y = 0.32;
            w = 0.05;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };

        class VS_Core_gunshipsText: RscText {
            idc = 1053;
            text = "Full Gunship Crew";
            x = 0.4;
            y = 0.38;
            w = 0.225;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };
        class VS_Core_gunshipsSlider: RscXSliderH {
            idc = 1907;
            x = 0.4;
            y = 0.44;
            w = 0.225;
            h = 0.04;
            sliderRange[] = {0, 5};
            sliderPosition = 0;
            sliderStep = 1;
            tooltip = "Number of gunship pilot & crew to spawn. x1 spawns 1 pilot & 3 crew for a AC-130";
            onSliderPosChanged = "_this call {
                (findDisplay 1901 displayCtrl 1910) ctrlSetText str (_this select 1);
            };";
        };
        class VS_Core_gunshipsCounter: RscText {
            idc = 1910;
            text = "0";
            x = 0.6375;
            y = 0.44;
            w = 0.05;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };

        class VS_Core_planesText: RscText {
            idc = 1054;
            text = "Full Transport/Cargo Plane Crew";
            x = 0.4;
            y = 0.50;
            w = 0.225;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };
        class VS_Core_planesSlider: RscXSliderH {
            idc = 1908;
            x = 0.4;
            y = 0.56;
            w = 0.225;
            h = 0.04;
            sliderRange[] = {0, 5};
            sliderPosition = 0;
            sliderStep = 1;
            tooltip = "Number of plane pilots to spawn. x1 = 1 pilot & 1 co-pilot";
            onSliderPosChanged = "_this call {
                (findDisplay 1901 displayCtrl 1911) ctrlSetText str (_this select 1);
            };";
        };
        class VS_Core_planesCounter: RscText {
            idc = 1911;
            text = "0";
            x = 0.6375;
            y = 0.56;
            w = 0.05;
            h = 0.04;
            sizeEx = 1.2 * GUI_GRID_H;
        };

        // OK and Cancel buttons
        class VS_Core_okButton: RscButtonMenuOK {
            x = 0.562499;
            y = 0.82;
            w = 0.12;
            h = 0.04;
            colorText[] = {1, 1, 1, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            onButtonClick = "
                private _camoCtrl = findDisplay 1901 displayCtrl 1902;
                private _camo = _camoCtrl lbData (lbCurSel _camoCtrl);
                private _numberOfSections = sliderPosition (findDisplay 1901 displayCtrl 1900);
                private _ifvCrew = sliderPosition (findDisplay 1901 displayCtrl 1904);
                private _tankCrew = sliderPosition (findDisplay 1901 displayCtrl 1912);
                private _helicopters = sliderPosition (findDisplay 1901 displayCtrl 1905);
                private _jets = sliderPosition (findDisplay 1901 displayCtrl 1906);
                private _gunships = sliderPosition (findDisplay 1901 displayCtrl 1907);
                private _planes = sliderPosition (findDisplay 1901 displayCtrl 1908);

                diag_log format[
                    'Camo: %1, Number of Sections: %2, Crewed Vehicles: %3, Tank Crew: %4, Helicopters: %5, Jets: %6, Gunships: %7, Planes: %8',
                    _camo, _numberOfSections, _ifvCrew, _tankCrew, _helicopters, _jets, _gunships, _planes
                ];

                [Shield, Olympus, _camo, _numberOfSections, _ifvCrew, _tankCrew, _helicopters, _jets, _gunships, _planes, true] call VS_Core_fnc_edenCreateAssets;
            ";
        };
        class VS_Core_cancelButton: RscButtonMenuCancel {
            x = 0.7;
            y = 0.82;
            w = 0.12;
            h = 0.04;
            colorText[] = {1, 1, 1, 1};
            colorBackground[] = {0, 0, 0, 0.8};
        };
    };
};
