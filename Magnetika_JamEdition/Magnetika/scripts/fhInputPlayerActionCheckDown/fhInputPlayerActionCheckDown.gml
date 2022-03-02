
function fhInputPlayerActionCheckDown(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionCheckDown()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].isDown;
}

function fhi_player_action_check_down(playerNum, actionNum)
{
	if(false){return fhi_player_action_check_down;}
	return fhInputPlayerActionCheckDown(playerNum, actionNum);
}