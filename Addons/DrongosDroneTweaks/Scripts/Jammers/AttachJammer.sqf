private _jammer=_this;
private _target=objNull;
private _objects=_jammer nearEntities[["LANDVEHICLE","AIR"],10];
_objects=_objects-[_jammer];
if((count _objects)<1)exitWith{FALSE};
_target=_objects select 0;
_jammer attachTo[_target];
TRUE