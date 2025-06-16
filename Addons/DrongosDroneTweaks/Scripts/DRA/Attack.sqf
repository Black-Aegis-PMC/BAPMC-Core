private _drone=_this select 0;
private _target=_this select 1;
if!(local _drone)exitWith{};
private _side=side _drone;
private _name=getText(configFile>>"CfgVehicles">>(typeOf _drone)>>"displayName");
if(_target isKindOf"LaserTarget")then{
	_target=(createGroup CIVILIAN)createUnit["logic",(getPosATL _target),[],0,"CAN_COLLIDE"];
};
private _pos=getPosATL _drone;
private _dir=getDir _drone;
_drone setCombatMode"BLUE";
_drone setBehaviour"SAFE";
private _group=group _drone;
while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
sleep .5;
_drone doWatch _target;
_drone doMove(getPosATL _target);
_group move(getPos _target);
_drone setVariable["draDroneStatus","ATK",TRUE];
//if(draDebug)then{systemChat format["%1 moving to attack",_name]};
while{TRUE}do{
	if!(alive _drone)exitWith{};
	if([_drone,(getPos _target),15]call DDT_fnc_DRAaimedAtTarget2)exitWith{};
	sleep .1;
};
if!(alive _drone)exitWith{};
if!((_drone getVariable"draDroneStatus")=="ATK")exitWith{};
_drone setVariable["draDroneStatus","TERMINAL",TRUE];
private _speed=20;
if(((getPosATL _drone)select 2)>100)then{_speed=40};
if(_drone isKindOf"B_UAV_RC40_HE_RF")then{_speed=20};
if(_drone isKindOf"O_UAV_RC40_HE_RF")then{_speed=20};
if(_drone isKindOf"I_UAV_RC40_HE_RF")then{_speed=20};
private _warheadType="DRA_DummyWarhead";
if(_drone isKindOf"DRA_MiniHarpy_LM_B")then{
	_speed=150; //110
	//_warheadType="DRA_MiniHarpy_Warhead";
};
if(_drone isKindOf"DRA_Ababil_3X")then{
	_speed=170; // 130
	//_warheadType="DRA_Ababil_Warhead";
};

private _dir=getDir _drone;
private _pos=getPosATL _drone;
_warheadType="DRA_DummyWarhead";
private _warhead=_warheadType createVehicle _pos;_warhead setDir _dir;
sleep .1;
if(_drone isKindOf"DRA_MiniHarpy_LM_B")then{_drone attachTo[_warhead,[0,-1.25,0]]}else{_drone attachTo[_warhead]};
sleep .1;
[_warhead,_target,_speed,_drone]remoteExec["DDT_fnc_DRAGuideDrone"];
//if(draDebug)then{systemChat format["%1 attacking",_name]};
private _disconnect=TRUE;
while{TRUE}do{
	if!(alive _drone)exitWith{};
	if((getConnectedUAV player)==_drone)then{_disconnect=TRUE}else{_disconnect=FALSE};
	sleep .2;
};
if(_disconnect)then{	
	player connectTerminalToUAV objNull;
	hintSilent"";
	selectPlayer player;
	player switchCamera"INTERNAL";
};
//if(draDebug)then{systemChat format["%1 impact",_name]};