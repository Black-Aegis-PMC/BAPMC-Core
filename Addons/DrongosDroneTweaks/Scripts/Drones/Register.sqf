if!(isServer)exitWith{};
private _uav=objNull;
private _disable=[
"AUTOCOMBAT",
"SUPPRESSION",
"RADIOPROTOCOL",
"COVER",
"MINEDETECTION"
];

while{TRUE}do{
	{
	_uav=_x;
	if!(isTouchingGround _uav)then{
		if(_uav getVariable["ddtReg",FALSE])exitWith{};
		_uav setVariable["ddtReg",TRUE,TRUE];
		if((sizeOf(typeOf _uav))>5)exitWith{};
		private _camo=missionNamespace getVariable["ddtVisibility",.1];
		private _audi=missionNamespace getVariable["ddtAudibility",.1];
		_uav setUnitTrait["camouflageCoef",_camo,TRUE];
		_uav setUnitTrait["audibleCoef",_audi,TRUE];
		// I JUST WANT THE COMMANDER TO SHUT UP
		_uav setSpeaker"NoVoice";
		{_uav disableAI _x}forEach _disable;
		{
		private _crew=_x;
		{_crew setSpeaker"NoVoice";_crew disableAI _x}forEach _disable;
		}forEach(crew _UAV);
	};
	}forEach allUnitsUAV;
	sleep 10;
};