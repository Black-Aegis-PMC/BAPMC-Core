private _groups=_this select 0;
private _distance=_this select 1;
private _pos=_this select 2;

private _modules=entities"DDAI_Reserves";
{if((_x distance2D _pos)>_distance)then{_modules=_modules-[_x]}}forEach _modules;
if((count _modules)<1)exitWith{};
if(ddaiDebug)then{systemChat format["DDAI reserves started (%1 groups)",(count _groups)]};
sleep 10;

private _reserveGroups=[];
private _synced=[];
private _module=objNull;
{
_module=_x;
_synced=[_module]call BIS_fnc_allSynchronizedObjects;
//_synced=synchronizedObjects _module;
{_reserveGroups pushBackUnique(group _x)}forEach _synced;
}forEach _modules;

if((count _reserveGroups)<1)exitWith{
	if(ddaiDebug)then{systemChat"DDAI reserves: no groups found"};
};

private _targets=[];
while{TRUE}do{
	if(ddaiDebug)then{systemChat"DDAI reserves CHECKING"};
	if(_groups call DDAI_fnc_AllGroupsDead)exitWith{};
	// If an enemy is detected, call reserve groups
	_targets=[];
	{
	_leader=leader _x;
	_targets=_leader targets[TRUE,1000];
	if(ddaiDebug)then{systemChat format["DDAI reserves TARGETS: %1",_targets]};
	{if(_x isKindOf"AIR")then{_targets=_targets-[_x]}}forEach _targets;
	if((count _targets)>0)exitWith{};
	}forEach _groups;
	if((count _targets)>0)exitWith{};
	sleep 10;
};
if(_groups call DDAI_fnc_AllGroupsDead)exitWith{
	if(ddaiDebug)then{systemChat"DDAI reserves EXIT (no groups)"};
};
if(ddaiDebug)then{systemChat"DDAI reserves called"};

{
private _group=_x;
_group setVariable["ddaiReserveCalled",TRUE,TRUE];
}forEach _reserveGroups;