
function fhInputActionCheckHeldSteps(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionCheckHeldSteps()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].heldSteps;
}

function fhi_action_check_held_steps(actionNum)
{
	if(false){return fhi_action_check_held_steps;}
	return fhInputActionCheckHeldSteps(actionNum);
}