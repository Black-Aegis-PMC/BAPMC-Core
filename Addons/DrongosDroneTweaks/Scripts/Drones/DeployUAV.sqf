private _man=_this select 0;
private _type=_this select 1;

if!(simulationEnabled _man)exitWith{};

if(ddtDebug)then{
	private _t=format["%1 deploying %2",_man,_type];
	_t call DDT_fnc_Debug;
	//systemChat format["%1 deploying %2",_man,_type];
};
private _droneClass=[_man,_type]call DDT_fnc_ManGetUAV;
if(_droneClass=="")exitWith{};
if(_droneClass=="1Rnd_RC40_shell_RF")exitWith{
	_man setUnitPos"MIDDLE";
	[_man,_man]spawn lxRF_fnc_RC40_recon;
};
if(_droneClass=="1Rnd_RC40_HE_shell_RF")exitWith{};

(group _man)setVariable["Vcm_Disable",TRUE,TRUE]; 

_man forceSpeed 0;
[_man,"AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1"]remoteExec["playMoveNow",_man];
sleep 1;
if!(alive _man)exitWith{};
private _packType="";
private _magType="";
private _itemType="";
if(_man getVariable["ddtRemovePack",FALSE])then{
	_man setVariable["ddtRemovePack",FALSE,TRUE];
	_packType=backPack _man;
    removeBackpackGlobal _man;
	[_man]spawn DDT_fnc_RemovePack;
};
private _mag=_man getVariable["ddtRemoveMag",""];
if!(_mag=="")then{
	//_magType=_mag;
	_man removeMagazine _mag;
	_man setVariable["ddtRemoveMag","",TRUE];
};
private _item=_man getVariable["ddtRemoveItem",""];
if!(_item=="")then{
	//_itemType=_item;
	_man removeItem _item;
	_man setVariable["ddtRemoveItem","",TRUE];
};
[_man,"AmovPercMstpSlowWrflDnon"]remoteExec["playMoveNow",_man];
private _pos=getPos _man;
private _distance=1;
private _pos2=_pos getPos[_distance,(getDir _man)];
while{TRUE}do{
	if!((ATLtoASL _pos2)call DDT_fnc_PosIsInside)exitWith{_pos=_pos2};
	_distance=_distance+1;
	if(_distance>10)exitWith{_pos=[_pos,1,50,1,0,1,0]call BIS_fnc_findSafePos};
	_pos2=_pos getPos[_distance,(getDir _man)];
};
private _switchBlades=[
"SwitchBlade_300_Tube_Desert",
"SwitchBlade_600_Tube_Desert",
"SwitchBlade_300_Tube_Woodland",
"SwitchBlade_600_Tube_Woodland"
];
if([[_droneClass],_switchBlades]call DDT_fnc_InArray)exitWith{
	[_man,_pos,_droneClass]execVM"DrongosDroneTweaks\Scripts\Misc\SwitchBlade.sqf";
};

private _drone=_droneClass createVehicle _pos;
createVehicleCrew _drone;
(group _drone)setVariable["daoExclude",TRUE,TRUE];
(group _drone)setVariable["dceExclude",TRUE,TRUE];
if(ddtDebug)then{
	(format["%1 deployed %2    (%3)",_man,_droneClass,_drone])call DDT_fnc_debug;
};
if!((side _drone)==(side _man))then{
	private _side=side _man;
	(crew _drone)joinSilent(createGroup _side);
	(group _drone)setVariable["daoExclude",TRUE,TRUE];
	(group _drone)setVariable["dceExclude",TRUE,TRUE];
	sleep 1;
};
_drone setVariable["lambs_danger_disableai",TRUE,TRUE];
(group _drone)setVariable["lambs_Danger_disableGroupAI",TRUE,TRUE];
(group _drone)setVariable["Vcm_Disable",TRUE,TRUE]; 
_drone setVariable["ddtPackType",_packType,TRUE];
_drone setVariable["ddtMagType",_magType,TRUE];
_drone setVariable["ddtItemType",_itemType,TRUE];
_drone setVariable["ddtOwner",(str _man),TRUE];
_man forceSpeed -1;
_drone setVariable["ddtTasked",TRUE,TRUE];
(leader(group _drone))action["CollisionLightOff",_drone];
_drone disableAI"LIGHTS";
_drone setPilotLight FALSE;
_drone setCombatMode"BLUE";
_drone setBehaviour"AWARE";
//_drone setBehaviour"CARELESS";

[_drone,_man]spawn DDT_fnc_ReportContacts;
if(_type=="FPV")exitWith{
	[_drone,_man]execVM"DrongosDroneTweaks\Scripts\Drones\AI_FPV.sqf";
};
if(_type=="FPVAT")exitWith{
	[_drone,_man]execVM"DrongosDroneTweaks\Scripts\Drones\AI_FPV.sqf";
};
if(_type=="BOMBER")exitWith{
	[_drone,_man]execVM"DrongosDroneTweaks\Scripts\Drones\AI_Bomber.sqf";
};
if(_type=="UGV")exitWith{
	[_drone,_man]execVM"DrongosDroneTweaks\Scripts\Drones\AI_UGV.sqf";
};

// RECON
if((random 100)<(missionNameSpace getVariable["ddtLoiterChance",50]))then{
	[_drone,_man]execVM"DrongosDroneTweaks\Scripts\Drones\AI_Loiter.sqf";
}else{
	[_drone,_man]execVM"DrongosDroneTweaks\Scripts\Drones\AI_Recon.sqf";
};