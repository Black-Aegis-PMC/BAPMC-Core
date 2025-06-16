sleep 1;
if!(isServer)exitWith{};
private _jammer=_this;
waitUntil{!(isNil"ddtReady")};waitUntil{ddtReady};
private _side=WEST;
if(_jammer isKindOf"DDT_HeavyDroneJammer_O")then{_side=EAST};
if(_jammer isKindOf"DDT_HeavyDroneJammer_I")then{_side=RESISTANCE};
[_jammer,_side,500,95,3,.2]spawn DDT_fnc_JammerObject;