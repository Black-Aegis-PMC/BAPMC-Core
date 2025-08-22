/*
License GPL-2.0
*/
[] spawn {
	// Suspend the script until the required CBA Settings are available
	waitUntil {
		sleep 0.5;
		!(isNil "cba_settings_ready")
	};

	// Server-side logic to handle loadouts
	if (isServer) then {
		_loadoutUnits = allUnits select {_x getVariable ["VS_core_isLoadout", false]};
		VS_core_loadouts = [];
		{
			_role = _x getVariable "VS_core_loadout_role";
			VS_core_loadouts pushBack [_role, getUnitLoadout _x];
			deleteVehicle _x;
		} forEach _loadoutUnits;
		publicVariable "VS_core_loadouts";
		[VS_core_loadouts] remoteExec ["VS_core_fnc_setDefaultLoadouts", 0, true];
	};
};

//make units doctors
{
    [_x] call vs_core_fnc_makeDoctor;
} forEach allUnits;

// Add event handler to handle new units spawned during the mission
addMissionEventHandler ["EntityCreated", {
    params ["_entity"];
    if (_entity isKindOf "Man") then {
        [_entity] call vs_core_fnc_makeDoctor;
    };
}];

[{isClass (configFile >> "CfgPatches" >> "zen_custom_modules")},{
	["Viking Studios Modules", "Add Barracks Functions",
	{
		// Array of position AGLS, ObjNull or the object under the module as it's placed
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

		[_position, _objectUnderCursor] call VS_core_fnc_addBarracks;
	}] call zen_custom_modules_fnc_register;

	["Viking Studios Modules", "Force Respawn All",
	{
		[] call VS_core_fnc_forceRespawn;
	}] call zen_custom_modules_fnc_register;

	["ZEN loaded successfully", "core\XEH_preInit.sqf"] call VS_core_fnc_log;
}, [], 120, {
	["ZEN not loaded in time!", "core\XEH_preInit.sqf"] call VS_core_fnc_log;
}] call CBA_fnc_waitUntilAndExecute;


[{isClass (configFile >> "CfgPatches" >> "klpq_musicRadio") && isClass (configFile >> "CfgPatches" >> "zen_custom_modules")},{
	["Viking Studios Modules", "Add Music Radio",
	{
		// Array of position AGLS, ObjNull or the object under the module as it's placed
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

		[_position, _objectUnderCursor] call VS_core_fnc_addMusicRadio;
	}] call zen_custom_modules_fnc_register;

	["KLPQ Music Player loaded successfully", "core\XEH_preInit.sqf"] call VS_core_fnc_log;
}, [], 120, {
	["KLPQ Music Player not loaded in time!", "core\XEH_preInit.sqf"] call VS_core_fnc_log;
}] call CBA_fnc_waitUntilAndExecute;

// Export the mission setting into the CBA Setting on mission start
if (
	isServer
	&& (["VS_core_respawn_timer", "mission"] call CBA_settings_fnc_get) isEqualTo (["VS_core_respawn_timer", "default"] call CBA_settings_fnc_get)
	&& typeName (getMissionConfigValue "respawnDelay") == "SCALAR"
) then {
	[getMissionConfigValue "respawnDelay"] call VS_core_fnc_setRespawnTimer;
};

player addEventHandler ["Killed", {
	params ["_player"];

	private _curators = call VS_core_fnc_getCurators;
	if (_player in _curators) exitWith { // If zeus, instantly respawn
		[] spawn {
			setPlayerRespawnTime 0;
			sleep 2;
			setPlayerRespawnTime VS_core_respawn_timer;
		};
	};

	setPlayerRespawnTime VS_core_respawn_timer;

	[format["%1 just died!", name _player]] remoteExec ["VS_core_fnc_notifyZeus", _curators];
	_player setVariable ["VS_core_diedAt", serverTime, true];
	[format["%1 died at: %2", name _player, _player getVariable "VS_core_diedAt"], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
}];

player addEventHandler ["Respawn", {
	params ["_player", "_corpse"];

	[["%1 has just respawned!", name _player], "warning"] remoteExec ["VS_core_fnc_notifyZeus", call VS_core_fnc_getCurators];
	[format["%1 respawned at: %2. Died at: %3", name _player, serverTime, _player getVariable "VS_core_diedAt"], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
}];

// Pass magazine keybinding
[
	"Viking Studios",
	"VS_core_passMagazine",
	["Pass magazine", "Pass a magazine to the person you're looking at"],
	{
		private _target = cursorTarget;
		if (
			_target isKindOf "CAManBase"
			&& {[ACE_player, _target, primaryWeapon ACE_player] call ace_interaction_fnc_canPassMagazine}
			&& ACE_player distance _target < 4
		) then {
			[format["%1 passed a magazine", name ACE_player], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
			[ACE_player, _target, primaryWeapon ACE_player] call ace_interaction_fnc_passMagazine;
			playSound "ace_overheating_fixing_pistol";
			hint "Magazine passed!";
		};
	},
	'',
	[0x13, [false, false, true]], // Alt+R
	false,
	0,
	true
] call CBA_fnc_addKeybind;

[{isClass (configFile >> "CfgPatches" >> "tfar_core")},{
	// TFAR Direct Speech Volume Change
	[
		"Viking Studios",
		"VS_core_increaseSpeakVolume",
		["Increase Direct Speech Volume", "Use this to increase direct speech volume until ""Yelling"""],
		{
			[true] call VS_core_fnc_changeSpeakVolume;
		},
		'',
		[0xF8, [false, false, true]] // Alt + Mouse wheel Up
	] call CBA_fnc_addKeybind;

	[
		"Viking Studios",
		"VS_core_decreaseSpeakVolume",
		["Decrease Direct Speech Volume", "Use this to decrease direct speech volume until ""Whisper"""],
		{
			[false] call VS_core_fnc_changeSpeakVolume;
		},
		'',
		[0xF9, [false, false, true]] // Alt + Mouse wheel Down
	] call CBA_fnc_addKeybind;
}, [], 20, {
	["TFAR is not loaded!", "core\XEH_postInit.sqf"] call VS_core_fnc_log;
}] call CBA_fnc_waitUntilAndExecute;


// Reduce the map volume
addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

	if (_mapIsOpened) then {

		VS_core_restoredVolume = missionNamespace getVariable ["acex_volume_initialGameVolume", soundVolume];

		// If player is not in a vehicle, then forget about it!
		if (vehicle player == player) exitWith {};

		ace_hearing_disableVolumeUpdate = true;
		0.1 fadeSound VS_core_map_volume;
		["Lowered volume in map", "core\XEH_postInit.sqf"] call VS_core_fnc_log;

	} else {

		if (isNil "acex_volume_isLowered") then {
			ace_hearing_disableVolumeUpdate = false;

			0.1 fadeSound VS_core_restoredVolume;
			[format["Restored volume from map to %1", VS_core_restoredVolume], "core\XEH_postInit.sqf"] call VS_core_fnc_log;

		} else {

			if (acex_volume_isLowered) then {
				call acex_volume_fnc_lowerVolume;
				["Going back to ACEX lowered volume", "core\XEH_postInit.sqf"] call VS_core_fnc_log;
			} else {

				if (soundVolume != acex_volume_initialGameVolume) then {
					call acex_volume_fnc_restoreVolume;
					["Letting ACEX restore volume", "core\XEH_postInit.sqf"] call VS_core_fnc_log;
				};
			};
		};
	};
}];


/**
 * Interact with civilians using gestures
 *
 * Possible gestures:
 * - Freeze:		`ace_gestures_Freeze`
 * - Cover:			`ace_gestures_Cover`
 * - Forward:		`ace_gestures_Forward`
 * - Regroup:		`ace_gestures_Regroup`
 * - Engage:		`ace_gestures_Engage`
 * - Point:			`ace_gestures_Point`
 * - Hold:			`ace_gestures_Hold`
 * - Warning:		`ace_gestures_Warning`
 *
 * - Go:			`gestureGo`
 * - Advance:		`gestureAdvance`
 * - Follow:		`gestureFollow`
 * - Up:			`gestureUp`
 * - Stop:			`gestureFreeze`
 * - Cease Fire:	`gestureCeaseFire`
 *
 * All gestures with `ace_gestures_[x]` have a second stance
 * `ace_gestures_[x]StandLowered` for when the player is standing with a
 * lowered weapon, or without one!
 */
["ace_common_playActionNow", {
	params ["_player", "_gesture"];

	// If it's not a player, don't do anything
	if !(isPlayer _player) exitWith {};

	// The percentage chance a civilian will listen
	private _chance = [0.5, 0.8] select (count weapons _player > 0);
	private _acceptedGestures = [];

// Commands affecting units within angle sector

	// Stop!
	_acceptedGestures = [
		"gestureFreeze",
		"ace_gestures_Hold",
		"ace_gestures_HoldStandLowered",
		"ace_gestures_Freeze",
		"ace_gestures_FreezeStandLowered"
	];

	if ({_x == _gesture} count _acceptedGestures > 0) then {
		{
			if !(_x isEqualTo _player) then {
				if (count weapons _x == 0 && {random 1 < _chance}) then {
					if ([position _player, getDir _player, 30, position _x] call BIS_fnc_inAngleSector) then {
						if (vehicle _x == _x) then {
							// In case unit is following someone
							_x setVariable ["VS_core_following", nil, true];

							[format["%1 told %2 to stop with a %3 gesture", _player, _x, _gesture], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
							doStop _x;
							false;
						} else {
							[format["%1 detected %2 in a vehicle for stop gesture", _player, _x, _gesture], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
							if (effectiveCommander (vehicle _x) isEqualTo _x) then {
								// In case unit is following someone
								_x setVariable ["VS_core_following", nil, true];

								[format["%1 told %2 to stop with a %3 gesture", _player, _x, _gesture], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
								doStop _x;
								false;
							};
						};
					};
				};
			};
		} count ((entities [["Man"], [], true, true]) inAreaArray [position _player, 50, 50]);
	};

	// Go away!
	_acceptedGestures = [
		"gestureGo",
		"gestureAdvance",
		"ace_gestures_Forward",
		"ace_gestures_ForwardStandLowered",
		"ace_gestures_Engage",
		"ace_gestures_EngageStandLowered"
	];

	if ({_x == _gesture} count _acceptedGestures > 0) then {
		// Source: https://github.com/acemod/ACE3/blob/master/addons/interaction/functions/fnc_sendAway.sqf
		// Extracted from source to avoid an infinite loop caused by line 23 in source
		{
			if (count weapons _x == 0 && {random 1 < _chance}) then {
				if ([position _player, getDir _player, 40, position _x] call BIS_fnc_inAngleSector) then {
					[format["%1 told %2 to go away with a %3 gesture", _player, _x, _gesture], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
					// In case unit is following someone
					_x setVariable ["VS_core_following", nil, true];

					private _position = getPosASL _player vectorAdd (eyeDirection _player vectorMultiply 50);
					_position set [2, 0];

					["ace_interaction_sendAway", [_x, _position], [_x]] call CBA_fnc_targetEvent;
				};
			};
			false;
		} count (_player nearEntities ["Man", 10]);
	};

// Commands affecting units only under cursor
	private _target = cursorTarget;
	if !(_target isKindOf "Man") exitWith {};

	// Follow!
	_acceptedGestures = ["gestureFollow"];

	if ({_x == _gesture} count _acceptedGestures > 0 && _player distance _target < 10) then {

		if (count weapons _target == 0 && {random 1 < _chance}) then {
		[format["%1 told %2 to follow using a %3 gesture", _player, _target, _gesture], "core\XEH_postInit.sqf"] call VS_core_fnc_log;

			private _following = [_target, _player] spawn {
				params ["_target", "_player"];
				_target setVariable ["VS_core_following", _player, true];

				[format["%1 about to move to %2 (%3)", _target, _player, _target getVariable ["VS_core_following", "nothing"]], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
				private _playerPosition = [];
				private _index = 0;

				while {(_target getVariable ["VS_core_following", false]) isEqualTo _player} do {
					if (_index > 30) exitWith {
						_target setVariable ["VS_core_following", nil, true];
					};

					if !(_playerPosition isEqualTo (getPosASL _player)) then {
						[format["%1 moving", _target], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
						_target doMove (getPosASL _player vectorDiff (vectorDir _player vectorMultiply 4));
						_playerPosition = getPosASL _player;
					};

					sleep 2;
					_index = 1 + _index;
				};
			};

		};
	};


	// Hi there!
	_acceptedGestures = [
		"ace_gestures_Cover",
		"ace_gestures_CoverStandLowered",
		"ace_gestures_Warning",
		"ace_gestures_WarningStandLowered"
	];

	if ({_x == _gesture} count _acceptedGestures > 0) then {
		if (
			[position _target, getDir _target, 120, position _player] call BIS_fnc_inAngleSector
			&& ((side group _target) getFriend (side group _player)) > 0.6 // Is friendly-ish?
		) then {
			[format["%1 waved at %2 with a %3 gesture", _player, _target, _gesture], "core\XEH_postInit.sqf"] call VS_core_fnc_log;
			[_target, _player] spawn {
				_target = _this select 0;
				sleep 1;
				[_target, "ace_gestures_WarningStandLowered"] call ace_common_fnc_doGesture;
			};
		};
	};
}] call CBA_fnc_addEventHandler;
