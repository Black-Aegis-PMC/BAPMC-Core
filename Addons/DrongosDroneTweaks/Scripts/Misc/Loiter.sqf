private _drone=_this select 0;
private _pos=_this select 1;
private _radius=(missionNamespace getVariable["ddtLoiterRadius",[300,600]])call BIS_fnc_RandomNum;
private _group=group _drone;
{deleteWaypoint _x}forEach(wayPoints _group);
if(ddtDebug)then{systemChat format["%1 loiter at %2",_drone,_pos]};
private _alt=_drone getVariable["ddtAlt",200];
_drone flyInHeight[_alt,TRUE];
_group move _pos;
private _wp=_group addWaypoint[_pos,0];
private _wpType="CIRCLE";
if((random 10)>5)then{_wpType="CIRCLE_L"};
{
_x setWaypointType"LOITER";
_x setWaypointLoiterRadius _radius;
_x setWaypointLoiterType _wpType;
}forEach(wayPoints _group);
TRUE