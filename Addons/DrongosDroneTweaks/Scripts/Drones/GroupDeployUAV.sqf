private _group=_this select 0;
private _type=toUpper(_this select 1);
private _code=DDT_fnc_ManHasRecon;
if(_type=="FPV")then{_code=DDT_fnc_ManHasFPV};
if(_type=="FPVAT")then{_code=DDT_fnc_ManHasFPVAT};
if(_type=="BOMBER")then{_code=DDT_fnc_ManHasBomber};
if(_type=="UGV")then{_code=DDT_fnc_ManHasUGV};
{
if(_x call _code)exitWith{[_x,_type]spawn DDT_fnc_DeployUAV};
}forEach(units _group);
TRUE