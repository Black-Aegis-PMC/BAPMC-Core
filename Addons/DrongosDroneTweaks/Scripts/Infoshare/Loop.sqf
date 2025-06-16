private _group=_this select 0;
private _cycle=_this select 1;
private _radius=_this select 2;
private _targetRange=_this select 3;

private _alive=FALSE;
private _leader=objNull;
private _side=side _group;
private _pos=[];
private _man=objNull;
private _leaders=[];
private _targets=[];

while{TRUE}do{
	_alive=FALSE;
	{if(alive _x)exitWith{_alive=TRUE}}forEach(units _group);
	if!(_alive)exitWith{};
	_leader=leader _group;
	_pos=getPos(leader _group);
	{
	_man=leader _x;
	if((side _man)==_side)then{
		if(((vehicle _man)distance2D _pos)>_radius)exitWith{};
		_leaders pushBack _man;
	};	
	}forEach allGroups;
	{
	_man=_x;
	_targets=_man targets[TRUE,_targetRange];
	if(ddtDebug)then{
		(format["%1:  %2 targets from %3",_group,(count _targets),_man])call DDT_fnc_Debug;
	};
	{_leader reveal[_x,(_man knowsAbout _x)]}forEach _targets;
	}forEach _leaders;
	sleep _cycle;
};