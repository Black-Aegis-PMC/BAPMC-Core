// Check if a man is in a house (expects man or object in)
private _man=_this;
private _pos=getPosASL _man;
//private _distance=_this select 1;
private _pos2=[_pos select 0,_pos select 1,((_pos select 2)+5)];
private _out=lineIntersectsWith[_pos,_pos2,_man];
if((count _out)==0)exitWith{FALSE};
//if((_out select 0)isKindof"HOUSE")exitWith{TRUE};
if((_out select 0)isKindof"BUILDING")exitWith{TRUE};
FALSE