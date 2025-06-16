private _side=WEST;
private _groups=[];
private _group=grpNull;
private _cycle=missionNamespace getVariable["ddtCycleRecon",30];
// Recon drones
while{TRUE}do{
	if(_cycle<0)exitWith{};
	{
	_side=_x;
	_groups=[];
		{
		_group=_x;
		if((side _group)==_side)then{
			if(_group getVariable["ddtExclude",FALSE])exitWith{};
			if(leader _group==player)exitWith{};
			if!([[(behaviour(leader _group))],ddtDeployBehaviour]call DDT_fnc_InArray)exitWith{};
			_groups pushBackUnique _group;
		};
		}forEach allGroups;
		{
		_group=_x;
		if!(_group call DDT_fnc_FriendlyReconNear)then{
			if!(_group call DDT_fnc_GroupHasRecon)exitWith{};
			[_group,"RECON"]call DDT_fnc_GroupDeployUAV;
			sleep 5; // Time to allow UAV to spawn
		};
		if(_group call DDT_fnc_GroupHasUGV)then{
			[_group,"UGV"]call DDT_fnc_GroupDeployUAV;
			sleep 5; // Time to allow UGV to spawn
		};
		}forEach _groups;
	sleep 1;
	}forEach ddtDeploySides;
	_cycle=missionNamespace getVariable["ddtCycleRecon",30];
	sleep _cycle;
};