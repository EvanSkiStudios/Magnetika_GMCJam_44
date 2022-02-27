
function fhInputPlayerActionCheckPressed(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionCheckPressed()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].isPressed;
}

function fhi_player_action_check_pressed(playerNum, actionNum)
{
	if(false){return fhi_player_action_check_pressed;}
	return fhInputPlayerActionCheckPressed(playerNum, actionNum);
}