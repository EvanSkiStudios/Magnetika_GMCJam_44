function fhInputActionNotSet(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionNotSet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return (__fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].deviceType == __FHINPUT_Device_None)
}

function fhi_action_not_set(actionNum)
{
	if(false){return fhi_action_not_set;}
	return fhInputActionNotSet(actionNum);
}