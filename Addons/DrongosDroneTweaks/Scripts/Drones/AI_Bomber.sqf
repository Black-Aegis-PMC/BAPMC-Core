private _drone=_this select 0;
private _man=_this select 1;

if(ddtDebug)then{systemChat format["%1 starting BOMBER",_drone]};

private _droneCycle=5;
private _alt=100+(random 50);
private _targetRange=1000;
private _attackRange=2000;
_drone setAutonomous TRUE;
_drone flyInHeight _alt;
//_drone flyInHeightASL[_alt,_alt,_alt];
private _pos=getPos _drone;

[_drone]spawn DDT_fnc_TakeOff;
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if(((getPosATL _drone)select 2)>1)exitWith{};
	sleep 3;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};

_drone setCaptive FALSE;
_drone flyInHeight _alt;
private _targets=[];
private _target=objNull;
private _alive=FALSE;
private _exit=FALSE;
private _c=5;
_drone setVariable["ddtHasAmmo",TRUE,TRUE];

private _proxy=objNull;
private _mavics=["mavik_3_BLU","mavik_3_OPF","mavik_3_IND","mavic_3_BLU","mavic_3_OPF","mavic_3_IND"];
if([[(typeOf _drone)],_mavics]call DDT_fnc_InArray)then{
	_proxy=createVehicle["Land_Tableware_01_cup_F",(getPosATL _drone),[],0,"FLY"];
	_proxy attachTo[_drone,[0,-.1,-.1]];
};
if([[(typeOf _drone)],["DRA_UAV_01G_B","DRA_UAV_01G_O","DRA_UAV_01G_I"]]call DDT_fnc_InArray)then{
	_proxy=createVehicle["DRA_40mm_dummy",[0,0,100],[],0,"FLY"];
	_proxy attachTo[_drone,[0,-.1,-.1]];
	_proxy setVectorUp[0,0.99,-0.01];
};

while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if(!(alive _target)OR(isNull _target))then{
		_attackRange=missionNamespace getVariable["ddtAttackRangeBomber",2000];
		_targets=[_man,_attackRange]call DDT_fnc_GetSoftTargets;
		if((count _targets)<1)exitWith{};
		//_target=selectRandom _targets;
		_target=_targets select 0;
		_pos=getPos _target;
		_drone flyInHeight _alt;
		[_drone,_pos]call DDT_fnc_Move;
		_c=5;
	};
	_exit=FALSE;
	if(alive _target)then{
		//if((speed _drone)<1)then{(group _drone)move(getPos _target);_c=5};
		if((speed _drone)<1)then{[_drone,(getPos _target)]call DDT_fnc_Move;_c=5};
		_distance=_drone distance2D _target;
		if(ddtDebug)then{systemChat format["%1 BOMBER distance: %2",_drone,round _distance]};
		if(_distance<100)exitWith{
			if(_drone getVariable["ddtBusy",FALSE])exitWith{};
			_drone setVariable["ddtBusy",TRUE,TRUE];
			if(ddtDebug)then{systemChat format["%1 BOMBER moving to bomb",_drone]};
			[_drone,_target]spawn DDT_fnc_GuideToTargetBomber;
		};
		if(_c<1)then{
			if!(alive _drone)exitWith{};
			if(((getPos _target)distance2D _pos)<20)exitWith{_c=5};
			_pos=getPos _target;
			[_drone,_pos]call DDT_fnc_Move;
			_c=5;
		};
	}else{
		_drone setSpeedMode"FULL";
		_drone forceSpeed -1;
	};
	_c=_c-1;
	if(_exit)exitWith{};
	if!(_drone getVariable["ddtHasAmmo",FALSE])exitWith{};
	sleep _droneCycle;
};
if!(alive _drone)exitWith{
	if(isNull _proxy)exitWith{};
	deleteVehicle _proxy;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
_drone setCombatMode"BLUE";
_drone setBehaviour"AWARE";
_drone setSpeedMode"FULL";
_drone forceSpeed -1;
[_drone,_man]spawn DDT_fnc_RTB