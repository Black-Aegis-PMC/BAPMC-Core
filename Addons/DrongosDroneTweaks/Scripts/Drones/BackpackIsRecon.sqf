private _pack=_this;
private _drone=getText(configFile>>"CfgVehicles">>_pack>>"assembleInfo">>"assembleTo");
if(_drone=="")exitWith{FALSE};
if([[_drone],ddtClassesFPV]call DDT_fnc_InArray)exitWith{FALSE};
if([[_drone],ddtClassesFPVAT]call DDT_fnc_InArray)exitWith{FALSE};
if([[_drone],ddtClassesBomber]call DDT_fnc_InArray)exitWith{FALSE};
//if([[_drone],ddtClassesRecon]call DDT_fnc_InArray)exitWith{TRUE};
if!((getNumber(configFile>>"CfgVehicles">>_drone>>"isUAV"))==1)exitWith{FALSE};
if(_drone isKindOf"AIR")exitWith{TRUE};
FALSE