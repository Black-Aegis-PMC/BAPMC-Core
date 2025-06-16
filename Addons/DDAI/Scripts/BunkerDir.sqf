private _bunker=_this select 0;
private _dir=_this select 1;
private _offset=-1;
if(_bunker isKindOf"Land_Bunker_01_small_F")then{_offset=180};
if(_bunker isKindOf"Land_Bunker_01_big_F")then{_offset=180};
if(_bunker isKindOf"Land_Bunker_01_tall_F")then{_offset=180};
if(_bunker isKindOf"Land_Bunker_01_HQ_F")then{_offset=90};
if(_bunker isKindOf"Land_BagBunker_Large_F")then{_offset=180};
if(_bunker isKindOf"Land_BagBunker_Small_F")then{_offset=180};
if(_bunker isKindOf"Land_BagBunker_Tower_F")then{_offset=180};
if(_bunker isKindOf"Land_PillboxBunker_01_hex_F")then{_offset=90};
if(_bunker isKindOf"Land_PillboxBunker_01_rectangle_F")then{_offset=0};
if(_bunker isKindOf"Land_PillboxBunker_01_big_F")then{_offset=0};
if(_offset<0)then{
	_offset=0;
	private _type=toUpper(typeOf _bunker);
	{if(_type==(_x select 0))exitWith{_offset=(_x select 1)}}forEach ddaiCustomBunkers;
};
if(_offset>0)then{
	_dir=_dir+_offset;
	_bunker setDir _dir;
};
_bunker
