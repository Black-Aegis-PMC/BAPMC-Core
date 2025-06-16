if!(isServer)exitWith{};
private _info=_this;

waitUntil{!isNil("DDAI_fnc_ParseArray")};
waitUntil{!isNil("ddaiDebug")};
if(ddaiDebug)then{systemChat"DDAI reserve group started"};

private _c=0;
private _group=_info select _c;_c=_c+1;
private _pos=_info select _c;_c=_c+1;
private _reactionDelay=(_info select _c)call DDAI_fnc_ParseArray;_c=_c+1;
private _reactChance=_info select _c;_c=_c+1;
private _deleteChance=_info select _c;_c=_c+1;

if(ddaiDebug)then{systemChat format["DDAI reserve group: %1",_group]};

if((random 100)<_deleteChance)exitWith{
	if(ddaiDebug)then{systemChat format["DDAI reserve group DELETED: %1",_group]};
	{deleteVehicle(vehicle _x)}forEach(units _group);
	sleep .1;
	{deleteVehicle _x}forEach(units _group);
};

if((random 100)>_reactChance)exitWith{
	if(ddaiDebug)then{systemChat format["DDAI reserve group NOT RESERVE: %1",_group]};
};

//if(ddaiDebug)then{systemChat format["DDAI reserve group WAITING: %1",_group]};

_group setVariable["ddaiReserveCalled",FALSE,TRUE];
while{TRUE}do{
	if(ddaiDebug)then{systemChat format["DDAI reserve group WAITING: %1",_group]};
	if!(_group call DDAI_fnc_GroupIsAlive)exitWith{};
	if(_group getVariable"ddaiReserveCalled")exitWith{};
	sleep 5;
};
if!(_group call DDAI_fnc_GroupIsAlive)exitWith{
	if(ddaiDebug)then{systemChat format["DDAI reserve group EXIT (dead): %1",_group]};
};

if(ddaiDebug)then{systemChat format["DDAI reserve group REACT: %1 (delay %2)",_group,_reactionDelay]};

sleep(_reactionDelay call BIS_fnc_randomInt);

if(ddaiDebug)then{systemChat format["DDAI reserve group ON THE WAY: %1",_group]};

_group call DDAI_fnc_ResetGroup;
sleep 1;
_group setCombatMode"YELLOW";
_group setBehaviour"SAFE";

if(ddaiDebug)then{systemChat format["DDAI reserve group DELETING WP: %1",_group]};

while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
if(ddaiDebug)then{systemChat format["DDAI reserve group ADDING WP: %1",_group]};
private _wp=_group addWaypoint[_pos,0];
sleep 1;
_wp=_group addWaypoint[_pos,0];
_wp setWaypointType"GUARD";