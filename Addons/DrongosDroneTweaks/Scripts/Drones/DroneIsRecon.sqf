private _drone=_this;
if([[(typeOf _drone)],ddtClassesFPV]call DDT_fnc_InArray)exitWith{FALSE};
if([[(typeOf _drone)],ddtClassesFPVAT]call DDT_fnc_InArray)exitWith{FALSE};
if([[(typeOf _drone)],ddtClassesBomber]call DDT_fnc_InArray)exitWith{FALSE};
TRUE