/* ----------------------------------------------------------------------------
Config: Vehicle Deploy

Description:
	Registers ACE interactions on vehicles which allow people to deploy
	vehicle components otherwise customisable in the vehicles Garage.

Author:
	Arend
License GPL-2.0

---------------------------------------------------------------------------- */
#define ADD_ACTIONS(parent, child) \
class child : parent { \
	class ACE_Actions { \
		class ACE_MainActions { \
			class vs_cORE_VehicleDeploy { \
				displayName = "Deploy"; \
				distance = 4; \
				icon = "\A3\ui_f\data\GUI\Rsc\RscDisplayGarage\animationSources_ca.paa"; \
				condition = "!(([_target] call vs_core_fnc_getDeployAnimations) isEqualTo []) && simulationEnabled _target && alive _target"; \
				statement = ""; \
				insertChildren = "_this call vs_core_fnc_addDeployActions;"; \
				exceptions[] = {"isNotEscorting", "isNotDragging", "isNotCarrying"}; \
			}; \
		}; \
	}; \
};


class CfgVehicles {
	class LandVehicle;
	ADD_ACTIONS(LandVehicle, Car)
	ADD_ACTIONS(LandVehicle, Tank)
	ADD_ACTIONS(LandVehicle, Motorcycle)
	ADD_ACTIONS(LandVehicle, StaticWeapon)

	class Air;
	ADD_ACTIONS(Air, Helicopter)
	ADD_ACTIONS(Air, Plane)

	class Ship;
	ADD_ACTIONS(Ship, Ship_F)
};
