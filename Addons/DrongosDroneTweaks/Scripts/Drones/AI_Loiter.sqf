private _drone=_this select 0;
private _man=_this select 1;

if(ddtDebug)then{systemChat format["%1 starting LOITER",_drone]};

private _droneCycle=60;
private _alt=(missionNamespace getVariable["ddtReconAlt",[100,300]])call BIS_fnc_RandomNum;
private _radius=(missionNamespace getVariable["ddtLoiterRadius",[200,900]])call BIS_fnc_RandomNum;

_drone setAutonomous TRUE;
_drone setVariable["ddtAlt",_alt,TRUE];
_drone flyInHeight[_alt,TRUE];
private _pos=getPos _drone;

[_drone]spawn DDT_fnc_TakeOff;
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if(((getPosATL _drone)select 2)>1)exitWith{};
	sleep 3;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};

_drone setCaptive FALSE;
[_drone,(getPos _drone)]call DDT_fnc_Loiter;

while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if((fuel _drone)<.1)exitWith{};
	if((_drone distance2D _man)>(_radius+300))then{
		[_drone,(getPos _man)]call DDT_fnc_Loiter;
	};
	sleep _droneCycle;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
[_drone,_man]spawn DDT_fnc_RTB;