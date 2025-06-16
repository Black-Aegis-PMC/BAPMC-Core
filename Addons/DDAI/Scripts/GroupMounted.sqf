private _group=_this;
private _vehicles=[];
private _mounted=TRUE;
private _dismounts=count(_group call DDAI_fnc_GetDismounts);
if(_dismounts<1)exitWith{TRUE};
// Get vehicles in group
{if!((vehicle _x)==_x)then{_vehicles pushBackUnique(vehicle _x)}}forEach(units _group);
if((count _vehicles)<1)exitWith{TRUE};
// If no more cargo slots are available, group is considered "as mounted as can be"
{if((_x call DDAI_fnc_CountEmptySeats)>0)exitWith{_mounted=FALSE}}forEach _vehicles;
_mounted