/*
Written by Erik Kofahl (Fat_Lurch) for TSOG
*/

_unit = _this;

_pri = -1000;

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["Turret Enhanced","add_blk_marker", "Mark Target (Blk)",{_this call fatlurch_fnc_preaddMarkerBlk}, "", [nil, [true, false, false]]] call CBA_fnc_addKeybind;
["Turret Enhanced","add_blu_marker", "Mark Target (Blu)",{_this call fatlurch_fnc_preaddMarkerBlu}, "", [nil, [true, false, false]]] call CBA_fnc_addKeybind;
["Turret Enhanced","add_red_marker", "Mark Target (Red)",{_this call fatlurch_fnc_preaddMarkerRed}, "", [nil, [true, false, false]]] call CBA_fnc_addKeybind;
["Turret Enhanced","add_green_marker", "Mark Target (Green)",{_this call fatlurch_fnc_preaddMarkerRed}, "", [nil, [true, false, false]]] call CBA_fnc_addKeybind;
["Turret Enhanced","mark_with_text", "Mark with Text",{_this call fatlurch_fnc_preinputText}, "", [nil, [true, false, false]]] call CBA_fnc_addKeybind;
["Turret Enhanced","map_slew", "Map Slew",{_this call fatlurch_fnc_premapSlew}, "", [nil, [true, false, false]]] call CBA_fnc_addKeybind;
["Turret Enhanced","slew_to_grid", "Slew to Grid",{_this call fatlurch_fnc_preinputGrid}, "", [nil, [true, false, false]]] call CBA_fnc_addKeybind;



_unit addAction ["Mark Target (Blk)", "_this call fatlurch_fnc_addMarkerBlk",nil, _pri,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_Markers)&&([_this, _target] call fatlurch_fnc_blacklistfrommark)&&(Marbit_MarkerThreeEnabler))"];
_unit addAction ["Mark Target <t color='#0000FF'>(Blu)</t>", "_this call fatlurch_fnc_addMarkerBlu",nil, _pri - 1,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_Markers)&&([_this, _target] call fatlurch_fnc_blacklistfrommark)&&(Marbit_MarkerTwoEnabler))"];
_unit addAction ["Mark Target <t color='#FF0000'>(Red)</t>", "_this call fatlurch_fnc_addMarkerRed",nil, _pri - 2,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_Markers)&&([_this, _target] call fatlurch_fnc_blacklistfrommark)&&(Marbit_MarkerOneEnabler))"];
_unit addAction ["Mark Target <t color='#00FF00'>(Green)</t>", "_this call fatlurch_fnc_addMarkerGreen",nil, _pri - 2,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_Markers)&&([_this, _target] call fatlurch_fnc_blacklistfrommark)&&(Marbit_MarkerFourEnabler))"];

_unit addAction ["Mark Target (Blk)", "_this call fatlurch_fnc_BH",nil, _pri,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_Markers)&&!([_this, _target] call fatlurch_fnc_blacklistfrommark)&&(Marbit_MarkerBHEnabler))"];

_unit addAction ["Change Altitude", "_this call fatlurch_fnc_changeAltitude",nil, _pri - 3,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR) && (_target isKindOf 'uav'))"];	//2020_08_24
_unit addAction ["Change Loiter", "_this call fatlurch_fnc_changeLoiter",nil, _pri - 4,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR) && (_target isKindOf 'uav') && (waypointType [group _target, currentWaypoint group _target] == 'LOITER'))"];	//2020_08_24
_unit addAction ["Map Slew", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, _caller] call fatlurch_fnc_mapSlew;},nil, _pri - 5,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_MapSlew))"];
_unit addAction ["Slew to Grid", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target, _caller] call fatlurch_fnc_inputGrid;},nil, _pri - 6, false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_Grid))"];
_unit addAction ["Mark with Text", {params ["_target", "_caller", "_actionId", "_arguments"]; _this call fatlurch_fnc_inputText;},nil, _pri - 4, false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_Grid)&&([_this, _target] call fatlurch_fnc_blacklistfrommark)&&(Marbit_MarkerZeroEnabler))"];
_unit addAction ["Measure Distance", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target] call fatlurch_fnc_measDistance;},nil, _pri - 7,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(Fat_Lurch_Measure))"];
//Placeholder for Measure
_unit addAction ["Weapon Status", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target] call fatlurch_fnc_weaponReport;},nil, _pri - 9,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(_target isKindOf 'uav'))"];
_unit addAction ["Reset VMS", {params ["_target", "_caller", "_actionId", "_arguments"]; [_target] call fatlurch_fnc_resetUAV;},nil, _pri - 10,false, true, "","(([_this, _target] call fatlurch_fnc_isViewISR)&&(_target isKindOf 'uav'))"];



/* TODO

-Change Loiter Radius if UAV and current waypoint type is loiter

*/


_this spawn fatLurch_fnc_North_Ind;

mkrNum=0;


