private _drone=_this select 0;
private _man=_this select 1;
if!(alive _drone)exitWith{FALSE};
if((count(crew _drone))<1)exitWith{FALSE};
if!(alive _man)exitWith{
	_drone setVariable["ddtExclude",TRUE,TRUE];
	FALSE
};
TRUE