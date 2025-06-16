private _group=_this;
private _pos=getPos(leader _group);
private _side=side(leader _group);
private _near=FALSE;
private _radius=missionNamespace getVariable["ddtExclusionRadiusRecon",1500];
{
if((side _x)==_side)then{
	if(_x getVariable["ddtExclude",FALSE])exitWith{};
	if(_x call DDT_fnc_DroneisRecon)then{
		if((_pos distance2D _x)<_radius)then{_near=TRUE};
	};
};
if(_near)exitWith{};
}forEach allUnitsUAV;
_near