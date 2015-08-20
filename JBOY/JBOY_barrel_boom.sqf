// ****************************************************************
// JBOY_barrel_boom.sqf by johnnyboy
//
// This script will cause barrels to burn a few seconds, then explode.
//
// Put one of these in barrel's init field:
//
//  this addeventhandler ["killed",{ [_this"] execVM "JBOY\JBOY_barrel_boom.sqf"; }];
//  this addeventhandler ["hit",{ [_this] execVM "JBOY\JBOY_barrel_boom.sqf";}];
// ****************************************************************
if (isServer) then
{
	_paramArray = _this select 0;  // barrel to explode
	_obj = _paramArray select 0;  // barrel to explode
	//hintc str _obj;
	// *** Parameters for setVelocity.  
    _speed = (random 5) + 6;
    _dir = random 359;
    _zvel = (random 2) +12;
	_vdir = vectorDir _obj;
	_dir = getdir _obj;

	_objPos = (position _obj);
	
    _objpos set [2,(_objpos select 2)+1];
	_obj enablesimulation true;
	
nul = [_obj, [0,0,0], 300 + random 50, .0005, .5] call PV_createFire;  
//nul=[ _obj, [0,0,0], 300 + random 50, .0005, .5 ] execvm "JBOY\JBOY_createFire.sqf";
sleep(random(4) +.2);

// Look for near guys to burn.
[_objPos] spawn 
{	
  sleep .6;
  _explosion = _this select 0;
  _nearDudes = [];
  _nearDudes = nearestObjects [_explosion, ["Man"], 8];
  {
     _dir = [_explosion, _x] call BIS_fnc_dirTo;
	 _speed = 3;
	// _x setdamage ((damage _x)+.2);
	nul = [_x, [0,0,.9], 75 + random 50, .001, .5] call PV_createFire;  
	//nul=[ _x, [0,0,.9], 75 + random 50, .001, .5 ] execvm "JBOY\JBOY_createFire.sqf";
     _x setVelocity [_speed * sin(_dir), _speed * cos(_dir),1+random 3]; 
     [_x,-20,30] call bis_fnc_setpitchbank;	 
  } foreach _nearDudes;
};	

	sleep .6;

	detach _obj;
	_rand = random 10;
    if (_rand > 8) then
	{
		bomb = "SLAMDirectionalMine_Wire_Ammo" createVehicle ([getpos _obj select 0, getpos _obj select 1, 1]); 
		bomb setdamage 1;
	} else {
		if (_rand > 5) then
		{
		bomb = "APERSTripMine_Wire_Ammo" createVehicle ([getpos _obj select 0, getpos _obj select 1, 1]); 
		bomb2 = "APERSTripMine_Wire_Ammo" createVehicle ([getpos _obj select 0, getpos _obj select 1, 1]); 
		bomb setdamage 1;
		bomb2 setdamage 1;
		} else {
		bomb = "APERSTripMine_Wire_Ammo" createVehicle ([getpos _obj select 0, getpos _obj select 1, 1]); 
		bomb setdamage 1;
		}
	};
	sleep .3;
[_obj, 0,random 90] call BIS_fnc_setPitchBank; 

	// *** launch the barrel
	_obj setVelocity [_speed * sin(random 360), _speed * cos(random 360), _zvel]; 
	if (_obj in (TRUCKBARRELS select 1)) then 
	{
		{  // if near barrel attached, then unattached and bump it
			_brl = (TRUCKBARRELS select 1) select _x;
			if !(isNull attachedTo _brl) then
			{
				detach _brl; 
				[_brl, 0,45] call BIS_fnc_setPitchBank;
				_brl setVelocity [_speed/3 * sin(random 360), _speed/3 * cos(random 360), _zvel/6];
			};
		} 
		foreach [1,3,4];
	};
	waitUntil {sleep .05; ((speed _obj) < .5 ) && (getpos _obj) select 2 < 1 };
}; // exit