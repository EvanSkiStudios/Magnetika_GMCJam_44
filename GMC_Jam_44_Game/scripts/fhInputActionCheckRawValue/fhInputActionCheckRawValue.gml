
function fhInputActionCheckRawValue(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionCheckRawValue()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].rawValue;
}

function fhi_action_check_raw_value(actionNum)
{
	if(false){return fhi_action_check_raw_value;}
	return fhInputActionCheckRawValue(actionNum);
}