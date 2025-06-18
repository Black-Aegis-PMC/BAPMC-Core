params[["_playerSide", [west], [west]]];

private _sideMarkerName = format ["%1_sideMarker", _playerSide];
private _sideMarkerCounter = -1;


if (isNil {missionNamespace getVariable _sideMarkerName}) then {
    missionNamespace setVariable [_sideMarkerName, 0];
	_sideMarkerCounter = Marbit_sideMarkerCounterPre;
	
	_sideMarkerCounter;
}
else {
	_sideMarkerCounter = missionNamespace getVariable [_sideMarkerName, 0];	
	
	if (_sideMarkerCounter >= 10000) then {
		_sideMarkerCounter = Marbit_sideMarkerCounterPre;
	};
	
	if (_sideMarkerCounter < Marbit_sideMarkerCounterPre) then
	{ 
	_sideMarkerCounter = Marbit_sideMarkerCounterPre;
	}; 
	
	_sideMarkerCounter = _sideMarkerCounter + 1;

	missionNamespace setVariable [_sideMarkerName, _sideMarkerCounter];
};

_sideMarkerCounter