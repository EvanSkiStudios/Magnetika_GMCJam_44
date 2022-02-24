
function fhInputPlayerActionCheckRawValue(playerNum, actionNum)
{
if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionCheckRawValue()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].rawValue;
}

function fhi_player_action_check_raw_value(playerNum, actionNum)
{
	if(false){return fhi_player_action_check_raw_value;}
	return fhInputPlayerActionCheckRawValue(playerNum, actionNum);
}