global.__fhInputSelectedPlayer = 0;

if(instance_number(__fhInputObjController)>1)
{
	__fhInputThrowError("Manually created __fhInputController should not be present once system has been initialized.");
	instance_destroy();
}

searchReset = function()
{
	mySearching = false;
	mySearchingGamepad = false;
	myTimeLeft = 0;
	myDelayTimeLeft = 0;
	mySearchingPlayer = -1;
	mySearchingAction = -1;
	myCallback = -1;
	myCallbackGamepad = -1;
	myFoundDeviceType = -1;
	myFoundDeviceID = -1;
	myFoundInput = -1;
	
}

searchReset();
myExclusions = [];
myDefaultActionMaps = [];

if(os_type == os_windows)
	global.__fhInputRumbleEnabled = true;
else
	global.__fhInputRumbleEnabled = false;

if(file_exists(__FHINPUTFileExclusions))
{
	var file = file_text_open_read(__FHINPUTFileExclusions);
	var str = file_text_read_string(file);
	file_text_close(file);
	myExclusions = json_parse(str);
}
else
{
	__fhInputDebugLog("FHINPUT: Exclusions File not found...if you want key exclusions, please create one with the configuration creator room.  Otherwise, disregard this message.");
}
if(file_exists(__FHINPUTFileActionMaps))
{
	var file = file_text_open_read(__FHINPUTFileActionMaps);
	var str = file_text_read_string(file);
	file_text_readln(file);
	if(real(str) != global.__fhInputNumActions)
	{
		__fhInputDebugLog("FHINPUT: Default Action Maps file has wrong number of actions...please recreate it with the configuration room.");
	}
	else
	{
		str = file_text_read_string(file);
		myDefaultActionMaps = json_parse(str);
	}
	file_text_close(file);
}
else
{
	__fhInputDebugLog("FHINPUT: Action Maps File not found...if you want to create your action mapping manually, disregard this message.  Otherwise, please run the configuration program to create default action maps.");
}
for(var i = 0; i < global.__fhInputNumPlayers; i++)
{
	myPlayers[i] = new __fhInputPlayer(i);
}

myGPList = new __fhInputGPList();

myGPEventCallback = -1;