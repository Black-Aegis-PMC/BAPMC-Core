private _checkIn=_this select 0;
private _arrayIn=_this select 1;
private _check=[];
private _array=[];
private _found=FALSE;
{_check pushBack(toUpper _x)}forEach _checkIn;
{_array pushBack(toUpper _x)}forEach _arrayIn;
{if(_x in _array)exitWith{_found=TRUE}}forEach _check;
_found