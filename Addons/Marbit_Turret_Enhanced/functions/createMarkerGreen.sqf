/*
Written by Erik Kofahl (Fat_Lurch) for TSOG
private _markerNum = [side player] call fatlurch_fnc_getNextMarkerNumber
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
if(!([player, target] call fatlurch_fnc_blacklistfrommark)) exitwith {};

_wPos = screenToWorld [0.5,0.5]; 
_seed = round(random 1e6); 
_var = "_USER_DEFINED_" + format["%1",_seed];
_grid = mapgridposition _wPos;
_channelArray = ["Global", "Side", "Command", "Group", "Vehicle", "Direct"];
_channel = currentChannel;

if (Marbit_MarkerFourLabelPostCustom == true) then 
{
createDialog "inputText";

waitUntil {!isNull (findDisplay 585);};
_ctrl=(findDisplay 585) displayCtrl 1400;
(findDisplay 585) displayAddEventHandler ["KeyDown", "if((_this select 1==0x9C)||(_this select 1==0x1C)) then {closeDialog 1;_ctrl=(findDisplay 585) displayCtrl 1400;coords = ctrlText _ctrl;_ctrl ctrlSetText '';};"];		//Use Enter key
 ctrlSetFocus _ctrl; 	//Set focus on the text edit 
waitUntil {!dialog};		//wait until the dialog is closed
_return=uinamespace getVariable "coordReturn";	//Return if the user commited the input or cancelled
	if (_return==1 ) then 
	{
	    private _markerNum = [side player] call fatlurch_fnc_getNextMarkerNumber;
	
		systemChat format["Marker %1%2%5%6 created at %3 in %4", Marbit_MarkerFourLabel, _markerNum, _grid, _channelArray select _channel, Marbit_MarkerFourLabelPost, coords];
		hint format ["Marker %1%2%5%6 created at  %3 in %4", Marbit_MarkerFourLabel, _markerNum, _grid, _channelArray select _channel, Marbit_MarkerFourLabelPost, coords];  
		player createDiaryRecord ["Diary", ["LINK16", format ["Marker %1%2%5%6 at %3 in %4", Marbit_MarkerFourLabel, _markerNum, _grid, _channelArray select _channel, Marbit_MarkerFourLabelPost,coords]]]; 

		_markerstr = createMarker [_var, _wPos, _channel, player]; 
		_markerstr setMarkerShape "ICON"; 
		_markerstr setMarkerType Marbit_MarkerFourIcon;
		_markerstr setMarkerText format["%1%2%3%4",Marbit_MarkerFourLabel,_markerNum,Marbit_MarkerFourLabelPost,coords];
		_markerstr setMarkerColor Marbit_MarkerFourColor;
		_markerstr setMarkerSize [0.5, 0.5];
		
	}
	else{
	systemChat "Operation Cancelled";
	};
}
else{	
        private _markerNum = [side player] call fatlurch_fnc_getNextMarkerNumber;

		systemChat format["Marker %1%2%5 created at %3 in %4", Marbit_MarkerFourLabel, _markerNum, _grid, _channelArray select _channel, Marbit_MarkerFourLabelPost];
		hint format ["Marker %1%2%5 created at  %3 in %4", Marbit_MarkerFourLabel, _markerNum, _grid, _channelArray select _channel, Marbit_MarkerFourLabelPost];  
		player createDiaryRecord ["Diary", ["LINK16", format ["Marker %1%2%5 at %3 in %4", Marbit_MarkerFourLabel, _markerNum, _grid, _channelArray select _channel, Marbit_MarkerFourLabelPost]]]; 

		_markerstr = createMarker [_var, _wPos, _channel, player]; 
		_markerstr setMarkerShape "ICON"; 
		_markerstr setMarkerType Marbit_MarkerFourIcon;
		_markerstr setMarkerText format["%1%2%3",Marbit_MarkerFourLabel,_markerNum,Marbit_MarkerFourLabelPost];
		_markerstr setMarkerColor Marbit_MarkerFourColor;
		_markerstr setMarkerSize [0.5, 0.5];
		private _markerNum = [side player] call fatlurch_fnc_getNextMarkerNumber;
	};



