// DDT_fnc_JamMan
private _man=_this select 0;
private _range=100;
private _chance=90;
private _interval=3;
private _drones=[];
private _UAV=objNull;
while{TRUE}do{
	if!(alive _man)exitWith{};
	if!((backPack _man)in ddtJammers)exitWith{};
	if!((vehicle _man)==_man)exitWith{};
	_drones=_man nearEntities[["AIR"],_range];
	{
	_UAV=_x ;
	if(unitIsUAV _UAV)then{
		if!(alive _UAV)exitWith{};
		if([(side _man),(side _UAV)]call BIS_fnc_SideIsFriendly)exitWith{};
		if((random 100)>_chance)exitWith{};
		_UAV call DDT_fnc_JamDrone;
	};
	}forEach _drones;
	sleep _interval;	
};
if(isNull _man)exitWith{};
_man setVariable["ddtReg",FALSE,TRUE];