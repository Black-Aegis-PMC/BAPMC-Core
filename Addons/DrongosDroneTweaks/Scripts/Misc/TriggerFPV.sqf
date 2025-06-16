/* NOT USED
private _drone=_this;
if(isNull _drone)exitWith{};
//private _ammo="FPV_RPG42_AT";
//private _ammo="DDT_FPVAT_Warhead";
private _ammo="R_PG32V_F";
private _type=toUpper(typeOf _drone);
if!(_type in["B_CROCUS_AT","O_CROCUS_AT","I_CROCUS_AT","B_CROCUS_AP","O_CROCUS_AP","I_CROCUS_AP"])exitWith{FALSE};
if(_type in["B_CROCUS_AP","O_CROCUS_AP","I_CROCUS_AP"])then{_ammo="R_TBG32V_F"};
private _warhead=createVehicle[_ammo,_drone modelToWorld[0,0,0]];
//private _warhead=createVehicle[_ammo,_target modelToWorld[0,0,0]];
_warhead setVectorDirAndUp[vectorDir _drone,vectorUp _drone];
//deleteVehicle _drone;
//triggerAmmo _warhead;
private _vel=velocity _drone;
private _dir=getDir _drone;
private _additionalSpeed=1; // in m/s
_warhead setVelocity[
	(_vel select 0) + (sin _dir * _additionalSpeed),
	(_vel select 1) + (cos _dir * _additionalSpeed),
	(_vel select 2) // horizontal only
];
deleteVehicle _drone;
_warhead setVelocity _vel;
triggerAmmo _warhead;
TRUE