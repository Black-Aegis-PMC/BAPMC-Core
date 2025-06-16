private _module=_this select 0;
private _units=_this select 1;
private _activated=_this select 2;
if!(isServer)exitWith{};
sleep 1;
waitUntil{!isNil("ddaiFunctionsReady")};waitUntil{ddaiFunctionsReady};
DDAI_fnc_ReserveGroup=compile preprocessFile"DDAI\Scripts\ReserveGroup.sqf";
if(_activated)then{
	private _groups=[];
	{_groups pushBackUnique(group _x)}forEach _units;
	{
		[
		_x,
		getPos _module,
		(_module getVariable"ddaiDelay"),
		(_module getVariable"ddaiReactChance"),
		(_module getVariable"ddaiDeleteChance")
		]spawn DDAI_fnc_ReserveGroup;
	}forEach _groups;
};
TRUE