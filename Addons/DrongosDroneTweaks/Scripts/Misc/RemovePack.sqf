// Can't believe I have to make this, no idea why it suddenly bugs out
private _man=_this select 0;
while{TRUE}do{
	sleep .3;
	if!(alive _man)exitWith{};
	if((backPack _man)=="")exitWith{};
	removeBackpackGlobal _man;
	//_man remoteExec["removeBackpack",_man];
};