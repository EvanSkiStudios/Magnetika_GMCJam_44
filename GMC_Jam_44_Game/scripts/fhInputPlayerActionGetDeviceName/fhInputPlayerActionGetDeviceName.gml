
function fhInputPlayerActionGetDeviceName(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionGetDeviceName()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	var deviceType = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].deviceType;
	if(deviceType == __FHINPUT_Device_None)
		return "Not Set";
	if(deviceType == __FHINPUT_Device_Keyboard)
		return "Keyboard";
	if(deviceType == __FHINPUT_Device_Mouse)
		return "Mouse";
	if(deviceType == __FHINPUT_Device_XInput)
		return "XBOX Gamepad";
	if(deviceType == __FHINPUT_Device_DInput)
	{
		var guid = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].guid;
		return __fhInputGetGamepadModel(guid);
	}
}

function fhi_player_action_get_device_name(playerNum, actionNum)
{
	if(false){return fhi_player_action_get_device_name;}
	return fhInputPlayerActionGetDeviceName(playerNum, actionNum);
}