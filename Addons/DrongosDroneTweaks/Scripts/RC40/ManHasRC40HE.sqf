private _man=_this;
if(isPlayer _man)exitWith{FALSE};
if!(alive _man)exitWith{FALSE};
if!((vehicle _man)==_man)exitWith{FALSE};
if(_man call DDT_fnc_ManIsInside)exitWith{FALSE};
if([["1Rnd_RC40_HE_shell_RF"],(magazines _man)]call DDT_fnc_InArray)exitWith{TRUE};
FALSE