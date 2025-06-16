private _drone=_this select 0;
private _man=_this select 1;
private _targets=[];
_drone setSkill["spotDistance",1];
{_x setSkill["spotDistance",1]}forEach(crew _drone);
while{TRUE}do{
	if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
	_targets=_drone targets[TRUE,1000];
	{_man reveal[_x,(_drone knowsAbout _x)]}forEach _targets;
	sleep 10;
};