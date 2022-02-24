
function fhInputPlayerActionInputMissing(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionInputMissing()";
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

function fhi_player_action_input_missing(playerNum, actionNum)
{
	if(false){return fhi_player_action_input_missing;}
	return fhInputPlayerActionInputMissing(playerNum, actionNum);
}