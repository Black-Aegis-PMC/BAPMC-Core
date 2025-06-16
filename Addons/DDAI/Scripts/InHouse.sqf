// Check if a man is in a house/on a roof
private _man=_this;
private _pos=getPosASL _man;
private _x=_pos select 0;
private _y=_pos select 1;
private _z=_pos select 2;
private _type="House";
private _type="Building";
_z=_z+5;
private _pos=[_x,_y,_z];
private _out=lineIntersectsWith[(getPosASL _man),_pos];
if((_out select 0)isKindOf _type)exitWith{TRUE};
_z=_z-10;
_pos=[_x,_y,_z];
_out=lineIntersectsWith[(getPosASL _man),_pos];
if((_out select 0)isKindOf _type)exitWith{TRUE};
FALSE