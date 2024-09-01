class Extended_PostInit_EventHandlers {
	class VS_Core_admin_messages {
		serverInit = "call compile preprocessFileLineNumbers '\x\VS_C\admin_messages\XEH_postInit.sqf'";
	};
};

class Extended_PreInit_EventHandlers {
	class VS_Core_admin_messages {
		clientInit = "call compile preprocessFileLineNumbers '\x\VS_C\admin_messages\XEH_preClientInit.sqf'";
	};
};
