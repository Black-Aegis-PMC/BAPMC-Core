// Check if all required gocodes are in ddaiGoCodes
private _in=_this;
private _dmpGoCodes=[];
private _allPresent=TRUE;
{_dmpGoCodes pushBack(toUpper _x)}forEach ddaiGoCodes;
{if!((toUpper _x)in _dmpGoCodes)exitWith{_allPresent=FALSE}}forEach _in;
_allPresent