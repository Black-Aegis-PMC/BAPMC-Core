private _man=_this select 0;
private _range=_this select 1;
private _targets=_man targets[TRUE,_range];
private _out=[];
private _threshold=missionNamespace getVariable["ddtSoftThreshold",100];
{
private _v=vehicle _x;
if(_v isKindOf"MAN")then{_out pushBackUnique _v}else{
	if(isTouchingGround _v)then{
		if((getNumber(configFile>>"CfgVehicles">>(typeOf _v)>>"armor"))>_threshold)exitWith{};
		_out pushBackUnique _v;
	};
};
}forEach _targets;
_out