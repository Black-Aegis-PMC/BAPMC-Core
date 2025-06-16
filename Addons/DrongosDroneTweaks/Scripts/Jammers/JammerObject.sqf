// DDT_fnc_JamMan
private _input=_this;
private _c=0;
private _object=_input select _c;_c=_c+1;
private _side=_input select _c;_c=_c+1;
private _range=_input select _c;_c=_c+1;
private _chance=_input select _c;_c=_c+1;
private _interval=_input select _c;_c=_c+1;
private _resilience=_input select _c;_c=_c+1;

private _drones=[];
private _UAV=objNull;
while{TRUE}do{
	if!(alive _object)exitWith{};
	if((getDammage _object)>_resilience)exitWith{};
	_drones=_object nearEntities[["AIR"],_range];
	_drones=_drones-[_object];
	{
	_UAV=_x ;
	if(unitIsUAV _UAV)then{
		if!(alive _UAV)exitWith{};
		if([_side,(side _UAV)]call BIS_fnc_SideIsFriendly)exitWith{};
		if((random 100)>_chance)exitWith{};
		_UAV call DDT_fnc_JamDrone;
	};
	}forEach _drones;
	sleep _interval;	
};