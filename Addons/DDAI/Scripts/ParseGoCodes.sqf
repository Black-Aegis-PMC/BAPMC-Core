// Parses a string or array of gocodes into an array
private _string="";
if!((typeName _this)=="STRING")then{_string=str _this}else{_string=_this};
private _stringArray=_string splitString",[]";
_stringArray apply{if!((typeName _x)=="STRING")then{str _x}}; // make sure every element is a string
private _out=[];
{if!(_x in["[","]"])then{_out pushBack _x}}forEach _stringArray;
_out