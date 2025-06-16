private _drone=_this select 0;
private _positions=_this select 1;
_positions=[_positions,[],{_drone distance2D _x},"ASCEND"]call BIS_fnc_sortBy;
private _group=group _drone;
private _pos=[];
{deleteWaypoint _x}forEach(wayPoints _group);
{
_pos=_x;
private _wp=_group addWaypoint[_pos,100];
_wp setWaypointTimeout[5,10,20];
}forEach _positions;
if((count _pos)>0)then{
	_pos=_positions select 0;
	_group move _pos;
	private _wp=_group addWaypoint[_pos,100];
	_wp setWaypointType"CYCLE";
}else{
	{deleteWaypoint _x}forEach(wayPoints _group);
	private _wp=_group addWaypoint[_drone,0];
	private _wpType="CIRCLE";
	if((random 10)>5)then{_wpType="CIRCLE_L"};
	{
	_x setWaypointType"LOITER";
	_x setWaypointLoiterRadius _radius;
	_x setWaypointLoiterType _wpType;
	}forEach(wayPoints _group);
};
TRUE