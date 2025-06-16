private _drone=_this select 0;
private _man=_this select 1;

_man setUnitPos"AUTO";
private _droneCycle=15;
private _alt=100+(random 100);
private _radius=200+(random 150);
private _targetRange=1000;
_drone flyInHeight _alt;
{deleteWaypoint _x}forEach(wayPoints(group _drone));
private _wp=(group _drone)addWaypoint[_man,0];
private _wpType="CIRCLE";
if((random 10)>5)then{_wpType="CIRCLE_L"};
{
_x setWaypointType"LOITER";
_x setWaypointLoiterRadius _radius;
_x setWaypointLoiterType _wpType;
}forEach(wayPoints(group _drone));

private _targets=[];
private _c=10;
while{TRUE}do{
	if!(alive _drone)exitWith{};
	if!(alive _man)exitWith{};
	_targets=_drone targets[TRUE,_targetRange];
	{_man reveal[_x,(_drone knowsAbout _x)]}forEach _targets;
	_c=_c-1;
	if(_c<1)then{
		_c=10;
		if((_drone distance2D _man)>(_radius+300))then{
			_drone doMove(getPos _man);
			{_x setWPpos(getPos _man)}forEach(wayPoints(group _drone));
		};
	};
	sleep _droneCycle;
};