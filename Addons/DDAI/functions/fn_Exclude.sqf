private _module=_this select 0;
private _units=_this select 1;
private _activated=_this select 2;
if!(isServer)exitWith{};
sleep .1;
if(_activated)then{
	{(group _x)setVariable["DDAIexclude",TRUE,TRUE]}forEach _units;
};
TRUE