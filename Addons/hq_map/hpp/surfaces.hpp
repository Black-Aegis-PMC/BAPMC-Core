class CfgSurfaces {
    class Default {
        access = 2;
        files = "default";
        rough = 0.1;
        maxSpeedCoef = 1.0;
        dust = 0.5;
        soundEnviron = "drygrass";
        character = "Empty";
        isWater = 0;
    };

    class bapmc_grass : Default {
        files = "gdt_strgreengrass_*";
        rough = 0.2;
        maxSpeedCoef = 0.9;
        dust = 0.3;
        soundEnviron = "grass";
        character = "StrGrassGreenGroup";
        material = "x\vs_c\hq_map\data\gdt\bapmc_grass.rvmat";
        isWater = 0;
        friction = 1.0;
        impact = "hitGroundSoft";
        surfaceFriction = 1.5;
        grassCover = 0.5;
        density = 1;
        soundHit = "soft_ground";
    };

    class bapmc_beach : Default {
        files = "gdt_strbeach_*";
        rough = 0.1;
        maxSpeedCoef = 0.8;
        dust = 0.5;
        soundEnviron = "sand";
        character = "BeachClutter";
        material = "x\vs_c\hq_map\data\gdt\bapmc_beach.rvmat";
        isWater = 0;
        friction = 0.9;
        impact = "hitSand";
        surfaceFriction = 1.2;
        grassCover = 0.2;
        density = 0.8;
        soundHit = "soft_ground";
    };

    class bapmc_seabed : Default {
        files = "gdt_strseabed_*";
        rough = 0.05;
        maxSpeedCoef = 0.6;
        dust = 0.2;
        soundEnviron = "water";
        character = "SeabedClutter";
        material = "x\vs_c\hq_map\data\gdt\bapmc_seabed.rvmat";
        isWater = 1;
        friction = 0.5;
        impact = "hitWater";
        surfaceFriction = 0.8;
        grassCover = 0.0;
        density = 0.5;
        soundHit = "water_hit";
    };

    class bapmc_forest : Default {
        files = "gdt_strgreengrass_*";
        rough = 0.3;
        maxSpeedCoef = 0.7;
        dust = 0.4;
        soundEnviron = "forest";
        character = "ForestClutter";
        material = "x\vs_c\hq_map\data\gdt\bapmc_forest.rvmat";
        isWater = 0;
        friction = 1.1;
        impact = "hitGroundSoft";
        surfaceFriction = 1.4;
        grassCover = 0.6;
        density = 1.2;
        soundHit = "soft_ground";
    };

    class bapmc_concrete : Default {
        files = "gdt_strconcrete_*";
        rough = 0.01;
        maxSpeedCoef = 1.0;
        dust = 0.0;
        soundEnviron = "concrete";
        character = "NoClutter";
        material = "x\vs_c\hq_map\data\gdt\bapmc_concrete.rvmat";
        isWater = 0;
        friction = 1.7;
        impact = "hitConcrete";
        surfaceFriction = 2.0;
        grassCover = 0.0;
        density = 1.5;
        soundHit = "hard_ground";
    };

    class bapmc_dirt : Default {
        files = "gdt_strdirt_*";
        rough = 0.4;
        maxSpeedCoef = 0.85;
        dust = 0.6;
        soundEnviron = "dirt";
        character = "StrGrassDryGroup";
        material = "x\vs_c\hq_map\data\gdt\bapmc_dirt.rvmat";
        isWater = 0;
        friction = 1.0;
        impact = "hitGroundHard";
        surfaceFriction = 1.3;
        grassCover = 0.3;
        density = 1.0;
        soundHit = "soft_ground";
    };
};

class CfgSurfaceCharacters {
    class StrGrassGreenGroup {
        probability[] = {0.9};
        names[] = {"StrGrassGreenGroup", "GrassGreen", "GrassBrushHighGreen"};
    };

    class StrGrassDryGroup {
        probability[] = {0.8};
        names[] = {"StrGrassDryGroup", "GrassDry", "GrassLong_DryBunch", "ThistleHighDead"};
    };

    class ForestClutter {
        probability[] = {0.7};
        names[] = {"StrBigFallenBranches_pine", "StrBigFallenBranches_pine02", "StrBigFallenBranches_pine03", "StrPlantGreenShrub"};
    };

    class BeachClutter {
        probability[] = {0.3};
        names[] = {"FlowerCakile", "StrThornKhakiSmall", "StrThornGraySmall"};
    };

    class SeabedClutter {
        probability[] = {0.4};
        names[] = {"SeaWeed1", "SeaWeed2", "Coral1", "Coral2", "Coral3", "Coral4", "Coral5"};
    };

    class NoClutter {
        probability[] = {0.0};
        names[] = {""};
    };
};
