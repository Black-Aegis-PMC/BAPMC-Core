/*
Written by Erik Kofahl (Fat_Lurch) for TSOG
*/


if(!(Fat_Lurch_Markers)) exitWith {};

if ((isNull getConnectedUAV player) && (player == vehicle player)) exitwith {};
if (isNull getConnectedUAV player) then
{
	target = vehicle player;
}
else
{
	target = getconnectedUAV player;
};

if(!([player, target] call fatlurch_fnc_isViewISR)) exitwith {};
if(([player, target] call fatlurch_fnc_blacklistfrommark)) exitwith {};


_wPos = screenToWorld [0.5,0.5];
_seed = round(random 1e6); 
_var = "_USER_DEFINED_" + format["%1",_seed];
_grid = mapgridposition _wPos;
_channelArray = ["Global", "Side", "Command", "Group", "Vehicle", "Direct"];
_channel = currentChannel;

if (round(player distance2D _wPos)> 8000) then 
{systemChat "Out of Range - Check Plot!";

_wError =(round(player distance2D _wPos)) * 0.0000025;
_wErrorNeg = _wError * -1;
_wPos set [0,((_wPos select 0) * random [_wErrorNeg,0,_wError]) +  (_wPos select 0)];
_wPos set [1,((_wPos select 1) * random [_wErrorNeg,0,_wError]) + (_wPos select 1)];
};
	
systemChat format["Marker %1 created at %2 in %3", mkrNum, _grid, _channelArray select _channel];
hint format ["Marker %1 created at %2 in %3", mkrNum, _grid, _channelArray select _channel];  		  

_markerstr = createMarker [_var, _wPos, _channel, player]; 
_markerstr setMarkerShape "ICON"; 
_markerstr setMarkerType "hd_dot";
_markerstr setMarkerText format["%1",mkrNum];
_markerstr setMarkerColor Marbit_MarkerBHColor;
_markerstr setMarkerSize [0.5, 0.5];
mkrNum=mkrNum+1;
