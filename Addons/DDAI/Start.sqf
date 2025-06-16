//if(time>-1)exitWith{};
/*
NOTES:
Vehicles should be in groups of one
Mixed infantry/vehicle groups should have the leader in the vehicle
Air units will not be used by the system (Use DAFS)
*/

/*
POSTURE TYPES
DEFEND: Groups stay in garrison, no extra WP
DEFENDFLEXIBLE: Groups stay in garrison with random exit conditions, vehicles may get guard WP
COUNTER: Groups will launch a counter attack once ground units are spotted (may be vehicle groups only or all groups)
GUARD: Groups stay in garrison with random exit conditions, all groups get guard WP
ATTACK: Groups will attack the target position
*/

/*
LAMBS garrison info:
https://github.com/nk3nny/LambsDanger/wiki/waypoints

The AI will take up building positions and man static weapons within a set range. Units will remain static until a triggered, the trigger may be taking damage, shooting weapons, or being near an enemy fire.

Arguments:
0: Group performing action, either unit <OBJECT> or group <GROUP>
1: Position to occupy, default group location <ARRAY or OBJECT>
2: Range of tracking, default is 50 meters <NUMBER>
3: Area the AI Camps in, default [] <ARRAY>
4: Teleport Units to Position <BOOL>
5: Sort Based on Height <BOOL>
6: Exit Conditions that breaks a Unit free (-2 Random, -1 All, 0 None, 1 Hit, 2 Fired, 3 FiredNear, 4 Suppressed), default -2 <NUMBER>
7: Sub-group patrols the area <BOOL>

[bob, bob, 50] call lambs_wp_fnc_taskGarrison;
*/

if(isNil"ddaiCustomBunkers")then{ddaiCustomBunkers=[]};

if(isNil"ddaiGoCodes")then{ddaiGoCodes=[]};

//ddaiGoCodes=[]; // Note this is global acros all modules

waitUntil{!isNil("lambs_wp_fnc_taskReset")};

DDAI_fnc_ParseGoCodes=compile preprocessFile"DDAI\Scripts\ParseGoCodes.sqf";
DDAI_fnc_GoCodeCheck=compile preprocessFile"DDAI\Scripts\GoCodeCheck.sqf";
DDAI_fnc_ParseArray=compile preprocessFile"DDAI\Scripts\ParseArray.sqf";
DDAI_fnc_ParseSide=compile preprocessFile"DDAI\Scripts\ParseSide.sqf";

DDAI_fnc_CountEmptySeats=compile preprocessFile"DDAI\Scripts\CountEmptySeats.sqf";
DDAI_fnc_GetDismounts=compile preprocessFile"DDAI\Scripts\GetDismounts.sqf";

DDAI_fnc_GroupIsAlive=compile preprocessFile"DDAI\Scripts\GroupIsAlive.sqf";
DDAI_fnc_GroupVehicles=compile preprocessFile"DDAI\Scripts\GroupVehicles.sqf";
DDAI_fnc_GroupMounted=compile preprocessFile"DDAI\Scripts\GroupMounted.sqf";
DDAI_fnc_AllGroupsDead=compile preprocessFile"DDAI\Scripts\AllGroupsDead.sqf";
DDAI_fnc_AllTargets=compile preprocessFile"DDAI\Scripts\AllTargets.sqf";

DDAI_fnc_Breakpoint=compile preprocessFile"DDAI\Scripts\Breakpoint.sqf";
DDAI_fnc_InHouse=compile preprocessFile"DDAI\Scripts\InHouse.sqf";
DDAI_fnc_BunkerDir=compile preprocessFile"DDAI\Scripts\BunkerDir.sqf";
DDAI_fnc_ProcessUngarrisoned=compile preprocessFile"DDAI\Scripts\ProcessUngarrisoned.sqf";
DDAI_fnc_WPpos=compile preprocessFile"DDAI\Scripts\WPpos.sqf";
DDAI_fnc_GuardWP=compile preprocessFile"DDAI\Scripts\GuardWP.sqf";
DDAI_fnc_Attack=compile preprocessFile"DDAI\Scripts\Attack.sqf";
DDAI_fnc_DeleteEmptyStatics=compile preprocessFile"DDAI\Scripts\DeleteEmptyStatics.sqf";
DDAI_fnc_ReserveGroup=compile preprocessFile"DDAI\Scripts\ReserveGroup.sqf";
DDAI_fnc_CallReserves=compile preprocessFile"DDAI\Scripts\CallReserves.sqf";

DDAI_fnc_ResetGroup=compile preprocessFile"DDAI\Scripts\ResetGroup.sqf";

ddaiFunctionsReady=TRUE;

sleep 1;
if!(isServer)exitWith{};
//(getPos player), // center
//(getDir player), // module direction

private _info=[
objNull,
WEST, // side
["DEFENDFLEXIBLE"], // See posture types above
45, // facing
"FALSE", // face out
2000, // radius
"", // attack objective
[10,60], // min,max delay in seconds before starting attack
[60,600], // min,max delay in seconds before making a counter attack once enemy is spotted (on counter orders)
[500,1000], // counter distance
"BOTH", // counter type
"GREEN", // colour theme "GREEN","BROWN"
100, // bunker chance
100, // camonet chance
"TRUE", // delete ungarrisoned
"TRUE", // delete empty static weapons
[75,100], // breakpoint
15, // object distance for BIS_fnc_SafePos
0, // delay
"", // Go codes
"FALSE"
];

ddaiDebug=FALSE;

private _info=_this; // When called by a module

//"Land_Bunker_01_big_F", "Land_BagBunker_01_large_green_F", "Land_Bunker_01_small_F"
//"CamoNet_wdl_big_F","CamoNet_BLUFOR_big_F","CamoNet_INDP_big_F","CamoNet_OPFOR_big_F","CamoNet_Sand_big_lxWS"

private _c=0;
private _firstEntry=_info select _c;_c=_c+1;

private _pos=[];
private _dirModule=0;
private _module=objNull;
private _moduleTypes=objNull;

private _customBunkers=[];

if((typeName _firstEntry)=="OBJECT")then{_module=_firstEntry}else{_pos=_firstEntry};//_c=_c+1;

if!(isNull _module)then{
	_pos=getPos _module;//_c=_c+1; // center of AI area (only groups in the area will be registered)
	_dirModule=getDir _module;//_c=_c+1; // direction of module
	{if(_x isKindOf"DDAI_BunkerTypes")exitWith{_moduleTypes=_x}}forEach(synchronizedObjects _module);
	{
	if(_x isKindOf"Building")then{
		private _dummy=_x;
		ddaiCustomBunkers pushBack[toUpper(typeOf _dummy),(getDir _dummy)];
		_customBunkers pushBack(typeOf _dummy);
		deleteVehicle _dummy;
	};
	}forEach(synchronizedObjects _module);
};

//private _pos=_info select _c;_c=_c+1; // center of AI area (only groups in the area will be registered)
//private _dirModule=_info select _c;_c=_c+1; // direction of module
private _side=(_info select _c)call DDAI_fnc_ParseSide;_c=_c+1;
private _postureArray=(_info select _c)call DDAI_fnc_ParseArray;_c=_c+1; // Defend, DefendFlexible, Attack, Counter, Guard
private _facing=_info select _c;_c=_c+1; // Facing of the company
private _faceOut=FALSE;if((_info select _c)=="TRUE")then{_faceOut=TRUE};_c=_c+1; // all bunkers facing out from module
private _radius=_info select _c;_c=_c+1; // radius around _pos in which to register groups
private _attackMarker=_info select _c;_c=_c+1; // position to be taken with attack orders
private _attackDelay=(((_info select _c)call DDAI_fnc_ParseArray))call BIS_fnc_randomInt;_c=_c+1;
private _counterDelay=(((_info select _c)call DDAI_fnc_ParseArray))call BIS_fnc_randomInt;_c=_c+1;
private _counterDistance=(((_info select _c)call DDAI_fnc_ParseArray))call BIS_fnc_randomInt;_c=_c+1; // Distance at which enemies trigger a counter attack
private _counterType=_info select _c;_c=_c+1;
private _camoScheme=_info select _c;_c=_c+1; // colour for bunkers and camonets
private _bunkerChance=_info select _c;_c=_c+1;
private _camoNetChance=_info select _c;_c=_c+1;
private _deleteUngarrisoned=TRUE;if((_info select _c)=="FALSE")then{_deleteUngarrisoned=FALSE};_c=_c+1;
private _deleteEmptyStatics=TRUE;if((_info select _c)=="FALSE")then{_deleteEmptyStatics=FALSE};_c=_c+1;
private _breakpoint=(((_info select _c)call DDAI_fnc_ParseArray))call BIS_fnc_randomInt;_c=_c+1;
private _objectDistance=_info select _c;_c=_c+1;
private _delay=_info select _c;_c=_c+1;
private _goCodesIn=(_info select _c)call DDAI_fnc_ParseGoCodes;_c=_c+1;
if((_info select _c)=="TRUE")then{ddaiDebug=TRUE};_c=_c+1;

if(ddaiDebug)then{systemChat format["DDAI starting (delay: %1)",_delay];hint str _info};

sleep _delay;

if(ddaiDebug)then{systemChat"DDAI started"};

if(_facing<0)then{_facing=_dirModule};

if!((count _goCodesIn)==0)then{
	if(ddaiDebug)then{systemChat"DDAI waiting for go-codes"};
	while{TRUE}do{sleep 1;if(_goCodesIn call DDAI_fnc_GoCodeCheck)exitWith{};};
	if(ddaiDebug)then{systemChat"DDAI go-codes FOUND"};
};

_counterType=toUpper _counterType;
if(_counterType=="RANDOM")then{_counterType=selectRandom["INFANTRY","VEHICLES","BOTH"]};

//"Land_Bunker_01_HQ_F",
//"Land_BagBunker_Small_F",
//"Land_BagBunker_Tower_F"
//"Land_Bunker_01_tall_F",
//"Land_PillboxBunker_01_rectangle_F",

private _bunkers=[];

if!(isNull _moduleTypes)then{
	sleep .2;
	//hintc str _moduleTypes;sleep 1;player setPos(getPos _moduleTypes);
	_bunkers=[];
	private _var="";
	private _value="";
	{
	_var=_x;
	_value=_moduleTypes getVariable _var;
	//systemChat _value;sleep .5;
	if!(_value=="FALSE")then{_bunkers pushBack _value};
	}forEach[
	"ddaiSandbagSmall",
	"ddaiSandbagSmallGreen",
	"ddaiSandbag",
	"ddaiSandbagGreen",
	"ddaiModularSmall",
	"ddaiModularBig",
	"ddaiPillboxSmall",
	"ddaiPillboxBig"
	];
	//hintc str _bunkers;
	/*
	if((_moduleTypes getVariable"ddaiSandbagSmall")=="TRUE")then{_bunkers pushBack"Land_BagBunker_Small_F"};
	if((_moduleTypes getVariable"ddaiSandbagSmallGreen")=="TRUE")then{
		_bunkers pushBack"Land_BagBunker_01_small_green_F";
	};
	if((_moduleTypes getVariable"ddaiSandbag")=="TRUE")then{_bunkers pushBack"Land_BagBunker_Large_F"};
	if((_moduleTypes getVariable"ddaiSandbagGreen")=="TRUE")then{_bunkers pushBack"Land_BagBunker_01_large_green_F"};
	if((_moduleTypes getVariable"ddaiModularSmall")=="TRUE")then{_bunkers pushBack"Land_Bunker_01_small_F"};
	if((_moduleTypes getVariable"ddaiModularBig")=="TRUE")then{_bunkers pushBack"Land_Bunker_01_big_F"};
	if((_moduleTypes getVariable"ddaiPillboxSmall")=="TRUE")then{_bunkers pushBack"Land_PillboxBunker_01_hex_F"};
	if((_moduleTypes getVariable"ddaiPillboxBig")=="TRUE")then{_bunkers pushBack"Land_PillboxBunker_01_big_F"};
	*/
};

if((count _bunkers)<1)then{
	_bunkers=[
		"Land_BagBunker_Large_F",
		"Land_Bunker_01_small_F",
		"Land_Bunker_01_big_F",
		"Land_PillboxBunker_01_hex_F",
		"Land_PillboxBunker_01_big_F"
	];
	if(_camoScheme=="GREEN")then{
		_bunkers=[
		"Land_BagBunker_01_large_green_F",
		"Land_Bunker_01_small_F",
		"Land_Bunker_01_big_F",
		"Land_PillboxBunker_01_hex_F",
		"Land_PillboxBunker_01_big_F"
		];
	};
};

//	"CamoNet_wdl_big_F",
//	"CamoNet_Sand_big_lxWS"
private _camoNets=[
	"CamoNet_OPFOR_big_F"
];
if(_camoScheme=="GREEN")then{
	_camoNets=[
	"CamoNet_BLUFOR_big_F",
	"CamoNet_INDEP_big_F"
	];
};

if((count _customBunkers)>0)then{
	_bunkers=[]+_customBunkers;
};

if(ddaiDebug)then{systemChat format["DDAI BUNKER TYPES: %1)",_bunkers]};

// Auto generate if no pos parsed
if((count _pos)<1)then{
	private _size=worldSize/2;
	private _pos=[_size,_size,0];
	private _radius=sqrt 2 * _size;
};

private _posture=toUpper(selectRandom _postureArray);

if(ddaiDebug)then{systemChat format["DDAI posture: %1",_posture]};

if(_posture=="ATTACK")then{
	if(_attackMarker=="")exitWith{hintC"No attack marker, using COUNTER orders";_posture="COUNTER"};
};

private _garrisonExit=-2; // Conditions that exit LAMBS garrison (-2 is random, 0 is never)
if(_posture=="DEFEND")then{_garrisonExit=0};

private _groups=[];
private _infantryGroups=[];
private _vehicleGroups=[];
//_infantryGroups=[];
//_vehicleGroups=[];
private _allGroups=[];
private _leader=objNull;
private _vehicle=objNull;

// Get infantry and vehicle groups
// A vehicle group is any group where the leader is in a land vehicle (not static)
{
private _group=_x;
if((side _x)==_side)then{
	if(_group getVariable"DDAIexclude")exitWith{};
	_leader=leader _group;
	_vehicle=vehicle _leader;
	if((_leader distance _pos)>_radius)exitWith{};
	_groups pushBackUnique _group;
	if(_vehicle==_leader)then{_infantryGroups pushBackUnique _group}else{
		if(_vehicle isKindof"Static")exitWith{};
		if!(_vehicle isKindof"LandVehicle")exitWith{};
		_vehicleGroups pushBackUnique _group;
	};
};
}forEach allGroups;

_allGroups=_infantryGroups+_vehicleGroups;
//hintc str _allGroups;

if((count _allGroups)<1)exitWith{};

private _attackPos=_pos;

if(_posture in["ATTACK"])exitWith{
	if(ddaiDebug)then{systemChat format["DDAI ATTACK (delay: %1)",_attackDelay]};
	sleep _attackDelay;
	if(ddaiDebug)then{systemChat"DDAI ATTACK STARTED"};
	_attackPos=getMarkerPos _attackMarker;
	//hintc str _allGroups;
	if(_allGroups call DDAI_fnc_AllGroupsDead)exitWith{};
	{[_x,_attackPos]spawn DDAI_fnc_Attack}forEach _allGroups;
	//player setPos _attackPos;
};

// Spawn bunkers and garrison troops if not in structures
if(ddaiDebug)then{systemChat format["DDAI garrison check (%1 groups)",(count _infantryGroups)]};
{
//if!(_posture in["DEFEND","DEFENDFLEXIBLE","COUNTER","GUARD"])exitWith{};
_group=_x;
_leader=leader _group;
if!(_leader call DDAI_fnc_InHouse)then{
	if((random 100)>_bunkerChance)exitWith{};
	private _attempts=10;
	private _safePos=[];
	private _safeDistance=50;
	while{TRUE}do{
		if(_attempts<1)exitWith{_safePos=getPos _leader};
		_safePos=[_leader,0,_safeDistance,_objectDistance,0]call BIS_fnc_findSafePos;
		if((_safePos distance2D _leader)<300)exitWith{};
		_safeDistance=_safeDistance+20;
		_attempts=_attempts-1;
		sleep .1;
	};
	private _bunker=(selectRandom _bunkers)createVehicle _safePos;
	sleep .2;
	if(_faceOut)then{_facing=_pos getDir _safePos};
	[_bunker,_facing]call DDAI_fnc_BunkerDir;
	//{_x setPos(getPos _bunker)}forEach(units _group);
	//_leader setPos(getPos _bunker);
	//{_x setVehiclePosition[getPos _bunker,[],0,"NONE"]}forEach(units _group);
	_leader setVehiclePosition[getPos _bunker,[],0,"NONE"];
	sleep .5;
	[_group,_leader,20,[],TRUE,TRUE,_garrisonExit]remoteExecCall["lambs_wp_fnc_taskGarrison",_leader];
	sleep .2;
	{_x setDammage 0}forEach(units _group);
	if(_deleteUngarrisoned)then{[_group]spawn DDAI_fnc_ProcessUngarrisoned};
}else{
	[_group,_leader,20,[],TRUE,TRUE,_garrisonExit]remoteExecCall["lambs_wp_fnc_taskGarrison",_leader];
	if(_deleteUngarrisoned)then{[_group]spawn DDAI_fnc_ProcessUngarrisoned};
};
}forEach _infantryGroups;
sleep 1;

// Garrison infantry that aren't in bunkers
{
_group=_x;
_leader=leader _x;
if(_posture in["DEFEND","DEFENDFLEXIBLE","COUNTER","GUARD"])then{
	if(_leader call DDAI_fnc_InHouse)exitWith{};
	[_group,_leader,30,[],TRUE,TRUE,_garrisonExit]remoteExecCall["lambs_wp_fnc_taskGarrison",_leader];
	sleep .2;
	{_x setDammage 0}forEach(units _group);
	if(_deleteUngarrisoned)then{[_group]spawn DDAI_fnc_ProcessUngarrisoned};
};
}forEach _infantryGroups;
sleep 1;

// Give ungarrisoned troops patrol orders
if(ddaiDebug)then{systemChat format["DDAI patrol (%1 groups)",(count _infantryGroups)]};
{
_group=_x;
_leader=leader _x;
if(_posture in["DEFEND","DEFENDFLEXIBLE","COUNTER","GUARD"])then{
	if(_leader call DDAI_fnc_InHouse)exitWith{};
	[_group,_leader,200]remoteExecCall["lambs_wp_fnc_taskPatrol",_leader];
	sleep .2;
	{_x setDammage 0}forEach(units _group);
};
}forEach _infantryGroups;

if(ddaiDebug)then{systemChat format["DDAI processing vehicles (%1 groups)",(count _vehicleGroups)]};
// Put camo nets over vehicles
private _vehicles=[];
{
_group=_x;
_leader=leader _group;
_vehicles=[];
	{
	if(_group getVariable"DDAIexclude")exitWith{};
	_vehicle=vehicle _x;
	if!(_x==_vehicle)then{
		if(_vehicle isKindOf"StaticWeapon")exitWith{};
		//_vehicles pushBackUnique _vehicle;
		//_vehicle setDir _facing;
		if(_posture in["DEFEND","DEFENDFLEXIBLE","COUNTER","GUARD"])then{
			//if!(_useCamoNets)exitWith{};
			if((random 100)>_camoNetChance)exitWith{};
			if(_vehicle in _vehicles)exitWith{};
			private _safePos=[_vehicle,0,200,10,0]call BIS_fnc_findSafePos;
			private _net=(selectRandom _camoNets)createVehicle _safePos;
			_net setPos(getPos _vehicle);
			_net setDir((getDir _vehicle)-180);
		};
		_vehicles pushBackUnique _vehicle;
	};
	}forEach(units _group);
	if(_group getVariable"DDAIexclude")exitWith{};
	sleep .2;
	if(_posture in["DEFENDFLEXIBLE"])then{
			if((random 100)>50)then{[_group]spawn DDAI_fnc_GuardWP};
	};
	if(_posture in["GUARD"])then{[_group]spawn DDAI_fnc_GuardWP};
}forEach _vehicleGroups;

if(_deleteEmptyStatics)then{
	if(ddaiDebug)then{systemChat"DDAI deleting empty statics"};
	[_pos,_radius]spawn DDAI_fnc_DeleteEmptyStatics;
};

if(_breakpoint>0)then{[_allGroups,_breakpoint]spawn DDAI_fnc_Breakpoint};

[_allGroups,_radius,_pos]spawn DDAI_fnc_CallReserves;

// COUNTER ATTACK AI
// Wait until a land target is detected, then wait until the counter delay has expired, then counter attack
private _targets=[];
if(_posture in["COUNTER"])then{
	if(ddaiDebug)then{systemChat"DDAI counter AI started"};
	if(_counterType=="INFANTRY")then{
		{if!((vehicle(leader _x))==(leader _x))then{_allGroups=_allGroups-[_x]}}forEach _allGroups;
	};
	if(_counterType=="VEHICLES")then{
		{if((vehicle(leader _x))==(leader _x))then{_allGroups=_allGroups-[_x]}}forEach _allGroups;
	};
	while{TRUE}do{
		if(_allGroups call DDAI_fnc_AllGroupsDead)exitWith{};
		// If an enemy is detected, start the counter countdown
		_targets=[];
		{
		_leader=leader _x;
		_targets=_leader targets[TRUE,_counterDistance];
		{if(_x isKindOf"AIR")then{_targets=_targets-[_x]}}forEach _targets;
		if(_targets>0)exitWith{};
		}forEach _allGroups;
		if(_targets>0)exitWith{};
	};
	if(_allGroups call DDAI_fnc_AllGroupsDead)exitWith{};
	if(ddaiDebug)then{systemChat format["DDAI counter triggered (delay: %1)",_counterDelay]};
	sleep _counterDelay;
	if(_allGroups call DDAI_fnc_AllGroupsDead)exitWith{};
	if(ddaiDebug)then{systemChat"DDAI counter attack started"};
	// Launch counter attack
	{_x call DDAI_fnc_ResetGroup}forEach _allGroups;
	
	{
	_group=_x;
	while{((count(waypoints _group))>0)}do{{deleteWaypoint _x}forEach(waypoints _group)};
	}forEach _allGroups;
	
	while{TRUE}do{
		if(_allGroups call DDAI_fnc_AllGroupsDead)exitWith{};
		_targets=[_allGroups,_counterDistance]call DDAI_fnc_AllTargets;
		if((count _targets)>0)then{
			_attackPos=getPos(selectRandom _targets);
			{_x move _attackPos}forEach _allGroups;
		};
		sleep 300;
	};
};