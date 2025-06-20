class BAPMC_Mavik_Base: UAV_01_base_F
	{
		features = "Randomization: No						<br />Camo selections: 1 - the whole body						<br />Script door sources: None						<br />Script animations: None						<br />Executed scripts: None						<br />Firing from vehicles: No						<br />Slingload: No						<br />Cargo proxy indexes: None";
		author = "Amateur-God";
		mapSize = 4;
		class SpeechVariants
		{
			class Default
			{
				speechSingular[] = {"veh_air_UAV_s"};
				speechPlural[] = {"veh_air_UAV_p"};
			};
		};
		textSingular = "$STR_A3_nameSound_veh_air_UAV_s";
		textPlural = "$STR_A3_nameSound_veh_air_UAV_p";
		nameSound = "veh_air_UAV_s";
		_generalMacro = "mavic_drone_base_F";
		editorSubcategory = "EdSubcat_Drones";
		scope = 0;
		displayName = "$STR_A3_CfgVehicles_UAV_01_base0";
		isUav = 1;
		uavCameraDriverPos = "pip_pilot_pos";
		uavCameraDriverDir = "pip_pilot_dir";
		uavCameraGunnerPos = "pos_pilotcamera";
		uavCameraGunnerDir = "pos_pilotcamera_dir";
		memoryPointDriverOptics = "pos_pilotcamera";
		driverOpticsModel = "\mavik\mavik_hud.p3d";
		GunnerOpticsModel = "\mavik\mavik_hud.p3d";
		driverForceOptics = 1;
		extCameraPosition[] = {0,-0.25,-2.35};
		extCameraParams[] = {0.93,10,30,0.25,1,10,30,0,1};
		formationX = 10;
		formationZ = 10;
		memoryPointTaskMarker = "TaskMarker_1_pos";
		disableInventory = 1;
		unitInfoType = "RscUnitInfoNoWeapon";
		unitInfoTypeRTD = "RscUnitInfoNoWeapon";
		driverWeaponsInfoType = "RscOptics_Offroad_01";
		getInRadius = 0;
		damageEffect = "UAVDestructionEffects";
		damageTexDelay = 0.5;
		dustEffect = "UAVDust";
		waterEffect = "UAVWater";
		washDownDiameter = "10.0f";
		washDownStrength = "0.25f";
		killFriendlyExpCoef = 0.1;
		accuracy = 1.5;
		camouflage = 0.5;
		audible = 0.1;
		armor = 0.5;
		cost = 20000;
		altFullForce = 1000;
		altNoForce = 2000;
		epeImpulseDamageCoef = 5;
		fuelExplosionPower = 0;
		vehicleClass = "Autonomous";
		model = "\mavik\mavik3.p3d";
		icon = "\A3\Drones_F\Air_F_Gamma\UAV_01\Data\UI\Map_UAV_01_CA.paa";
		picture = "\A3\Drones_F\Air_F_Gamma\UAV_01\Data\UI\UAV_01_CA.paa";
		class Reflectors{};
		class MarkerLights
		{
			class NavGreen
			{
				activeLight = 0;
				name = "nav_green";
				color[] = {0,1,0};
				ambient[] = {0,0.1,0};
				size = 0.2;
				drawLight = 1;
				drawLightSize = 0.05;
				flareSize = 0.3;
				intensity = 500;
				useFlare = 1;
				dayLight = 1;
				blinking = "false";
			};
			class NavGreenB: NavGreen
			{
				activeLight = 0;
				name = "nav_greenB";
				color[] = {0,1,0};
				ambient[] = {0,0.1,0};
				size = 0.2;
				drawLight = 1;
				drawLightSize = 0.05;
				flareSize = 0.3;
				intensity = 500;
				useFlare = 1;
				dayLight = 1;
				blinking = "true";
			};
			class NavRED: NavGreen
			{
				name = "nav_redB";
				color[] = {1,0,0};
				drawLight = 1;
				drawLightCenterSize = 0.01;
				ambient[] = {0.1,0,0};
			};
		};
		startDuration = 3;
		maxSpeed = 100;
		precision = 15;
		steerAheadSimul = 0.5;
		steerAheadPlan = 0.7;
		predictTurnPlan = 2;
		predictTurnSimul = 1.5;
		liftForceCoef = 1;
		cyclicAsideForceCoef = 2;
		cyclicForwardForceCoef = 1.2;
		bodyFrictionCoef = 0.3;
		backRotorForceCoef = 5;
		fuelCapacity = 0.5;
		fuelConsumptionRate = 0.000277;
		maxFordingDepth = 0.3;
		threat[] = {0.1,0.1,0.1};
		maxMainRotorDive = 0;
		minMainRotorDive = 0;
		neutralMainRotorDive = 0;
		gearRetracting = 0;
		mainRotorSpeed = 7;
		backRotorSpeed = -7;
		mainBladeCenter = "rotor_center";
		mainBladeRadius = 0.35;
		tailBladeCenter = "rotor2_center";
		tailBladeRadius = 0.35;
		tailBladeVertical = 0;
		radarTargetSize = 0.1;
		visualTargetSize = 0.1;
		irTarget = 0;
		lockDetectionSystem = 0;
		incomingMissileDetectionSystem = 0;
		weapons[] = {};
		magazines[] = {};
		irScanRangeMin = 0;
		irScanRangeMax = 0;
		irScanToEyeFactor = 1;
		class TransportItems{};
		destrType = "DestructWreck";
		driverCompartments = "Compartment3";
		cargoCompartments[] = {"Compartment2"};
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"mavik\textures\body_co.paa"};
		selectionDamage = "damage";
		class Damage
		{
			tex[] = {};
			mat[] = {"A3\Drones_F\Air_F_Gamma\UAV_01\Data\UAV_01.rvmat","A3\Drones_F\Air_F_Gamma\UAV_01\Data\UAV_01_damage.rvmat","A3\Drones_F\Air_F_Gamma\UAV_01\Data\UAV_01_destruct.rvmat"};
		};
		class ViewPilot: ViewPilot
		{
			minFov = 0.25;
			maxFov = 0.8;
			initFov = 0.8;
			initAngleX = 0;
			minAngleX = -65;
			maxAngleX = 85;
			initAngleY = 0;
			minAngleY = -150;
			maxAngleY = 150;
		};
		class Viewoptics: ViewOptics
		{
			initAngleX = 0;
			minAngleX = 0;
			maxAngleX = 0;
			initAngleY = 0;
			minAngleY = 0;
			maxAngleY = 0;
			minFov = 0.25;
			maxFov = 0.8;
			initFov = 0.8;
			visionMode[] = {"Normal"};
			thermalMode[] = {0,1};
		};
		class MFD{};
		enableManualFire = 1;
		reportRemoteTargets = 1;
		reportOwnPosition = 1;
		attenuationEffectType = "OpenHeliAttenuation";
		soundGetIn[] = {"",1,1};
		soundGetOut[] = {"",1,1,50};
		soundEnviron[] = {"",0.031622775,1};
		soundDammage[] = {"",0.56234133,1};
		soundEngineOnInt[] = {"A3\Sounds_F\air\Uav_01\quad_start_full_int",0,2};
		soundEngineOnExt[] = {"A3\Sounds_F\air\Uav_01\quad_start_full_01",0.56234133,3,60};
		soundEngineOffInt[] = {"A3\Sounds_F\air\Uav_01\quad_stop_full_int",0,2};
		soundEngineOffExt[] = {"A3\Sounds_F\air\Uav_01\quad_stop_full_01",0.56234133,3,60};
		soundBushCollision1[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_1",1,1,10};
		soundBushCollision2[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_2",1,1,10};
		soundBushCollision3[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_bush_int_3",1,1,10};
		soundBushCrash[] = {"soundBushCollision1",0.33,"soundBushCollision2",0.33,"soundBushCollision3",0.33};
		soundWaterCollision1[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_water_ext_1",1,1,10};
		soundWaterCollision2[] = {"A3\Sounds_F\vehicles\crashes\helis\Heli_coll_water_ext_2",1,1,10};
		soundWaterCrashes[] = {"soundWaterCollision1",0.5,"soundWaterCollision2",0.5};
		Crash0[] = {"A3\Sounds_F\vehicles\crashes\cars\cars_coll_big_default_ext_1",1,1,90};
		Crash1[] = {"A3\Sounds_F\vehicles\crashes\cars\cars_coll_big_default_ext_2",1,1,90};
		Crash2[] = {"A3\Sounds_F\vehicles\crashes\cars\cars_coll_big_default_ext_3",1,1,90};
		Crash3[] = {"A3\Sounds_F\vehicles\crashes\cars\cars_coll_big_default_ext_4",1,1,90};
		soundCrashes[] = {"Crash0",0.25,"Crash1",0.25,"Crash2",0.25,"Crash3",0.25};
		class Sounds
		{
			class Engine
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\quad_engine_full_01",0.4466836,3,60};
				frequency = "rotorSpeed";
				volume = "camPos*((rotorSpeed-0.72)*4)";
			};
			class RotorLowOut
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\blade",0.31622776,3,60};
				frequency = "rotorSpeed";
				volume = "camPos*(0 max (rotorSpeed-0.1))";
				cone[] = {1.6,3.14,1.6,0.95};
			};
			class RotorHighOut
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\blade_high",0.31622776,3,65};
				frequency = "rotorSpeed";
				volume = "camPos*10*(0 max (rotorThrust-0.9))";
				cone[] = {1.6,3.14,1.6,0.95};
			};
			class EngineIn
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\quad_engine_full_int",0,2};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*((rotorSpeed-0.75)*4)";
			};
			class RotorLowIn
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\blade_int",0,2};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*(0 max (rotorSpeed-0.1))";
			};
			class RotorHighIn
			{
				sound[] = {"A3\Sounds_F\air\Uav_01\blade_high_int",0,2};
				frequency = "rotorSpeed";
				volume = "(1-camPos)*3*(rotorThrust-0.9)";
			};
		};
		class Exhausts
		{
			class Exhaust_1
			{
				position = "Exhaust_1_pos";
				direction = "Exhaust_1_dir";
				effect = "ExhaustsEffectDrone";
			};
		};
		class Library
		{
			libTextDesc = "$STR_A3_CfgVehicles_UAV_01_base_Library0";
		};
		class EventHandlers
		{
			class Mavic_Events
			{
				killed = "player connectTerminalToUAV objNull; { _x setDamage 1 } forEach (crew (_this # 0));";
				init = "params ['_entity']; if ((isClass(configFile >> ""CfgPatches"" >> ""DB_D37_scripts_mavick_vogs"")) && !(is3DEN)) then { [_entity, 1] spawn mavic_drop_fnc_makeGrenadeDrone; };";
			};
		};
		class UserActions
		{
			class DisassembleUAV
			{
				displayName = "Put in inventory";
				priority = 0.5;
				radius = 7;
				position = "";
				showWindow = 0;
				onlyForPlayer = 1;
				icon = "";
				condition = "[this] call mavic_fnc_canDisassembly";
				statement = "[this, player] call mavic_fnc_addUavToInventory";
			};
			class ChangeBattery
			{
				displayName = "Change Battery";
				priority = 0.5;
				radius = 7;
				position = "";
				showWindow = 0;
				onlyForPlayer = 1;
				icon = "";
				condition = "!(isClass (configFile >> ""CfgPatches"" >> ""ace_main"")) && (alive this) && ([player, ""Laserbatteries""] call BIS_fnc_hasItem) && (cameraOn == player) && {(fuel this) < 1} && {(speed this) < 1} && {!(isEngineOn this)}";
				statement = "[this, player] call mavic_fnc_changeBattery";
			};
		};
		class PilotCamera
		{
			minTurn = -27;
			maxTurn = 27;
			initTurn = 0;
			minElev = -35;
			maxElev = 90;
			initElev = 0;
			maxXRotSpeed = 1;
			maxYRotSpeed = 1;
			maxMouseXRotSpeed = 0.5;
			maxMouseYRotSpeed = 0.5;
			pilotOpticsShowCursor = 1;
			controllable = 1;
			class OpticsIn
			{
				class Wide
				{
					opticsDisplayName = "WFOV";
					initAngleX = 0;
					minAngleX = 0;
					maxAngleX = 0;
					initAngleY = 0;
					minAngleY = 0;
					maxAngleY = 0;
					initFov = 0.8;
					minFov = 0.028;
					maxFov = 0.8;
					directionStabilized = 1;
					visionMode[] = {"Normal"};
					thermalMode[] = {};
					GunnerOpticsModel = "\mavik\mavik_hud.p3d";
					opticsPPEffects[] = {"OpticsCHAbera2","OpticsBlur2"};
				};
				showMiniMapInOptics = 1;
				showUAVViewInOptics = 0;
				showSlingLoadManagerInOptics = 0;
			};
		};
		class Turrets {};
		class Components: Components
		{
			class VehicleSystemsDisplayManagerComponentLeft: DefaultVehicleSystemsDisplayManagerLeft
			{
				class components{};
			};
			class VehicleSystemsDisplayManagerComponentRight: DefaultVehicleSystemsDisplayManagerRight
			{
				class components{};
			};
		};
	};
class BAPMC_mavic3T_base: BAPMC_Mavik_Base
	{
		class PilotCamera
		{
			minTurn = -27;
			maxTurn = 27;
			initTurn = 0;
			minElev = -35;
			maxElev = 90;
			initElev = 0;
			maxXRotSpeed = 1;
			maxYRotSpeed = 1;
			maxMouseXRotSpeed = 0.5;
			maxMouseYRotSpeed = 0.5;
			pilotOpticsShowCursor = 1;
			controllable = 1;
			class OpticsIn
			{
				class Wide
				{
					opticsDisplayName = "WFOV";
					initAngleX = 0;
					minAngleX = 0;
					maxAngleX = 0;
					initAngleY = 0;
					minAngleY = 0;
					maxAngleY = 0;
					initFov = 0.8;
					minFov = 0.028;
					maxFov = 0.8;
					directionStabilized = 1;
					visionMode[] = {"Normal","NVG","Ti"};
					thermalMode[] = {};
					GunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_wide_F";
					opticsPPEffects[] = {"OpticsCHAbera2","OpticsBlur2"};
				};
				showMiniMapInOptics = 1;
				showUAVViewInOptics = 0;
				showSlingLoadManagerInOptics = 0;
			};
		};
		class Turrets{};
		class Components: Components
		{
			class VehicleSystemsDisplayManagerComponentLeft: DefaultVehicleSystemsDisplayManagerLeft
			{
				class components{};
			};
			class VehicleSystemsDisplayManagerComponentRight: DefaultVehicleSystemsDisplayManagerRight
			{
				class components{};
			};
		};
	};
class BAPMC_mavik_3: BAPMC_Mavik_Base
{

    displayName = "MAVIK-3";
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Drones";
    side=2;
    scope=2;
    scopecurator=2;
    crew= "I_UAV_AI";
    typicalCargo[] = {};
};
class BAPMC_mavik_3T: BAPMC_mavic3T_base
{

    displayName = "MAVIK-3T";
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Drones";
    side=2;
    scope=2;
    scopecurator=2;
    crew= "I_UAV_AI";
    typicalCargo[] = {};
};
class BAPMC_MQ9: USAF_MQ9
{
    displayName = "MQ-9 Reaper";
    faction="VS_C_BAPMC";
    editorCategory="VS_C_BAPMC";
    editorSubcategory = "BAPMC_Drones";
    side=2;
    scope=2;
    scopecurator=2;
    crew= "I_UAV_AI";
    typicalCargo[] = {};
};
