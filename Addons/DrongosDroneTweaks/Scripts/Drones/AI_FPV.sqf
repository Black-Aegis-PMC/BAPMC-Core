private _drone=_this select 0;
private _man=_this select 1;

if(ddtDebug)then{systemChat format["%1 starting FPV",_drone]};

private _droneCycle=5;
private _alt=10+(random 5);
private _takeOff=TRUE;
private _guideDistance=150;
if(_drone isKindOf"B_SwitchBlade_300")then{
	_alt=50;
	_takeOff=FALSE;
	_guideDistance=200;
	_droneCycle=1;
};
if(_drone isKindOf"B_SwitchBlade_600")then{
	_alt=50;
	_takeOff=FALSE;
	_guideDistance=200;
	_droneCycle=1;
};

private _targetRange=1000;
_drone setAutonomous TRUE;
_drone flyInHeight _alt;
_drone setVariable["ddtAlt",_alt,TRUE];
//_drone flyInHeightASL[_alt,_alt,_alt];
private _pos=getPos _drone;

private _distance=-1;
private _lastDistance=-1;

if(_takeOff)then{[_drone]spawn DDT_fnc_TakeOff};
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if(((getPosATL _drone)select 2)>1)exitWith{};
	sleep 2;
};
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};

while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if(unitReady _drone)exitWith{};
	sleep 1;
};
sleep 5;
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};

_drone setCaptive FALSE;
_drone flyInHeight _alt;
//_drone flyInHeightASL[_alt,_alt,_alt];
private _targets=[];
private _target=objNull;
private _exit=FALSE;
private _c=6;
private _attackRange=3000;
private _type=toUpper(typeOf _drone);
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	if!(alive _target)then{
		_attackRange=missionNamespace getVariable["ddtAttackRangeFPV",3000];
		if([[_type],ddtClassesFPVAT]call DDT_fnc_InArray)then{
			_targets=[_man,_attackRange]call DDT_fnc_GetTargetsAT;
			// In case AR2Xs can also target men
			if((count _targets)<1)then{
				if([[_type],ddtClassesFPV]call DDT_fnc_InArray)then{
					_targets=[_man,_attackRange]call DDT_fnc_GetSoftTargets;
				};
			};
		}else{
			_targets=[_man,_attackRange]call DDT_fnc_GetSoftTargets;
		};
		if((count _targets)<1)exitWith{};
		//_target=selectRandom _targets;
		_target=_targets select 0;
		_pos=getPos _target;
		_distance=_drone distance2D _target;
		_lastDistance=_distance;
		//[_drone,_pos]call DDT_fnc_Move;
		_c=6;
	};
	_exit=FALSE;
	if(alive _target)then{
		if((speed _drone)<1)then{
			if(ddtDebug)then{"DRONE IS NOT MOVING"call DDT_fnc_Debug};
			_pos=getPos _target;
			[_drone,_pos]call DDT_fnc_Move;
		};
		_c=_c-1;
		_distance=_drone distance2D _target;
		// Try to stop the thing moving away
		if(_distance>_lastDistance)then{
			//_drone doMove _pos;
			[_drone,_pos]call DDT_fnc_Move;
			_lastDistance=_distance;
			_c=6;
			if(ddtDebug)then{"DRONE IS MOVING AWAY"call DDT_fnc_Debug};
		}else{
			if(ddtDebug)then{"DRONE IS CLOSING"call DDT_fnc_Debug};
		};
		if(ddtDebug)then{
			private _t=format["%1 FPV distance: %2",_drone,round _distance];
			_t call DDT_fnc_Debug;
		};
		if(_distance<_guideDistance)exitWith{
			_exit=TRUE;
			if([[(typeOf _drone)],["DRA_UAV_01_B","DRA_UAV_01_O","DRA_UAV_01_I"]]call DDT_fnc_InArray)then{
				[_drone,_target]spawn DDT_fnc_DRAattack;
			}else{
				[_drone,_target]spawn DDT_fnc_GuideToTarget;
			};
		};
		if(_exit)exitWith{};
		if(_c<1)then{
			if(((getPos _target)distance2D _pos)<20)exitWith{_c=6};
			_pos=getPos _target;
			[_drone,_pos]call DDT_fnc_Move;
			_c=6;
		};
	};
	if(_exit)exitWith{};
	sleep _droneCycle;
};