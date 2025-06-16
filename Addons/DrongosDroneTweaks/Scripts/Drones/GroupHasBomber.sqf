private _group=_this;
private _has=FALSE;
{if(_x call DDT_fnc_ManHasBomber)exitWith{_has=TRUE}}forEach(units _group);
_has