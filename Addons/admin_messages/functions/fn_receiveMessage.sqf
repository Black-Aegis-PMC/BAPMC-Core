params ["_sender","_UID","_message",["_receiveCondition",{[] call VS_Core_admin_messages_fnc_isAdminOrZeus}],["_receiveConditionParams",[]]];

if !(hasInterface) exitWith {};
if !(_receiveConditionParams call _receiveCondition) exitWith {};
if (profileName == _sender) exitWith {};

if (isNil "VS_Core_admin_messages_latestConvos") then {VS_Core_admin_messages_latestConvos = []};
if (VS_Core_admin_messages_latestConvos find [toUpper _sender,_UID] < 0) then {
	reverse VS_Core_admin_messages_latestConvos;
	VS_Core_admin_messages_latestConvos pushBack [toUpper _sender,_UID];
	reverse VS_Core_admin_messages_latestConvos;
};
if (count VS_Core_admin_messages_latestConvos > 5) then {VS_Core_admin_messages_latestConvos resize 5};

[_sender,_message] call VS_Core_admin_messages_fnc_displayMessage;

playSound "3DEN_notificationWarning";
