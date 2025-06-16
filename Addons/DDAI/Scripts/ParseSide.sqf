if((typeName _this)=="SIDE")exitWith{_this};
private _string=toUpper _this;
if(_string=="WEST")exitWith{WEST};
if(_string=="BLUFOR")exitWith{WEST};
if(_string=="EAST")exitWith{EAST};
if(_string=="OPFOR")exitWith{EAST};
if(_string=="RESISTANCE")exitWith{RESISTANCE};
if(_string=="GUER")exitWith{RESISTANCE};
if(_string=="INDEPENDENT")exitWith{RESISTANCE};
if(_string=="CIV")exitWith{CIVILIAN};
if(_string=="SIDEENEMY")exitWith{SIDEENEMY};
if(_string=="ENEMY")exitWith{SIDEENEMY};
if(_string=="RENEGADE")exitWith{SIDEENEMY};
CIVILIAN