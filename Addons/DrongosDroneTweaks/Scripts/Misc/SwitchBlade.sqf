private _man=_this select 0;
private _pos=_this select 1;
private _class=_this select 2;

private _side=side _man;
private _droneClass="B_SwitchBlade_300";
private _launcherClass="B_SwitchBlade_300_LaunchTube_Desert";
if(_class=="SwitchBlade_300_Tube_Woodland")then{
	_launcherClass="B_SwitchBlade_300_LaunchTube_Woodland";
};
if(_class=="SwitchBlade_600_Tube_Desert")then{
	_launcherClass="B_SwitchBlade_600_LaunchTube_Desert";
	_droneClass="B_SwitchBlade_600";
};
if(_class=="SwitchBlade_600_Tube_Woodland")then{
	_launcherClass="B_SwitchBlade_600_LaunchTube_Woodland";
	_droneClass="B_SwitchBlade_600";
};
private _dir=getDir _man;
private _launcher=_launcherClass createVehicle _pos;
_launcher setDir _dir;
_man assignAsGunner _launcher;
_man moveInGunner _launcher;
sleep 2;
if!(alive _launcher)exitWith{};
if!(alive _man)exitWith{};
_pos=_pos getPos[3,_dir];
_pos set[2,1];
private _drone=_droneClass createVehicle _pos;
createVehicleCrew _drone;
_drone setPosATL _pos;
_drone setDir _dir;
if!((side _drone)==(side _man))then{
	private _side=side _man;
	(crew _drone)joinSilent(createGroup _side);
	(group _drone)setVariable["daoExclude",TRUE,TRUE];
	(group _drone)setVariable["dceExclude",TRUE,TRUE];
	sleep .1;
};
_drone engineOn TRUE;
_drone setVehicleAmmo 0;
[_drone,[35,0,direction _drone]]call SWB_fnc_setPitchBankYaw;
private _vel=velocity _drone;
_dir=direction _drone;
private _speed=60;
_drone setVelocity[
	(sin _dir * _speed), 
	(cos _dir * _speed), 
	50
];
_drone setDamage 0;
_drone setVariable["lambs_danger_disableai",TRUE,TRUE];
(group _drone)setVariable["lambs_Danger_disableGroupAI",TRUE,TRUE];
//_drone setVariable["ddtPackType",_packType,TRUE];
//_drone setVariable["ddtMagType",_magType,TRUE];
//_drone setVariable["ddtItemType",_itemType,TRUE];
_drone setVariable["ddtOwner",(str _man),TRUE];
_man forceSpeed -1;
_drone setVariable["ddtTasked",TRUE,TRUE];
(leader(group _drone))action["CollisionLightOff",_drone];
_drone disableAI"LIGHTS";
_drone setPilotLight FALSE;
_drone setCombatMode"BLUE";
_drone setBehaviour"AWARE";
//_drone setBehaviour"CARELESS";
_drone setVariable["ddtReg",TRUE,TRUE];
private _camo=missionNamespace getVariable["ddtVisibility",.1];
private _audi=missionNamespace getVariable["ddtAudibility",.1];
_drone setUnitTrait["camouflageCoef",_camo,TRUE];
_drone setUnitTrait["audibleCoef",_audi,TRUE];

sleep 1;
if!([_drone,_man]call DDT_fnc_DroneGroupAlive)exitWith{};
_drone setDamage 0;
[_drone,_man]spawn DDT_fnc_ReportContacts;
[_drone,_man]execVM"DrongosDroneTweaks\Scripts\Drones\AI_FPV.sqf";
deleteVehicle _launcher;