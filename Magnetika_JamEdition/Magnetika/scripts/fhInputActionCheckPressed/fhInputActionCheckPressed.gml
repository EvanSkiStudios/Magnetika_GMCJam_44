
function fhInputActionCheckPressed(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionCheckPressed()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].isPressed;
}

function fhi_action_check_pressed(actionNum)
{
	if(false){return fhi_action_check_pressed;}
	return fhInputActionCheckPressed(actionNum);
}