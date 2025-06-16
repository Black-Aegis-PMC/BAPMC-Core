// Check if a position is in a house (expects posASL in)
private _pos=_this; // ASL
private _pos2=[_pos select 0,_pos select 1,((_pos select 2)+5)];
private _out=lineIntersectsWith[_pos,_pos2];
if((count _out)==0)exitWith{FALSE};
//if((_out select 0)isKindof"HOUSE")exitWith{TRUE};
if((_out select 0)isKindof"BUILDING")exitWith{TRUE};
FALSE