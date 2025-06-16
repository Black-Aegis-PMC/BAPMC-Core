// Basically parseSimpleArray but works whether there are brackets on the array or not. Designed for arrays of strings
private _string="";
if((typeName _this)=="ARRAY")exitWith{_this};
if((typeName _this)=="STRING")then{_string=_this}else{_string=str _this};
if(_string=="")exitWith{[]};
if!(((_string splitString"")select 0)=="[")then{_string=format["[%1]",_string]};
(parseSimpleArray _string)