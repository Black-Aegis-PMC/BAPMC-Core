#include "..\gui\defines.hpp"

params [["_ctrl",controlNull]];

if !([] call VS_Core_admin_messages_fnc_isAdminOrZeus) exitWith {};

_ctrl ctrlSetPosition [VS_CORE_ADMIN_MESSAGES_TITLE_X,VS_CORE_ADMIN_MESSAGES_SENDBUTTON_Y_2];
_ctrl ctrlCommit 0;
