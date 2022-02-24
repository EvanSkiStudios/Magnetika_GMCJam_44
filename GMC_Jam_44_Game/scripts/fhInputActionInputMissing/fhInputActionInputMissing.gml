
function fhInputActionInputMissing(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionInputMissing()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	var deviceType = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].deviceType;
	if(deviceType == __FHINPUT_Device_XInput || deviceType == __FHINPUT_Device_DInput)
	{
		var deviceID = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].deviceID;
		if(!gamepad_is_connected(deviceID))
			return true;
	}
	return false;
}

function fhi_action_input_missing(actionNum)
{
	if(false){return fhi_action_input_missing;}
	return fhInputActionInputMissing(actionNum);
}