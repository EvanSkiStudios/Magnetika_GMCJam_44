
function fhInputPlayerActionNotSet(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionNotSet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return (__fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].deviceType == __FHINPUT_Device_None);
}

function fhi_player_action_not_set(playerNum, actionNum)
{
	if(false){return fhi_player_action_not_set;}
	return fhInputPlayerActionNotSet(playerNum, actionNum);
}