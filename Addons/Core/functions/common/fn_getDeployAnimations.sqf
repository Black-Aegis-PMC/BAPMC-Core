/* ----------------------------------------------------------------------------
Function: vs_core_fnc_getDeployAnimations

Description:
	Adds custom ACE interaction to deploy components for vehicles, such as
	a tank's Camonet, Slat Armour Cover, etc.

Parameters:
	0: _vehicle - vehicle object in question, or it's classname <STRING|OBJECT>
	1: _player
	2: _parameters

Returns:
	ACE Actions to insert as children. Sub-array index: <ARRAY>
		0: Animation Config Path <CONFIG>
		1: className <STRING>
		2: displayName <STRING>

Examples:
	[_vehicle] call vs_core_fnc_getDeployAnimations;

Author:
	Arend
License GPL-2.0
---------------------------------------------------------------------------- */
params [["_vehicle", "", ["", objNull]]];

private _vehicleClass = _vehicle;

if (_vehicle isEqualType objNull) then {
	_vehicleClass = typeOf _vehicle;
};
private _vehicleConfig = configFile >> "CfgVehicles" >> _vehicleClass;

[format["Received data: %1, %2, %3", _vehicle, _vehicleClass, _vehicleConfig], "core\functions\common\fn_getDeployAnimations.sqf"] call vs_core_fnc_log;

private _animationClasses = configProperties [
	(_vehicleConfig >> "AnimationSources"),
	'isClass _x && !(getText (_x >> "displayName") isEqualTo "") && getText (_x >> "source") isEqualTo "user"',
	true
];

// private _animationClassnames = ((_vehicleConfig >> "AnimationSources") call BIS_fnc_getCfgSubClasses) select {
// 	!(getText (_vehicleConfig >> "AnimationSources" >> _x >> "displayName") isEqualTo "")
// 	&& getText (_vehicleConfig >> "AnimationSources" >> _x >> "source") isEqualTo "user";
// };
// [format["Checking Config: %1", _animationClasses], "core\functions\common\fn_getDeployAnimations.sqf"] call vs_core_fnc_log;

private _animations = [];

{
	_animations pushBack [
		_x,
		configName _x,
		getText (_x >> "displayName")
	];
} forEach _animationClasses;

_animations;
