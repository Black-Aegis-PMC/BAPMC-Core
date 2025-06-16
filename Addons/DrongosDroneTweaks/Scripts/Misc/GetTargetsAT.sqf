private _man=_this select 0;
private _range=_this select 1;
private _targets=_man targets[TRUE,_range];
private _out=[];
private _target=objNull;
{
_target=vehicle _x;
if!(_target isKindOf"MAN")then{
	if(isTouchingGround _target)then{
		_out pushBackUnique _target;
	};
};
}forEach _targets;
_out