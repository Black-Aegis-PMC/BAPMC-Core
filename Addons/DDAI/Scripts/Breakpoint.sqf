private _groups=_this select 0;
private _breakpoint=_this select 1;
if(_breakpoint<1)exitWith{};
if(_breakpoint>99)exitWith{};
sleep 30; // allow time for ungarrisoned men to be deleted
private _casualties=0;
private _menStart=0;
private _menCurrent=0;
private _group=grpNull;
{
_group=_x;
{if(alive _x)then{_menStart=_menStart+1}}forEach(units _group);
}forEach _groups;

while{TRUE}do{
	_menCurrent=0;
	{
	_group=_x;
	{if(alive _x)then{_menCurrent=_menCurrent+1}}forEach(units _group);
	}forEach _groups;
	_casualties=100-((_menCurrent/_menStart)*100);
	if(_casualties>_breakpoint)exitWith{};
	sleep 30;
};

// apply fleeing effect
{
_x call DDAI_fnc_ResetGroup;
_x allowFleeing 1;
}forEach _groups;