private["_tube","_pos","_arc","_dir","_dirGun","_aimed"];
_tube=_this select 0;
_pos=_this select 1;
_arc=20;if((count _this)>2)then{_arc=_this select 2};
_dir=0;
_dirGun=0;
_aimed=FALSE;
_dir=_tube getDir _pos;
_dirGun=getDir _tube;
if(_dirGun<0)then{_dirGun=_dirGun+360};
if(((_dir-_dirGun)>(-_arc))AND((_dir-_dirGun)<_arc))then{_aimed=TRUE};
_aimed