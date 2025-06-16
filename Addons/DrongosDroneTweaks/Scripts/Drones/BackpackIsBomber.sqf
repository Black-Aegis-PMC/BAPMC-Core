private _pack=_this;
private _drone=getText(configFile>>"CfgVehicles">>_pack>>"assembleInfo">>"assembleTo");
if([[_drone],ddtClassesBomber]call DDT_fnc_InArray)exitWith{TRUE};
FALSE