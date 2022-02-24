
function fhInputActionCheckHeldSeconds(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionCheckHeldSeconds()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].heldSeconds;
}

function fhi_action_check_held_seconds(actionNum)
{
	if(false){return fhi_action_check_held_seconds;}
	return fhInputActionCheckHeldSeconds(actionNum);
}