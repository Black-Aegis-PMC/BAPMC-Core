private _man=objNull;
while{TRUE}do{
	{
	_man=_x;
	if(_man isKindOf"MAN")then{
		if(_man getVariable["ddtReg",FALSE])exitWith{};
		if!((backPack _man)in ddtJammers)exitWith{};
		_man setVariable["ddtReg",TRUE,TRUE];
		[_man]spawn DDT_fnc_JammerPack;
	};
	}forEach allUnits;
	sleep 5;
};