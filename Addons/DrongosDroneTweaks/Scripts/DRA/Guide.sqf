private _warhead=_this select 0;
private _target=_this select 1;
private _speed=_this select 2;
private _drone=_this select 3;
if!(local _warhead)exitWith{};
private _minDistanceToTarget=1;
while{!isNull _warhead && {!isNull _target}}do{
	if((count(crew _drone))<1)exitWith{};
	private _currentPos=getPosASLVisual _warhead;
	private _targetPos=getPosASLVisual _target;
	private _forwardVector=vectorNormalized(_targetPos vectorDiff _currentPos);
	private _rightVector=(_forwardVector vectorCrossProduct[0,0,1])vectorMultiply -1;
	private _upVector=_forwardVector vectorCrossProduct _rightVector;
	private _targetVelocity=_forwardVector vectorMultiply _speed;
	_warhead setVectorDirAndUp[_forwardVector,_upVector];
	_warhead setVelocity _targetVelocity;
	if(isNull _warhead || {isNull _target} || {getPosASLVisual _warhead distance _targetPos <= _minDistanceToTarget})exitWith{};
	sleep 0.01;
};
if(isNull _target)exitWith{};
if((typeOf _target)=="logic")then{deleteVehicle _target};
while{TRUE}do{
	if(isNull _warhead)exitWith{};
	sleep .1;
};
if(isNull _drone)exitWith{};
_drone setDammage 1;