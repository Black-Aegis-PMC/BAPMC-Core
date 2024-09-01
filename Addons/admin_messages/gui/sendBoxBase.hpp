class RscText;
class RscTitle;
class RscEdit;
class RscButtonMenu;
class RscCombo;

class VS_Core_admin_messages_sendBoxTitleBase: RscTitle {
	idc = -1;
	style = 0;

	onLoad = "_this call VS_Core_admin_messages_fnc_setTitle";

	text = "ERROR ";
	colorBackground[] = {
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
	};

	x = VS_CORE_ADMIN_MESSAGES_TITLE_X;
	y = VS_CORE_ADMIN_MESSAGES_TITLE_Y;
	w = VS_CORE_ADMIN_MESSAGES_TOTAL_W;
	h = VS_CORE_ADMIN_MESSAGES_ELEMENT_H;
};

class VS_Core_admin_messages_sendBoxBGBase: RscText {
	idc = -1;

	colorBackground[] = {0, 0, 0, 0.700000};

	x = VS_CORE_ADMIN_MESSAGES_TITLE_X;
	y = VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y;
	w = VS_CORE_ADMIN_MESSAGES_TOTAL_W;
	h = VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_H;
};

class VS_Core_admin_messages_sendBoxBase: RscEdit {
	idc = -1;
	style = 16;

	autocomplete = "";
	shadow = 0;
	font = "EtelkaMonospacePro";
	sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

	onLoad = "uiNamespace setVariable [""VS_Core_admin_messages_sendBoxCtrl"",(_this select 0)]";
	onUnLoad = "uiNamespace setVariable [""VS_Core_admin_messages_sendBoxCtrl"",nil]";

	onKeyDown = "if ((_this select 1) isEqualTo 28 && !(_this select 2) && !(_this select 3) && !(_this select 4)) then {call VS_Core_admin_messages_fnc_sendMessage;};";

	x = VS_CORE_ADMIN_MESSAGES_EDITBOX_X;
	y = VS_CORE_ADMIN_MESSAGES_EDITBOX_Y;
	w = VS_CORE_ADMIN_MESSAGES_EDITBOX_W;
	h = VS_CORE_ADMIN_MESSAGES_EDITBOX_H;
};

class VS_Core_admin_messages_sendBoxButtonBase: RscButtonMenu {
	idc = VS_CORE_ADMIN_MESSAGES_IDC_SENDBUTTON;

	onLoad = "uiNamespace setVariable [""VS_Core_admin_messages_sendBoxButtonCtrl"",(_this select 0)]; _this call VS_Core_admin_messages_fnc_setSendButtonPosition";
	onUnLoad = "uiNamespace setVariable [""VS_Core_admin_messages_sendBoxButtonCtrl"",nil]";

	text = "$STR_VS_CORE_ADMIN_MESSAGES_SENDBOXBUTTON";
	action = "call VS_Core_admin_messages_fnc_sendMessage";

	x = VS_CORE_ADMIN_MESSAGES_TITLE_X;
	y = VS_CORE_ADMIN_MESSAGES_SENDBUTTON_Y;
	w = VS_CORE_ADMIN_MESSAGES_TOTAL_W;
	h = VS_CORE_ADMIN_MESSAGES_ELEMENT_H;
};

class VS_Core_admin_messages_sendBoxListboxBase: RscCombo {
	idc = -1;

	font = "EtelkaMonospacePro";
	rowHeight = 10;
	/*sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";*/

	onLoad = "uiNamespace setVariable [""VS_Core_admin_messages_sendBoxListboxCtrl"",(_this select 0)]; _this call VS_Core_admin_messages_fnc_initListbox";
	onUnLoad = "uiNamespace setVariable [""VS_Core_admin_messages_sendBoxListboxCtrl"",nil]";
	onLBSelChanged = "_this call VS_Core_admin_messages_fnc_onRecipientChanged";

	x = VS_CORE_ADMIN_MESSAGES_TITLE_X;
	y = VS_CORE_ADMIN_MESSAGES_SENDBUTTON_Y;
	w = VS_CORE_ADMIN_MESSAGES_TOTAL_W;
	h = VS_CORE_ADMIN_MESSAGES_ELEMENT_H;
};
