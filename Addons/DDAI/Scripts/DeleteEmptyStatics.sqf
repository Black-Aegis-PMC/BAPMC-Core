private _pos=_this select 0;
private _radius=_this select 1;
sleep 30;
private _v=objNull;
{
_v=_x;
if((count(crew _x))==0)then{
	if((_v distance _pos)<_radius)then{deleteVehicle _v};
};
}forEach(vehicles);