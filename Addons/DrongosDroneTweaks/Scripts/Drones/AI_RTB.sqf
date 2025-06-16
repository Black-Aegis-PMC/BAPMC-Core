private _drone=_this select 0;
private _man=_this select 1;

if(ddtDebug)then{systemChat format["%1 starting RTB",_drone]};

private _droneCycle=15;
private _alt=200;
private _targetRange=1000;
private _attackRange=2000;
_drone setCombatMode"BLUE";
_drone setBehaviour"CARELESS";
_drone setAutonomous TRUE;
_drone flyInHeight _alt;
//_drone flyInHeightASL[_alt,_alt,_alt];
private _pos=getPos _man;
[_drone,_pos]call DDT_fnc_Move;
_drone setVariable["ddtHasAmmo",FALSE,TRUE];
private _operatorPos=[]+_pos;
private _land=FALSE;
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	_targets=_drone targets[TRUE,_targetRange];
	{_man reveal[_x,(_drone knowsAbout _x)]}forEach _targets;
	_operatorPos=getPos _man;
	if((_pos distance2D _operatorPos)>10)then{
		_pos=[]+_operatorPos;
		[_drone,_pos]call DDT_fnc_Move;
	};
	if((_drone distance2D _operatorPos)<50)exitWith{_land=TRUE};
	sleep _droneCycle;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
// Land
_pos=getPos _man;
[_drone,_pos]call DDT_fnc_Move;
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if(unitReady _drone)exitWith{};
	sleep 1;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
private _pad="Land_HelipadEmpty_F"createVehicle(getPos _man);
_drone land"LAND";
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if(isTouchingGround _drone)exitWith{};
	sleep 1;
};
deleteVehicle _pad;
if(isNull _man)exitWith{};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
private _magType=_drone getVariable["ddtMagType",""];
private _packType=_drone getVariable["ddtPackType",""];
private _itemType=_drone getVariable["ddtItemType",""];
if!(_magType=="")then{_man addItem _magType};
if!(_packType=="")then{_man addBackpackGlobal _packType};
if!(_itemType=="")then{_man addItem _itemType};
deleteVehicle _drone;

/*
private _man=objNull;
{
if((backPack _x)=="")then{
	if(isPlayer _x)exitWith{};
	_man=_x;
};
}forEach(units _group);
if(isNull _man)exitWith{};
private _magType=_drone getVariable["ddtMagType",""];
private _packType=_drone getVariable["ddtPackType",""];
if!(_magType=="")then{_man addItem _magType};
if!(_packType=="")then{_man addBackpackGlobal _packType};
deleteVehicle _drone;