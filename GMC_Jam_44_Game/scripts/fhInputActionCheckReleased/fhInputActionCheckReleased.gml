
function fhInputActionCheckReleased(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionCheckReleased()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].isReleased;
}

function fhi_action_check_released(actionNum)
{
	if(false){return fhi_action_check_released;}
	return fhInputActionCheckReleased(actionNum);
}