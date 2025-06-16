// DDT_fnc_JamDrone
private _UAV=_this;
private _connected=(UAVControl _UAV);
if((count _connected)==2)then{(_connected select 0)connectTerminalToUAV objNull}else{
	(_connected select 0)connectTerminalToUAV objNull;
	(_connected select 2)connectTerminalToUAV objNull;
};
_UAV setFuel 0;
{_x setDammage 1;deleteVehicle _x}forEach(crew _UAV);
TRUE