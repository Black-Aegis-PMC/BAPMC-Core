private _group=_this select 0;
sleep 3; // Give time for camonets etc to spawn
while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
private _wp=_group addWaypoint[_group call DDAI_fnc_WPpos,0];
{_x setWaypointType"GUARD"}forEach(waypoints _group);