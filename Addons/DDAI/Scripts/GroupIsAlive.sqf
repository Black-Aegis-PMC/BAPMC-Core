private _group=_this;
private _alive=FALSE;
{if(alive _x)exitWith{_alive=TRUE}}forEach units _group;
_alive