private _group=_this;
private _pos=getPos(leader _group);
private _side=side(leader _group);
private _near=FALSE;
private _radius=missionNamespace getVariable["ddtExclusionRadiusBomber",500];
{
if((side _x)==_side)then{
	if(_x getVariable["ddtExclude",FALSE])exitWith{};
	if(_x call DDT_fnc_DroneisBomber)then{
		if(_x getVariable["ddtBusy",FALSE])exitWith{};
		if((_pos distance2D _x)<_radius)then{_near=TRUE};
	};
};
if(_near)exitWith{};
}forEach allUnitsUAV;
_near