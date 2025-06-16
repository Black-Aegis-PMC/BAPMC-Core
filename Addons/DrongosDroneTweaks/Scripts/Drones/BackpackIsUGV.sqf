private _pack=_this;
private _drone=getText(configFile>>"CfgVehicles">>_pack>>"assembleInfo">>"assembleTo");
if(_drone=="")exitWith{FALSE};
private _has=FALSE;
//if([[_drone],ddtClassesUGV]call DDT_fnc_InArray)exitWith{TRUE};
{if(_drone isKindOf _x)exitWith{_has=TRUE}}forEach ddtClassesUGV;
_has