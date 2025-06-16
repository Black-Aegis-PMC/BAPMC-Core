private _module=_this select 0;
private _units=_this select 1;
private _activated=_this select 2;
if!(isServer)exitWith{};
sleep 1;
if(_activated)then{
	//getPos _module,getDir _module,
	[
	_module,
	(_module getVariable"ddaiSide"),
	(_module getVariable"ddaiPosture"),
	(_module getVariable"ddaiFacing"),
	(_module getVariable"ddaiFaceOut"),
	(_module getVariable"ddaiRadius"),
	(_module getVariable"ddaiAttackMarker"),
	(_module getVariable"ddaiAttackDelay"),
	(_module getVariable"ddaiCounterDelay"),
	(_module getVariable"ddaiCounterDistance"),
	(_module getVariable"ddaiCounterType"),
	(_module getVariable"ddaiScheme"),
	(_module getVariable"ddaiBunkerChance"),
	(_module getVariable"ddaiCamoNetChance"),
	(_module getVariable"ddaiDeleteUngarrisoned"),
	(_module getVariable"ddaiDeleteEmptyStatics"),
	(_module getVariable"ddaiBreakpoint"),
	(_module getVariable"ddaiObjectDistance"),
	(_module getVariable"ddaiDelay"),
	(_module getVariable"ddaiGoCodes"),
	(_module getVariable"ddaiDebug")
	]execVM"DDAI\Start.sqf";
};
TRUE