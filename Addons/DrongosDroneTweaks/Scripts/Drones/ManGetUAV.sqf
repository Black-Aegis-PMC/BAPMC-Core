private _man=_this select 0;
private _type=toUpper(_this select 1);
private _drone="";
if!(alive _man)exitWith{""};
_man setVariable["ddtRemoveMag","",TRUE];
_man setVariable["ddtRemoveItem","",TRUE];
//_man setVariable["ddtRemovePack",FALSE,TRUE];
if!((vehicle _man)==_man)exitWith{""};
//if(_man call DDT_fnc_ManIsInside)exitWith{""};
private _classes=[]+ddtClassesRecon;
if(_type=="FPV")then{_classes=[]+ddtClassesFPV};
if(_type=="FPVAT")then{_classes=[]+ddtClassesFPVAT};
if(_type=="BOMBER")then{_classes=[]+ddtClassesBomber};
if(_type=="UGV")then{_classes=[]+ddtClassesBomber};
// Magazine check
private _mag="";
private _side=side _man;
{if([[_x],_classes]call DDT_fnc_InArray)exitWith{_drone=_x;_mag=_x}}forEach(magazines _man);
if!(_drone=="")exitWith{
	if(_mag=="Item_Mavic3T")then{
		_drone="mavik_3T_BLU";
		if(_side==EAST)then{_drone="mavik_3T_OPF"};
		if(_side==RESISTANCE)then{_drone="mavik_3T_IND"};
	};
	if(_mag=="Item_Mavic")then{
		_drone="mavik_3_BLU";
		if(_side==EAST)then{_drone="mavik_3_OPF"};
		if(_side==RESISTANCE)then{_drone="mavik_3_IND"};
	};
	_man setVariable["ddtRemoveMag",_mag,TRUE];
	_drone
};
// Item check
private _item="";
{if([[_x],_classes]call DDT_fnc_InArray)exitWith{_drone=_x;_item=_x}}forEach(items _man);
if!(_drone=="")exitWith{
	if(_drone=="sps_black_hornet_01_Static_F")then{_drone="sps_black_hornet_01_F"};
	// Improved mavic
	if(_item=="ItemMavic3T")then{
		_drone="mavic_3T_BLU";
		if(_side==EAST)then{_drone="mavic_3T_OPF"};
		if(_side==RESISTANCE)then{_drone="mavic_3T_IND"};
	};
	if(_item=="ItemMavic3")then{
		_drone="mavic_3_BLU";
		if(_side==EAST)then{_drone="mavic_3_OPF"};
		if(_side==RESISTANCE)then{_drone="mavic_3_IND"};
	};
	_man setVariable["ddtRemoveItem",_item,TRUE];
	_drone
};
// Backpack check
private _pack=backpack _man;
if(_pack=="")exitWith{""};
_drone=getText(configFile>>"CfgVehicles">>_pack>>"assembleInfo">>"assembleTo");
if(_drone=="")exitWith{""};
_man setVariable["ddtRemovePack",TRUE,TRUE];
if((_type=="RECON")AND(_pack call DDT_fnc_BackpackIsRecon))exitWith{_drone};
if((_type=="FPV")AND(_pack call DDT_fnc_BackpackIsFPV))exitWith{_drone};
if((_type=="FPVAT")AND(_pack call DDT_fnc_BackpackIsFPVAT))exitWith{_drone};
if((_type=="BOMBER")AND(_pack call DDT_fnc_BackpackIsBomber))exitWith{_drone};
if((_type=="UGV")AND(_pack call DDT_fnc_BackpackIsUGV))exitWith{_drone};
""