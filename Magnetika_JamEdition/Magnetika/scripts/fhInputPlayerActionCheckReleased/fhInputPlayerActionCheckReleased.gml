
function fhInputPlayerActionCheckReleased(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionCheckReleased()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].isReleased;
}

function fhi_player_action_check_released(playerNum, actionNum)
{
	if(false){return fhi_player_action_check_released;}
	return fhInputPlayerActionCheckReleased(playerNum, actionNum);
}