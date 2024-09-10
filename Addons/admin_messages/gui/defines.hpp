#define VS_CORE_ADMIN_MESSAGES_IDC_SENDBUTTON		33500
#define VS_CORE_ADMIN_MESSAGES_IDC_CUSTOMCHATTEXT	33601

#define VS_CORE_ADMIN_MESSAGES_UISIZESMALL		0.55
#define VS_CORE_ADMIN_MESSAGES_UISCALE			((getResolution select 5)/VS_CORE_ADMIN_MESSAGES_UISIZESMALL)

#define VS_CORE_ADMIN_MESSAGES_SCALEFACTOR_Y		((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)
#define VS_CORE_ADMIN_MESSAGES_SCALESUMMAND_Y	(safezoneY)

#define VS_CORE_ADMIN_MESSAGES_SCALEFACTOR_X		(((safezoneW / safezoneH) min 1.2) / 40)
#define VS_CORE_ADMIN_MESSAGES_SCALESUMMAND_X	(safezoneX)

#define VS_CORE_ADMIN_MESSAGES_SPACER_Y			(0.1 * VS_CORE_ADMIN_MESSAGES_SCALEFACTOR_Y)

#define VS_CORE_ADMIN_MESSAGES_TITLE_Y			(1 * VS_CORE_ADMIN_MESSAGES_SCALEFACTOR_Y + VS_CORE_ADMIN_MESSAGES_SCALESUMMAND_Y)
#define VS_CORE_ADMIN_MESSAGES_TITLE_X			(1 * VS_CORE_ADMIN_MESSAGES_SCALEFACTOR_X + VS_CORE_ADMIN_MESSAGES_SCALESUMMAND_X)

#define VS_CORE_ADMIN_MESSAGES_ELEMENT_H			(1 * VS_CORE_ADMIN_MESSAGES_SCALEFACTOR_Y)
#define VS_CORE_ADMIN_MESSAGES_TOTAL_W			(15 * VS_CORE_ADMIN_MESSAGES_SCALEFACTOR_X)

#define VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y		(VS_CORE_ADMIN_MESSAGES_TITLE_Y + VS_CORE_ADMIN_MESSAGES_ELEMENT_H + VS_CORE_ADMIN_MESSAGES_SPACER_Y)
#define VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_H		((8 * VS_CORE_ADMIN_MESSAGES_ELEMENT_H) / VS_CORE_ADMIN_MESSAGES_UISCALE)

#define VS_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_Y	((0.5 * VS_CORE_ADMIN_MESSAGES_ELEMENT_H) / VS_CORE_ADMIN_MESSAGES_UISCALE)
#define VS_CORE_ADMIN_MESSAGES_EDITBOX_H			(VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_H - 2 * VS_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_Y)
#define VS_CORE_ADMIN_MESSAGES_EDITBOX_Y			(VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y + VS_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_Y)

#define VS_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_X	(0.5 * (((safezoneW / safezoneH) min 1.2) / 40))
#define VS_CORE_ADMIN_MESSAGES_EDITBOX_X			(VS_CORE_ADMIN_MESSAGES_TITLE_X + VS_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_X)
#define VS_CORE_ADMIN_MESSAGES_EDITBOX_W			(VS_CORE_ADMIN_MESSAGES_TOTAL_W - 2 * VS_CORE_ADMIN_MESSAGES_EDITBOX_PADDING_X)

#define VS_CORE_ADMIN_MESSAGES_SENDBUTTON_Y		(VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y + VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_H + VS_CORE_ADMIN_MESSAGES_SPACER_Y)
#define VS_CORE_ADMIN_MESSAGES_SENDBUTTON_Y_2	(VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_Y + VS_CORE_ADMIN_MESSAGES_EDITBOX_BG_H + 2*VS_CORE_ADMIN_MESSAGES_SPACER_Y + VS_CORE_ADMIN_MESSAGES_ELEMENT_H)