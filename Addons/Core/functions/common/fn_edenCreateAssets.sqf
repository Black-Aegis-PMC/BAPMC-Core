/* ----------------------------------------------------------------------------
    Function: vs_core_fnc_edenCreateAssets

    Description:
    Creates mission slots, modules, and markers.

    Parameters:
    0: _callsign - The platoon callsign that all sections will use <String>
    1: _zeusCallsign - The callsign that HQ will use <String>
    2: _camo - The camo the units will use <String>
    3: _numberOfSections - The number of sections to spawn <Number>
    4: _ifvCrew - Number of crewed vehicles to spawn <Number>
    5: _helicopters - Number of helicopters to spawn <Number>
    6: _jets - Number of jets to spawn <Number>
    7: _gunships - Number of gunships to spawn <Number>
    8: _planes - Number of planes to spawn <Number>
    9: _createDefaults - Whether to create a section to use as default loadout units <Bool>

    Returns:
    Nothing.

    Examples:
    ["Odin", "Valhalla", "BLACK", 3, 2, 2, 1, 1, 1, true] call vs_core_fnc_edenCreateAssets;

    Author:
    Met & Amateur-God
License GPL-2.0
---------------------------------------------------------------------------- */
params [
    ["_callsign", "Shield", [""]],
    ["_zeusCallsign", "Olympus", [""]],
    ["_camo", "BLACK", [""]],
    ["_numberOfSections", 3, [0]],
    ["_ifvCrew", 0, [0]],
    ["_tankCrew", 0, [0]],
    ["_helicopters", 0, [0]],
    ["_jets", 0, [0]],
    ["_gunships", 0, [0]],
    ["_planes", 0, [0]],
    ["_createDefaults", true, [true]]
];

if (_callsign == "") then {
    _callsign = "Shield";
};

if (_zeusCallsign == "") then {
    _zeusCallsign = "Olympus";
};

if (_camo == "") then {
    _camo = "BLACK";
};

_camo = toUpper _camo;
_nameZeus = format ["%1_zeus", _camo];
_nameSection = format ["%1_section", _camo];
_nameCommand = format ["%1_command", _camo];
_nameDefaults = format ["%1_defaults", _camo];
_nameHelicopter = format ["%1_Helicopter", _camo];
_nameJet = format ["%1_JET", _camo];
_namePlane = format ["%1_PLANE", _camo];
_nameGunship = format ["%1_Gunship", _camo];
_nameVic = format ["%1_VIC", _camo];

_centralPos = screenToWorld [0.5, 0.5];
_camPos = [getPosATL get3DENCamera select 0, getPosATL get3DENCamera select 1, 0];
_spawnPos = _centralPos;
if (_centralPos distance _camPos > 500) then {
    _spawnPos = _camPos;
};

_entities =
[
	[
		["Marker", "mil_circle", _spawnPos vectorAdd [10, 0]],
		["markerName", "respawn"],
		["text", "respawn"]
	],
	[
		["Logic", "ModuleCurator_F", _spawnPos vectorAdd [-1, 0]],
		["ModuleCurator_F_Owner", "zeusOne"],
		["ModuleCurator_F_Name", "Active Zeus"],
		["ModuleCurator_F_Addons", 3]
	],
	[
		["Logic", "ModuleCurator_F", _spawnPos vectorAdd [-1, -1]],
		["ModuleCurator_F_Owner", "zeusTwo"],
		["ModuleCurator_F_Name", "Assistant Zeus"],
		["ModuleCurator_F_Addons", 3]
	],
	[
		["Logic", "ModuleCurator_F", _spawnPos vectorAdd [-1, -2]],
		["ModuleCurator_F_Owner", "#adminLogged"],
		["ModuleCurator_F_Name", "Admin"],
		["ModuleCurator_F_Addons", 3]
	],
	[
		["Logic", "HeadlessClient_F", _spawnPos vectorAdd [-2, 0]],
		["ControlMp", true],
		["name", "HC1"]
	],
	[
		["Logic", "HeadlessClient_F", _spawnPos vectorAdd [-2, -1]],
		["ControlMp", true],
		["name", "HC2"]
	],
	[
		["Logic", "HeadlessClient_F", _spawnPos vectorAdd [-2, -2]],
		["ControlMp", true],
		["name", "HC3"]
	],
	[
		["Object", "I_supplyCrate_F", _spawnPos vectorAdd [-3, 6]],
		["allowDamage", false],
		["ArsenalObject", true]
	],
	[
		["Logic", "vs_cORE_Barracks_Module", _spawnPos vectorAdd [-4, 7]],
		["vs_cORE_Barracks_Module_ArsenalFilter", "Standard"],
		["ArsenalObject", true]
	],
	[
		["Object", "I_supplyCrate_F", _spawnPos vectorAdd [-5, 6]],
		["allowDamage", false],
		["ArsenalObject", true]
	]
];

_sections =
[
	[
		[configfile >> "CfgGroups" >> "Independent" >> "vs_core_compositions" >> "infantry" >> _nameCommand, _spawnPos vectorAdd [0, 0]],
		"Command",
		["description", format ["1: 1IC@%1 1-Actual", _callsign ]]
	],
	[
		[configfile >> "CfgGroups" >> "Independent" >> "vs_core_compositions" >> "infantry" >> _nameZeus, _spawnPos vectorAdd [1, 2]],
		"Zeus",
		["description", format ["1: Zeus@%1", _zeusCallsign]]
	]
];

// Individual entities, such as arsenals and headless clients
_last = "";
{
	_entity = _x select 0;
	_attributeOne = _x select 1;
	_attributeTwo = _x select 2;
	_attributeThree = _x select 3;
	_current = create3DENEntity _entity, _current set3DENAttribute _attributeOne, _current set3DENAttribute _attributeTwo, _current set3DENAttribute _attributeThree;
	if ((_attributeTwo select 0) == "ArsenalObject") then {
		add3DENConnection ["Sync", [_last], _current];
		_last = _current;
	};
} forEach _entities;

// The main sections
_num = 1;
for "_i" from 1 to _numberOfSections do {
	create3DENComposition [configfile >> "CfgGroups" >> "Independent" >> "vs_core_compositions" >> "infantry" >> _nameSection, _spawnPos vectorAdd [_num, 0, 0]];
	set3DENAttributes [[get3DENSelected "Group", "groupID", format ["Shield %1", _i]], [get3DENSelected "Object", "ControlMP", true]];
	_group = get3DENselected "Object" select 0;
	_ix = 1;
	{
		_unitDisplayName = getText (configOf _x >> "displayName");
		if (_unitDisplayName == "IC" && !isFormationLeader _x) then {
			_x set3DENAttribute ["description", format ["%1: Team Leader", _ix]];
		} else {
			if (_x getUnitTrait "Medic") then {
				_x set3DENAttribute ["description", format ["%1: Combat Medic", _ix]];
			} else {
				if (_ix == 3 || _ix == 7) then {
					_x set3DENAttribute ["description", format ["%1: Specialist", _ix]];
				} else {
					_x set3DENAttribute ["description", format ["%1: Rifleman", _ix]];
				};

			};
		};
    _ix = _ix + 1;
	} forEach units _group;
	leader _group set3DENAttribute ["description", format ["1: Section Leader@%1 %2", _callsign, _i]];
	set3DENSelected [];
	_num = _num + 2;
};

// Command and Zeus
{
	_configPath = _x select 0;
	_attributeOne = _x select 1;
	_attributeTwo = _x select 2;
	create3DENComposition _configPath;
	set3DENAttributes [[get3DENSelected "Group", "groupID", _attributeOne], [get3DENSelected "Object", "ControlMP", true]];
	_groupComp = get3DENSelected "Object";
	_group = _groupComp select 0;
	if ((_attributeOne) == "Zeus") then {
		leader _group set3DENAttribute ["name", "zeusOne"];
		_asZeus = _groupComp select 1;
		_asZeus set3DENAttribute ["description", "2: A.Zeus"];
		_asZeus set3DENAttribute ["name", "zeusTwo"];
	} else {
		{
			_unitDisplayName = getText (configOf _x >> "displayName");
			if (_unitDisplayName == "IC" && !isFormationLeader _x) then {
				_x set3DENAttribute ["description", "2: 2IC"];
			} else {
				if (_x getUnitTrait "Medic") then {
					_x set3DENAttribute ["description", "3: Surgeon"];
					_x set3DENAttribute ["init", "this setVariable ['ace_medical_medicClass', 2, true];"];
				} else {
					_x set3DENAttribute ["description", "4: Specialist"];
				};
			};
		} forEach units _group;
	};
	leader _group set3DENAttribute _attributeTwo;
	set3DENSelected [];
} forEach _sections;

{
	private _unitDisplayName = getText (configOf _x >> "displayName");
	if (_unitDisplayName == "Surgeon" || typeOf _x == "BAPMC_Surgeon")
	    then {
			_x set3DENAttribute ["init", "this setVariable ['ace_medical_medicClass', 2, true];"];
		};
} forEach allUnits;

// Initialize vehicle position counter
_numIFV = _num;

// Spawn crewed vehicle crews
for "_i" from 1 to _ifvCrew do {
    create3DENComposition [
        configfile >> "CfgGroups" >> "Independent" >> "vs_core_compositions" >> "infantry" >> _nameVic,
        _spawnPos vectorAdd [_numIFV, 0, 0]
    ];
    set3DENAttributes [
        [get3DENSelected "Group", "groupID", format ["Guardian-%1 Crew", _i]],
        [get3DENSelected "Object", "ControlMP", true]
    ];
    _group = get3DENSelected "Object" select 0;
    // Get all units in the group
    _units = units _group;
    _leader = leader _group;
    // Set description for the leader (Commander)
    _leader set3DENAttribute ["description", format ["1: Commander@Guardian %1", _i]];
    // Remove leader from units array to get the other units
    _otherUnits = _units - [_leader];
    // Assign descriptions to other units
    if (count _otherUnits >= 1) then {
        (_otherUnits select 0) set3DENAttribute ["description", "2: Driver"];
    };
    if (count _otherUnits >= 2) then {
        (_otherUnits select 1) set3DENAttribute ["description", "3: Gunner"];
    };
    set3DENSelected [];
    _numIFV = _numIFV + 2;
};

// Initialize vehicle position counter
_numTank = _numIFV;

// Spawn crewed vehicle crews
for "_i" from 1 to _tankCrew do {
    create3DENComposition [
        configfile >> "CfgGroups" >> "Independent" >> "vs_core_compositions" >> "infantry" >> _nameVic,
        _spawnPos vectorAdd [_numTank, 0, 0]
    ];
    set3DENAttributes [
        [get3DENSelected "Group", "groupID", format ["Titan-%1 Crew", _i]],
        [get3DENSelected "Object", "ControlMP", true]
    ];
    _group = get3DENSelected "Object" select 0;
    // Get all units in the group
    _units = units _group;
    _leader = leader _group;
    // Set description for the leader (Commander)
    _leader set3DENAttribute ["description", format ["1: Commander@Titan %1", _i]];
    // Remove leader from units array to get the other units
    _otherUnits = _units - [_leader];
    // Assign descriptions to other units
    if (count _otherUnits >= 1) then {
        (_otherUnits select 0) set3DENAttribute ["description", "2: Driver"];
    };
    if (count _otherUnits >= 2) then {
        (_otherUnits select 1) set3DENAttribute ["description", "3: Gunner"];
    };
    set3DENSelected [];
    _numTank = _numTank + 2;
};

// Initialize helicopter position counter
_numHelicopter = _numTank;

// Spawn helicopter crews
for "_i" from 1 to _helicopters do {
    create3DENComposition [
        configfile >> "CfgGroups" >> "Independent" >> "VS_Core_compositions" >> "infantry" >> _nameHelicopter,
        _spawnPos vectorAdd [_numHelicopter, 0, 0]
    ];
    set3DENAttributes [
        [get3DENSelected "Group", "groupID", format ["Chariot %1", _i]],
        [get3DENSelected "Object", "ControlMP", true]
    ];
    _group = get3DENSelected "Object" select 0;
    // Get all units in the group
    _units = units _group;
    _leader = leader _group;
    // Set description for the leader (Helicopter Pilot)
    _leader set3DENAttribute ["description", format ["1: Pilot@Chariot %1", _i]];
    // Remove leader from units array to get the other units
    _otherUnits = _units - [_leader];
    // Assign description "Helicopter Crew" to other units
    _crewIndex = 2;
    {
        _x set3DENAttribute ["description", format ["%1: Crew", _crewIndex]];
        _crewIndex = _crewIndex + 1;
    } forEach _otherUnits;
    set3DENSelected [];
    _numHelicopter = _numHelicopter + 2;
};


// Initialize gunship position counter
_numGunship = _numHelicopter;

// Spawn gunship crews
for "_i" from 1 to _gunships do {
    create3DENComposition [
        configfile >> "CfgGroups" >> "Independent" >> "VS_Core_compositions" >> "infantry" >> _nameGunship,
        _spawnPos vectorAdd [_numGunship, 0, 0]
    ];
    set3DENAttributes [
        [get3DENSelected "Group", "groupID", format ["Hydra  %1", _i]],
        [get3DENSelected "Object", "ControlMP", true]
    ];
    _group = get3DENSelected "Object" select 0;
    // Get all units in the group
    _units = units _group;
    _leader = leader _group;
    // Set description for the leader (Gunship Pilot)
    _leader set3DENAttribute ["description", format ["1: Pilot@Hydra  %1", _i]];
    // Remove leader from units array to get the other units
    _otherUnits = _units - [_leader];
    // Assign description "Crew" to other units
    _crewIndex = 2;
    {
        _x set3DENAttribute ["description", format ["%1: Crew", _crewIndex]];
        _crewIndex = _crewIndex + 1;
    } forEach _otherUnits;
    set3DENSelected [];
    _numGunship = _numGunship + 2;
};


// Initialize plane position counter
_numPlane = _numGunship;

// Spawn plane crews
for "_i" from 1 to _planes do {
    create3DENComposition [
        configfile >> "CfgGroups" >> "Independent" >> "VS_Core_compositions" >> "infantry" >> _namePlane,
        _spawnPos vectorAdd [_numPlane, 0, 0]
    ];
    set3DENAttributes [
        [get3DENSelected "Group", "groupID", format ["Hermes %1", _i]],
        [get3DENSelected "Object", "ControlMP", true]
    ];
    _group = get3DENSelected "Object" select 0;
    // Get all units in the group
    _units = units _group;
    _leader = leader _group;
    // Set description for the leader (Plane Pilot)
    _leader set3DENAttribute ["description", format ["1: Pilot@Hermes %1", _i]];
    // Remove leader from units array to get the other units
    _otherUnits = _units - [_leader];
    // Assign description "Crew" to other units
    _crewIndex = 2;
    {
        _x set3DENAttribute ["description", format ["%1: Crew", _crewIndex]];
        _crewIndex = _crewIndex + 1;
    } forEach _otherUnits;
    set3DENSelected [];
    _numPlane = _numPlane + 2;
};

// Initialize jet position counter
_numJet = _numPlane;

// Spawn jet pilots
for "_i" from 1 to _jets do {
    create3DENComposition [
        configfile >> "CfgGroups" >> "Independent" >> "VS_Core_compositions" >> "infantry" >> _nameJet,
        _spawnPos vectorAdd [_numJet, 0, 0]
    ];
    set3DENAttributes [
        [get3DENSelected "Group", "groupID", format ["Icarus  %1", _i]],
        [get3DENSelected "Object", "ControlMP", true]
    ];
    _group = get3DENSelected "Object" select 0;
    // Set description for the leader (Jet Pilot)
    leader _group set3DENAttribute ["description", format ["1: Pilot@Icarus  %1", _i]];
    set3DENSelected [];
    _numJet = _numJet + 2;
};

// Default Loadouts
if (_createDefaults) then {
    create3DENComposition [configfile >> "CfgGroups" >> "Independent" >> "vs_core_compositions" >> "infantry" >> _nameDefaults, _spawnPos vectorAdd [_numJet + 2, 3, 0]];
    set3DENAttributes [[get3DENSelected "Group", "groupID", "Default Loadouts"], [get3DENSelected "Object", "vs_cORE_3den_Loadout", true]];
    _groupComp = get3DENSelected "Object";
    {
        _unitDisplayName = getText (configOf _x >> "displayName");
        _x set3DENAttribute ["vs_cORE_3den_LoadoutName", _unitDisplayName];
    } forEach _groupComp;
    set3DENSelected [];
};

// Adjust medic class for surgeons
{
    private _unitDisplayName = getText (configOf _x >> "displayName");
    if (_unitDisplayName == "Surgeon" || typeOf _x == "BAPMC_Surgeon") then {
        _x set3DENAttribute ["init", "this setVariable ['ace_medical_medicClass', 2, true];"];
    };
} forEach allUnits;
