private _drone=_this select 0;
private _target=_this select 1;
private _speed=15;
_speed=speed _drone;
if((count _this)>2)then{_speed=_this select 2};
private _minDistanceToTarget=9;
if((count _this)>3)then{_minDistanceToTarget=_this select 3};
if(ddtDebug)then{systemChat format["BOMBER attack speed: %1",_speed]};
if(_speed<5)then{_speed=5};
if(_speed>15)then{_speed=15};
private _z=(getPosASL _drone)select 2;

_drone setCombatMode"BLUE";
_drone setBehaviour"CARELESS";
private _targetVelocity=[];
while{!isNull _drone && {!isNull _target}}do{
	if((count(crew _drone))<1)exitWith{};
	//if(isNull _drone || {isNull _target} || {getPosASLVisual _drone distance _targetPos <= _minDistanceToTarget})exitWith{};
	if(isNull _drone || {isNull _target})exitWith{};
	private _currentPos=getPosASLVisual _drone;
	private _targetPos=getPosASLVisual _target;
	_targetPos set[2,_z];
	//private _currentPos=getPosWorldVisual _drone;
	//private _targetPos=getPosWorldVisual _target;
	if(((getPosASLVisual _drone)distance _targetPos)<=_minDistanceToTarget)exitWith{};
	private _forwardVector=vectorNormalized(_targetPos vectorDiff _currentPos);
	private _rightVector=(_forwardVector vectorCrossProduct[0,0,1])vectorMultiply -1;
	private _upVector=_forwardVector vectorCrossProduct _rightVector;
	_targetVelocity=_forwardVector vectorMultiply _speed;
	_drone setVelocity _targetVelocity;
	sleep .3;
	if(isNull _drone)exitWith{};
	_drone setVectorDirAndUp[_forwardVector,_upVector];
};
if(ddtDebug)then{systemChat format["BOMBER attack OUT: %1",_drone]};
if!(alive _drone)exitWith{};

private _iedClasses=[
"B_G_UAV_02_IED_lxWS",
"B_Tura_UAV_02_IED_lxWS",
"O_G_UAV_02_IED_lxWS",
"O_Tura_UAV_02_IED_lxWS",
"I_G_UAV_02_IED_lxWS",
"I_Tura_UAV_02_IED_lxWS"
];
if([[typeOf _drone],_iedClasses]call DDT_fnc_InArray)exitWith{
	if!(someAmmo _drone)exitWith{_drone setVariable["ddtHasAmmo",FALSE,TRUE]};
	_drone setVariable["ddtTargetPos",(getPosASL _target),TRUE];
	/*private _EH=_drone addEventHandler["Fired",{
		params["_unit","_weapon","_muzzle","_mode","_ammo","_magazine", "_projectile","_gunner"];
		[_projectile,_unit]spawn DDT_fnc_GuideToTarget3;
		TRUE
	}];*/
	_drone setCombatMode"RED";
	_drone fire(currentWeapon _drone);
	_target=objNull;
	sleep 1;
	if!(alive _drone)exitWith{};
	//_drone removeEventhandler["Fired",_EH];
	_drone setCombatMode"BLUE";
	_drone setBehaviour"AWARE";
	_drone setSpeedMode"FULL";
	_drone forceSpeed -1;
	if!(someAmmo _drone)exitWith{_drone setVariable["ddtHasAmmo",FALSE,TRUE]};
	sleep 5;
	if!(alive _drone)exitWith{};
	_drone setVariable["ddtBusy",FALSE,TRUE];
};

if(_drone isKindOf"C_IDAP_UAV_06_antimine_F")exitWith{
	if!(someAmmo _drone)exitWith{_drone setVariable["ddtHasAmmo",FALSE,TRUE]};
	_drone setVariable["ddtTargetPos",(getPosASL _target),TRUE];
	private _EH=_drone addEventHandler["Fired",{
		params["_unit","_weapon","_muzzle","_mode","_ammo","_magazine", "_projectile","_gunner"];
		[_projectile,_unit]spawn DDT_fnc_GuideToTarget3;
		TRUE
	}];
	_drone setCombatMode"RED";
	_drone fire(currentWeapon _drone);
	_target=objNull;
	sleep 1;
	if!(alive _drone)exitWith{};
	_drone removeEventhandler["Fired",_EH];
	_drone setCombatMode"BLUE";
	_drone setBehaviour"AWARE";
	_drone setSpeedMode"FULL";
	_drone forceSpeed -1;
	if!(someAmmo _drone)exitWith{_drone setVariable["ddtHasAmmo",FALSE,TRUE]};
	sleep 5;
	if!(alive _drone)exitWith{};
	_drone setVariable["ddtBusy",FALSE,TRUE];
};

{deleteVehicle _x}forEach(attachedObjects _drone);
private _shellPos=getPosATL _drone;
_z=_shellPos select 2;
_z=_z-.2;
_shellPos set[2,_z];
private _shellType="G_40mm_HE";
private _shell=createVehicle[_shellType,_shellPos,[],0,"FLY"];
_shell setVectorUp[0,0.99,0.01];
//_shell setShotParents[(vehicle leader _group),(leader _group)];
[_shell,_target,10]spawn DDT_fnc_GuideToTarget2;
_drone setVariable["ddtHasAmmo",FALSE,TRUE];
_drone setVariable["ddtBusy",FALSE,TRUE];