// Bombers
private _man=_this;
if!(alive _man)exitWith{FALSE};
if(_man getVariable["ddtExclude",FALSE])exitWith{};
if(isPlayer _man)exitWith{FALSE};
if!((vehicle _man)==_man)exitWith{FALSE};
//if(_man call DDT_fnc_ManIsInside)exitWith{FALSE};
if([(magazines _man),ddtClassesBomber]call DDT_fnc_InArray)exitWith{TRUE};
if([(items _man),ddtClassesBomber]call DDT_fnc_InArray)exitWith{TRUE};
private _pack=backpack _man;
if(_pack=="")exitWith{FALSE};
if(_pack call DDT_fnc_BackpackIsBomber)exitWith{TRUE};
FALSE