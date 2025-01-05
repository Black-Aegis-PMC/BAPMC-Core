class CfgAmmo {
    class rhs_ammo_556x45_M855A1_Ball;
	class BAPMC_ammo_556x45_M855A1 : rhs_ammo_556x45_M855A1_Ball
	{
		hit				= 20;
	};
    
    class BAPMC_ammo_556x45_M855A1_Tracer : BAPMC_ammo_556x45_M855A1
	{
		nvgOnly			= 0;
		tracerStartTime	= 0.073;
		tracerEndTime	= 1;
	};

    class B_762x54_Ball;
    class BAPMC_ammo_762 : B_762x54_Ball
    {
		hit				= 25;
    };

//		hit				= 50;
};