private _side=WEST;
private _groups=[];
private _group=grpNull;
private _cooldown=120; // Min seconds between launches per group
private _targets=[];
private _coolDown=1;
private _rangeFPV=3000;
private _rangeBomber=2000;
private _cycle=missionNamespace getVariable["ddtCycleAttack",30];
//_cycle=2;

// FPVs
while{TRUE}do{
	if(_cycle<0)exitWith{};
	_rangeFPV=missionNamespace getVariable["ddtAttackRangeFPV",3000];
	_rangeBomber=missionNamespace getVariable["ddtAttackRangeBomber",3000];
	{
	_side=_x;
	_groups=[];
	_coolDown=missionNamespace getVariable["ddtCooldownValue",120];
		{
		_group=_x;
		if((side _group)==_side)then{
			if(_group getVariable["ddtExclude",FALSE])exitWith{};
			if(leader _group==player)exitWith{};
			if(serverTime<(_group getVariable["ddtCooldown",-1]))exitWith{};
			_groups pushBackUnique _group;
		};
		}forEach allGroups;
		{
		_group=_x;
		private _busy=FALSE;
		// AT check first
		if!(_group call DDT_fnc_FriendlyFPVATNear)then{
			if!(_group call DDT_fnc_GroupHasFPVAT)exitWith{};
			_targets=[_x,_rangeFPV]call DDT_fnc_GetTargetsAT;
			if((count _targets)<1)exitWith{};
			_group setVariable["ddtCooldown",(serverTime+_coolDown),TRUE];
			[_group,"FPVAT"]call DDT_fnc_GroupDeployUAV;
			_busy=TRUE;
			sleep 5; // Time to allow UAV to spawn
		};
		// AP check
		if!(_busy)then{
			if!(_group call DDT_fnc_FriendlyFPVNear)then{
				if!(_group call DDT_fnc_GroupHasFPV)exitWith{};
				_targets=[_x,_rangeFPV]call DDT_fnc_GetSoftTargets;
				if((count _targets)<1)exitWith{};
				_group setVariable["ddtCooldown",(serverTime+_coolDown),TRUE];
				[_group,"FPV"]call DDT_fnc_GroupDeployUAV;
				_busy=TRUE;
				sleep 5; // Time to allow UAV to spawn
			};
		};
		// Bomber check
		if!(_busy)then{
			if!(_group call DDT_fnc_FriendlyBomberNear)then{
				if!(_group call DDT_fnc_GroupHasBomber)exitWith{};
				_targets=[_x,_rangeBomber]call DDT_fnc_GetSoftTargets;
				if((count _targets)<1)exitWith{};
				_group setVariable["ddtCooldown",(serverTime+_coolDown),TRUE];
				[_group,"BOMBER"]call DDT_fnc_GroupDeployUAV;
				sleep 5; // Time to allow UAV to spawn
			};
		};
		}forEach _groups;
		sleep 1;
	}forEach ddtDeploySides;
	_cycle=missionNamespace getVariable["ddtCycleAttack",30];
	sleep _cycle;
};