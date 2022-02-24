
function fhInputActionCheckDown(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionCheckDown()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].isDown;
}

function fhi_action_check_down(actionNum)
{
	if(false){return fhi_action_check_down;}
	return fhInputActionCheckDown(actionNum);
}