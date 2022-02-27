//These macros are for settings.  Change them as needed, but please don't change the names or code will break.

/*
Directory the project(.yyp file specifically) is in.
I need this set correctly so that the configuration program can find the datafiles directory and change them.
This is hopefully temporary, as I suggested to YoyoGames that they add a constant for this purpose.
*/
#macro FHINPUT_SETTING_ProjectDirectory "G:\\GameMaking\\GameMakerStudio2 Projects\\Projects\\_jams\\GMC JAM\\GMC 44 Jam\\Magnetika"

/*
How many players to allocate, there is very little overhead if you allocate more than what you need at any time.
Set it to the maximum players your game will support.
This must be set to a minimum of one, default is 1
*/
#macro FHINPUT_SETTING_NumPlayers 1

/*
How many actions you will have, this should be part of the root design of your game and not change through the life of it
You can change it later on of course, but you will need to re-create the default action mappings to match.
This must be set to a minimum of one, default is 8
*/
#macro FHINPUT_SETTING_NumActions 8

/*
Leave true for debugging, change to false or comment and uncomment the next line once game is properly tested
Debug Mode does sanity checks to make sure you don't try accessing non-existent actions, players, etc...
This can only be true or false, default is true
*/
#macro FHINPUT_SETTING_DebugMode true
//#macro FHINPUT_SETTING_DebugMode false

/*
This controls whether conflicts are allowed.  See the manual for details on how conflicts are handled in each case.
This can only be true or false, default is false
*/
#macro FHINPUT_SETTING_AllowConflicts false

/*
This controls the threshold for how far a gamepad axis needs to be tilted to be considered "down".
Default is 0.75, meaning 75%.  "Down" refers to being up or down for the purposes of "just" pressed/released,
	as well as for input detection when assigning mapping, and for accumulating time held.
Note that the raw value for the axes is still stored when assigned to inputs.
Must between 0 and 1, default is 0.75, recommended no more than 0.9 nor less than 0.5
*/
#macro FHINPUT_SETTING_AxisThreshold 0.75

/*
This controls how long the input searching delays to detect input once started(in steps).
It is used to stop assigning the same key/button you use to initiate the search to the input before time is given
    to release that input.
Must be positive, default is 30, which is half a second with room_speed of 60.
*/
#macro FHINPUT_SETTING_SearchDelay 30

/*
This controls how long to continue input searching before timing out(in steps).
Once the time passes, the timeout callback function is called, and the searching stops.
Must be positive, default is 300, which is 5 seconds with room_speed of 60.
*/
#macro FHINPUT_SETTING_SearchTimeout 300

/*
This controls the pseudo-assignment of gamepads to players.
The system does not actually support assigning gamepads to players.
This allows there to be no limitations on what player uses what device, etc...
However, for the purpose of automatic remapping of actions, this
	defines how the system determines which gamepad is considered "assigned."
See the manual for details.
Must be either 0 or 1
0 = Assignment based on the first action in the list
1 = Assignment based on a majority of actions
*/
#macro FHINPUT_SETTING_GamepadAssignmentBehavior 1

/*
This controls what the system thinks is the max possible gamepad ID.
Normally the system just expects to use the async events to detect gamepads as is recommended best practice.
However, it is possible that you wish to initialize the system later on instead of in the very first step.
If you do this however, the async events won't fire, so you need to manually verify what gamepads are connected.
The fhInputRefreshGamepads() function does that, and uses this value to loop through possible gamepads.
*/
#macro FHINPUT_SETTING_MaxGamepadID 50

