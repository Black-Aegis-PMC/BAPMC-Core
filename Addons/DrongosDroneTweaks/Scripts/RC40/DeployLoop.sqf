private _side=WEST;
private _groups=[];
private _group=grpNull;
private _man=objNull;
private _targets=[];
private _target=objNull;
private _cycle=missionNamespace getVariable["ddtCycleRC40",30];
//_cycle=2;

while{TRUE}do{
	if(_cycle<0)exitWith{};
	{
	_side=_x;
	_groups=[];
		{
		_group=_x;
		if((side _group)==_side)then{
			if(_group getVariable["ddtExclude",FALSE])exitWith{};
			if!([[(behaviour(leader _group))],["AWARE","COMBAT"]]call DDT_fnc_InArray)exitWith{};
			//if!([[(behaviour(leader _group))],ddtDeployBehaviour]call DDT_fnc_InArray)exitWith{};
			_groups pushBackUnique _group;
		};
		}forEach allGroups;
		{
		_group=_x;
		if(_group call DDT_fnc_GroupHasRC40HE)then{
			if(serverTime<(_group getVariable["ddtCooldownRC40",-1]))exitWith{};
			_targets=[_group,1500]call DDT_fnc_GetSoftTargets;
			if((count _targets)<1)exitWith{};
			//_target=_targets select 0;
			_target=selectRandom _targets;
			{
			_man=_x;
			if(_man call DDT_fnc_ManHasRC40HE)exitWith{
				[_man,_target]spawn DDT_fnc_FireRC40;
				_group setVariable["ddtCooldownRC40",(serverTime+20),TRUE];
				//_group setVariable["ddtCooldownRC40",(serverTime+0),TRUE];
				sleep 10;
			};
			}forEach(units _group);
		};
		}forEach _groups;
	sleep 1;
	}forEach ddtDeploySides;
	_cycle=missionNamespace getVariable["ddtCycleRC40",30];
	sleep _cycle;
};