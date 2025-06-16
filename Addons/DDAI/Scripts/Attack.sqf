private _group=_this select 0;
private _targetPos=_this select 1;

private _debug=ddaiDebug;

if(_debug)then{systemChat format["ATTACK: %1",_group]};

private _wp=[];
private _sleep=10;
private _dismountDistance=300;
private _detach=FALSE; // Detach infantry groups from transport
private _abandon=FALSE; // Infantry groups abandon transports
private _dismounts=_group call DDAI_fnc_GetDismounts;
private _groupDismounts=grpNull;

//_group call DDAI_fnc_ResetGroup;
{_x forceSpeed -1}forEach(units _group);

if(_debug)then{systemChat format["ATTACK DELETE WP: %1",_group]};
while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
if(_debug)then{systemChat format["ATTACK WP DELETED: %1",_group]};

_group setBehaviour"AWARE";
_group setCombatMode"RED";
_group setFormation"LINE";
_group setSpeedmode"FULL";
_wp=_group addWaypoint[_targetPos,0];
{_x setWaypointType"MOVE"}forEach(waypoints _group);

/*
Fuck all this shit tbqh

if((count(_group call DDAI_fnc_GroupVehicles))<1)exitWith{
	sleep 1;
	_group setBehaviour"AWARE";
	_group setCombatMode"RED";
	_group setFormation"LINE";
	_group setSpeedmode"FULL";
	_wp=_group addWaypoint[_targetPos,0];
	{_x setWaypointType"MOVE"}forEach(waypoints _group);
};


// Mount
if((count(_group call DDAI_fnc_GroupVehicles))>0)then{
	if(_debug)then{systemChat format["ATTACK mount: %1",_group]};
	_wp=_group addWaypoint[(_group call DDAI_fnc_WPpos),0];
	{_x setWaypointType"GETIN"}forEach(waypoints _group);
	//if((count _dismounts)>0)then{sleep 15};
	while{TRUE}do{
		if!(_group call DDAI_fnc_GroupIsAlive)exitWith{};
		//if!((_group getVariable"dmpAIcurrent")=="ATTACK")exitWith{};
		if(_group call DDAI_fnc_GroupMounted)exitWith{};
		if(_debug)then{systemChat format["%1: mounting",_group]};
		sleep 1;
	};
	if(_debug)then{systemChat format["ATTACK mounted: %1",_group]};
};

if!(_group call DDAI_fnc_GroupIsAlive)exitWith{};
while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};

// On the way
_wp=_group addWaypoint[_targetPos,0];
if(_debug)then{systemChat format["ATTACK moving: %1",_group]};
while{TRUE}do{
	if!(_group call DDAI_fnc_GroupIsAlive)exitWith{};
	if(((leader _group)distance2D _targetPos)<_dismountDistance)exitWith{};
	if(((leader _group)distance2D _targetPos)<1000)then{_sleep=3};
	sleep _sleep;
};

// Deploy
if(_debug)then{systemChat format["ATTACK near position: %1",_group]};
while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
_group setBehaviour"AWARE";
_group setCombatMode"RED";
_group setFormation"LINE";
_group setSpeedmode"NORMAL";
_wp=_group addWaypoint[_group call DDAI_fnc_WPpos,0];
if((count(_group call DDAI_fnc_GroupVehicles))<1)then{_detach=FALSE;_abandon=FALSE}else{
if(_abandon)then{
	{_x setWaypointType"GETOUT"}forEach(waypoints _group);
	if(_debug)then{systemChat format["ATTACK dismounts abandoning transports: %1",_group]};
}else{
	{_x setWaypointType"UNLOAD"}forEach(waypoints _group);
	if(_debug)then{systemChat format["ATTACK dismounts unloading: %1",_group]};
};

// Wait for dismount
while{TRUE}do{
	if!(_group call DDAI_fnc_GroupIsAlive)exitWith{};
	if!(_group call DDAI_fnc_GroupMounted)exitWith{};
	sleep 1;
};
if!(_group call DDAI_fnc_GroupIsAlive)exitWith{};
if(_debug)then{systemChat format["ATTACK dismounted: %1",_group]};
if((count(_group call DDAI_fnc_GroupVehicles))>0)then{
	if(_detach)then{
		if(_debug)then{systemChat format["ATTACK dismounts moving to target A: %1",_group]};
		_dismounts=_group call DDAI_fnc_GetDismounts;
		if((count _dismounts)<1)exitWith{};
		_groupDismounts=createGroup[(side _group),TRUE];
		_dismounts joinSilent _groupDismounts;
		while{((count(waypoints _groupDismounts))>0)}do{{deleteWaypoint _x}forEach(waypoints _groupDismounts)};
		_groupDismounts setBehaviour"AWARE";
		_groupDismounts setCombatMode"RED";
		_groupDismounts setFormation"LINE";
		_groupDismounts setSpeedmode"FULL";
		_wp=_groupDismounts addWaypoint[_targetPos,0];
		{_x setWaypointType"GUARD"}forEach(waypoints _groupDismounts);
	}else{
		if(_debug)then{systemChat format["ATTACK dismounts moving to target B: %1",_group]};
		_group setBehaviour"AWARE";
		_group setCombatMode"RED";
		_group setFormation"LINE";
		_group setSpeedmode"LIMITED";
		if(_abandon)then{_group setSpeedmode"FULL"};
		_wp=_group addWaypoint[_targetPos,0];
		{_x setWaypointType _wpType}forEach(waypoints _group);
	};
}else{
	if(_debug)then{systemChat format["ATTACK dismounts moving to target C: %1",_group]};
	_group setBehaviour"AWARE";
	_group setCombatMode"RED";
	_group setFormation"LINE";
	_group setSpeedmode"FULL";
	_wp=_group addWaypoint[_targetPos,0];
	{_x setWaypointType _wpType}forEach(waypoints _group);
};
if(_debug)then{systemChat format["ATTACK dismounted: %1",_group]};