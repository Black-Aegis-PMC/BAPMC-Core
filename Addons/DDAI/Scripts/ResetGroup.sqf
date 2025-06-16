private _group=_this;
private _vehicle=FALSE;
private _units=units _group;
{
_x forceSpeed -1;
if!((vehicle _x)==_x)then{_vehicle=TRUE;(vehicle _x);_x forceSpeed -1}
}forEach _units;
if(_vehicle)exitWith{TRUE};
[_group]call lambs_wp_fnc_taskReset;
TRUE