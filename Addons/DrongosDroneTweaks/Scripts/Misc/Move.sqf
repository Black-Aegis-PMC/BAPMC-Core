// Note on move commands. Spamming them every 25 seconds or so seems to make drones do dumb stuff like move away, loop around, etc
private _drone=_this select 0;
private _pos=_this select 1;
{deleteWaypoint _x}forEach(wayPoints(group _drone));
//(group _drone)move _pos;
(group _drone)addWaypoint[_pos,0];
_drone doMove _pos;
_drone setSpeedMode"FULL";
{_x setWaypointType"MOVE"}forEach(wayPoints(group _drone));
if(ddtDebug)then{systemChat format["%1 moving to %2",_drone,_pos]};
_pos