// FHQ TT:
call compile preProcessFileLineNumbers "fhqtt.sqf";
call compile preProcessFileLineNumbers "briefing.sqf";

if(!isServer) then {waitUntil{!isNull player}};
//====================================================================================
// ******** Compile functions
//====================================================================================
JBOY_scream = compile (preprocessFileLineNumbers "JBOY\JBOY_scream.sqf");
JBOY_createFire = compile (preprocessFileLineNumbers "JBOY\JBOY_createFire.sqf");
JBOY_moduleEffectsFire = compile (preprocessFileLineNumbers "JBOY\JBOY_moduleEffectsFire.sqf");
PV_createFire = compile preprocessFileLineNumbers "JBOY\PV_createFire.sqf";
SET_GLOBALVAR = compile preprocessFileLineNumbers "JBOY\SET_GLOBALVAR.sqf";
PV_switchmove = compile preprocessFileLineNumbers "JBOY\PV_switchmove.sqf";

//====================================================================================
// Public Variable event handlers
//====================================================================================
if (isNil "PVEH_delaySay3D") then {
    PVEH_delaySay3D = [objNull,0];
};
"PVEH_delaySay3D" addPublicVariableEventHandler {
      private["_array"];
      _array = _this select 1;
     (_array select 0) say3D (_array select 1);
};

if (isNil "PVEH_SET_GLOBALVAR") then {
    PVEH_SET_GLOBALVAR = [objNull,0];
};
"PVEH_SET_GLOBALVAR" addPublicVariableEventHandler
{
      private["_array"];
      _array = _this select 1;
	  _gvar = _array select 0;
	  _gval = _array select 1;
	  _gvar = _gval;
	  player globalchat format ["global=%1",START_ISLAND];
};

if (isNil "PVEH_createFire") then {
    PVEH_createFire = [objNull,0];
};
"PVEH_createFire" addPublicVariableEventHandler
{
    private["_array"];
    _array = _this select 1;
	_attachToObj = _array select 0;   // Object to attach fire to.
	_relPos      = _array select 1;   // Position relative to object where fire will attach
	_timeout     = _array select 2;   // How many seconds the fire will last.  Zero is forever.
	_effectSize  = _array select 3;   // Size of fire
	_fireDamage  = _array select 4;   // How much damage per interval is applied to nearby objects. How often this is applied I don't know.
	nul=[ _attachToObj,_relPos,_timeout,_effectSize,_fireDamage ] execvm "JBOY\JBOY_createFire.sqf";
};
if (isNil "PVEH_switchmove") then {
    PVEH_switchmove = [objNull,0];
};
"PVEH_switchmove" addPublicVariableEventHandler
{
    private["_array"];
    _array = _this select 1;
	_dude = _array select 0;
	_anim      = _array select 1;
	_dude switchmove _anim;
};


G_OBJ_AWAY = "Land_Screwdriver_V1_F" createvehicle [0,0,0];

[] spawn {
    if (!isServer)  exitwith {};
	sleep 1;
	nul = [flatbed1, 8, .98] execVM "JBOY\JBOY_load_barrels_on_truck.sqf";
	nul = [flatbed2, 8, .98] execVM "JBOY\JBOY_load_barrels_on_truck.sqf";
};
