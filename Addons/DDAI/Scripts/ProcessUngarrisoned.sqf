// Delete ungarrisoned units
private _group=_this select 0;
sleep 20;
{
if!(_x call DDAI_fnc_InHouse)then{deleteVehicle _x};
}forEach(units _group);
