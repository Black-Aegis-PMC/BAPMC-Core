private _projectile=_this select 0;
private _shooter=_this select 1;
private _speed=15;if((count _this)>2)then{_speed=_this select 2};
//private _targetPos=getPosASLVisual _target;
private _targetPos=_shooter getVariable["ddtTargetPos",[]];
if((count _targetPos)<3)then{
	_targetPos=getPosASL _shooter;
	_targetPos=[_targetPos select 0,_targetPos select 1,((_targetPos select 2)-10)];
};
private _minDistanceToTarget=2;
if((count _targetPos)<3)exitWith{};
while{!isNull _projectile}do{
	if(isNull _projectile)exitWith{};
	private _currentPos=getPosASLVisual _projectile;
	private _forwardVector=vectorNormalized(_targetPos vectorDiff _currentPos);
	private _rightVector=(_forwardVector vectorCrossProduct[0,0,1])vectorMultiply -1;
	private _upVector=_forwardVector vectorCrossProduct _rightVector;
	private _targetVelocity=_forwardVector vectorMultiply _speed;
	_projectile setVectorDirAndUp[_forwardVector,_upVector];
	_projectile setVelocity _targetVelocity;
	if(isNull _projectile || {getPosASLVisual _projectile distance _targetPos <= _minDistanceToTarget})exitWith{};
	sleep 0.01;
};
if(isNull _projectile)exitWith{};
//_projectile setVelocity _targetVelocity;