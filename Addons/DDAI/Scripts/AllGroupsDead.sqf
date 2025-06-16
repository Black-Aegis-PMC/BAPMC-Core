private _groups=_this;
private _allDead=TRUE;
{if(_x call DDAI_fnc_GroupIsAlive)exitWith{_allDead=FALSE}}forEach _groups;
_allDead