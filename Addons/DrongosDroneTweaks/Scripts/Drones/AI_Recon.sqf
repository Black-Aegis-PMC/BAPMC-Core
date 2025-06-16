private _drone=_this select 0;
private _man=_this select 1;

if(ddtDebug)then{
	private _t=format["%1 starting RECON",_drone];
	_t call DDT_fnc_Debug;
};

private _droneCycle=15;
private _alt=(missionNamespace getVariable["ddtReconAlt",[100,300]])call BIS_fnc_RandomNum;
private _radius=(missionNamespace getVariable["ddtReconRadius",[2000,4000]])call BIS_fnc_RandomNum;
if(_drone isKindOf"sps_black_hornet_01_F")then{
	_alt=70;
	_radius=1000;
};
if(_drone isKindOf"UAV_02_Base_lxWS")then{
	_drone setCombatMode"YELLOW";
	_drone setBehaviour"AWARE";
};

_drone setAutonomous TRUE;
_drone flyInHeight[_alt,TRUE];
_drone setVariable["ddtAlt",_alt,TRUE];
private _pos=getPos _drone;

if(ddtDebug)then{
	private _t=format["%1 RECON ALT A:    %2",_drone,_alt];
	_t call DDT_fnc_Debug;
};

[_drone]spawn DDT_fnc_TakeOff;
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if(((getPosATL _drone)select 2)>1)exitWith{};
	sleep 3;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};

_drone flyInHeight[_alt,TRUE];

if(ddtDebug)then{
	private _t=format["%1 RECON ALT B:    %2",_drone,_alt];
	_t call DDT_fnc_Debug;
};

_drone setCaptive FALSE;
private _positions=[];
private _groupPos=getPos _man;

private _visited=[];
private _destination=getPos _drone;

// Search the immediate area for 2 mins, then start recon
[_drone,(getPos _drone)]call DDT_fnc_Loiter;
_drone flyInHeight[_alt,TRUE];
sleep 120;
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};

// Initial patrol
_positions=[(getPos _man),_radius]call DDT_fnc_GetLocations;
if((count _positions)<1)then{
	_drone setVariable["ddtLoiter",TRUE,TRUE];
	[_drone,(getPos _drone)]call DDT_fnc_Loiter;
}else{
	_positions=[_positions,[],{_drone distance2D _x},"ASCEND"]call BIS_fnc_sortBy;
	_pos=_positions select 0;
	_destination=[]+_pos;
	[_drone,_pos]call DDT_fnc_Move;
	_drone setVariable["ddtMoving",TRUE,TRUE];
	sleep 3;
};

while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if((fuel _drone)<0.1)exitWith{};
	if!(_drone getVariable["ddtLoiter",FALSE])then{
		// Exit if busy
		if(serverTime<(_drone getVariable["ddtBusyUntil",-1]))exitWith{};
		// Check if has destination
		if((count _destination)<1)then{
			// Reset if all positions have been visited
			_positions=_positions-_visited;
			if(((count _positions)<1)AND((count _visited)>0))then{
				_positions=[(getPos _man),_radius]call DDT_fnc_GetLocations;
				_visited=[];
			};
			// Move to closest position
			_positions=[_positions,[],{_drone distance2D _x},"ASCEND"]call BIS_fnc_sortBy;
			_pos=_positions select 0;
			_destination=[]+_pos;
			_drone setVariable["ddtMoving",TRUE,TRUE];
			_drone setVariable["ddtBusyUntil",-1,TRUE];
			[_drone,_pos]call DDT_fnc_Move;
		};
		// Check if at destination
		if((_drone distance2D _destination)<50)exitWith{
			_drone setVariable["ddtBusyUntil",(serverTime+(random 60)),TRUE];
			_drone setVariable["ddtMoving",FALSE,TRUE];
			_visited pushBack _destination;
			_destination=[];
		};
	};
	if((_groupPos distance2D(getPos _man))>500)then{
		_visited=[];
		_destination=[];
		_positions=[(getPos _man),_radius]call DDT_fnc_GetLocations;
		if((count _positions)>0)then{_drone setVariable["ddtLoiter",FALSE,TRUE]}else{
			_drone setVariable["ddtLoiter",TRUE,TRUE];
			[_drone,(getPos _drone)]call DDT_fnc_Loiter;
		};
	};
	sleep _droneCycle;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
[_drone,_man]spawn DDT_fnc_RTB;