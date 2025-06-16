private _pos=_this select 0;
private _range=_this select 1;
private _types=[
"Airport",
"CityCenter",
//"Mount",
"Name",
"NameCity",
"NameCityCapital",
"NameLocal",
//"NameMarine",
"NameVillage"
];
private _locations=nearestLocations[_pos,_types,_range];
private _positions=[];
{_positions pushBackUnique(getPos _x)}forEach _locations;
_positions