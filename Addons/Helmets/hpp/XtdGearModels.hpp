class XtdGearModels {
    class CfgWeapons {
        class BAPMC_OPS_Black {
            label = "[BAPMC] Ops Helmet";
            author = "Viking Studios";
            options[] = {"Colour","Headset"};
            class colour {
                changeingame = 0;
                values[] = {"A","B"};

                class A { label = "Black"; };
                class B { label = "Black/Grey"; };
            };
            class peltor {
                changeingame = 0;
                values[] = {"A","B"};

                class A { label = "Yes"; };
                class B { label = "No"; };

            };
        };
    };
};
