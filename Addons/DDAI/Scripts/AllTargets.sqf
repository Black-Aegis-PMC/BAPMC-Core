private _groups=_this select 0;
private _distance=_this select 1;
private _targets=[];
private _allTargets=[];
{
private _leader=leader _x;
_targets=_leader targets[TRUE,_distance];
{if(_x isKindOf"AIR")then{_targets=_targets-[_x]}}forEach _targets;
_allTargets=_allTargets+_targets;
}forEach _allGroups;
_allTargets