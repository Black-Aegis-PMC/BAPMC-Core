private _drone=_this select 0;
//private _group=_this select 1;
private _pos=getPos _drone;
private _pos2=_pos getPos[20,0];
_drone engineOn TRUE;
_drone flyInHeight 11;
[_drone,_pos]call DDT_fnc_Move;
private _c=5;
private _time=TIME+15;
private _airborne=FALSE;
while{TRUE}do{
	if!(alive _drone)exitWith{};
	if(((getPosATL _drone)select 2)>.5)exitWith{_airborne=TRUE};
	if(TIME>_time)then{[_drone,_pos2]call DDT_fnc_Move};
	if(_c<1)then{
		_drone setAutonomous TRUE;
		_drone engineOn TRUE;
		_c=5;
	};
	_c=_c-1;
	sleep 1;
};
if!(alive _drone)exitWith{};
if(_airborne)exitWith{};

// Try again
if(ddtDebug)then{"TAKEOFF FAILED, METHOD 2 ATTEMPTED"call DDT_fnc_Debug};
_drone setAutonomous TRUE;
_drone engineOn TRUE;
_c=5;
private _pos2=_pos getPos[50,0];
[_drone,_pos2]call DDT_fnc_Move;
while{TRUE}do{
	if!(alive _drone)exitWith{};
	if(((getPosATL _drone)select 2)>.5)exitWith{};
	if(_c<1)then{
		_drone setAutonomous TRUE;
		_drone engineOn TRUE;
		_c=5;
	};
	_c=_c-1;
	sleep 1;
};
if!(alive _drone)exitWith{};
//[_drone,_pos]call DDT_fnc_Move;