private _drone=_this select 0;
private _man=_this select 1;

if(ddtDebug)then{systemChat format["%1 starting UGV",_drone]};

private _droneCycle=60;
private _radius=200;
_drone setAutonomous TRUE;
private _pos=getPos _man;
{deleteWaypoint _x}forEach(wayPoints(group _drone));
(group _drone)addWaypoint[_pos,0];
_drone setSpeedMode"FULL";
{_x setWaypointType"SAD"}forEach(wayPoints(group _drone));

while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if((fuel _drone)<.1)exitWith{};
	if((_drone distance2D _man)>_radius)then{
		_pos=getPos _man;
		{deleteWaypoint _x}forEach(wayPoints(group _drone));
		(group _drone)addWaypoint[_pos,0];
		_drone setSpeedMode"FULL";
		{_x setWaypointType"SAD"}forEach(wayPoints(group _drone));
	};
	sleep _droneCycle;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
if((fuel _drone)==0)exitWith{};
// RTB
{deleteWaypoint _x}forEach(wayPoints(group _drone));
_drone move(getPos _man);

while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if((fuel _drone)==0)exitWith{};
	_pos=getPos _man;
	_drone move _pos;
	if((_drone distance2D _pos)<20)exitWith{};
	sleep 30;
};	
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
if((fuel _drone)==0)exitWith{};
private _magType=_drone getVariable["ddtMagType",""];
private _packType=_drone getVariable["ddtPackType",""];
private _itemType=_drone getVariable["ddtItemType",""];
if!(_magType=="")then{_man addItem _magType};
if!(_packType=="")then{_man addBackpackGlobal _packType};
if!(_itemType=="")then{_man addItem _itemType};
deleteVehicle _drone;