//Returns a boolean indicating if that provided vehicle tytpe should have GUI commands blacklisted
//TRUE indicated an intem is blacklisted

params ["_player","_veh"];


if(typeOf _veh == "sps_black_hornet_01_F") exitwith{false};
if(typeOf _veh == "B_UAV_01_F") exitwith{false};
_blacklistArray = ["sps_black_hornet_01_F"];

true