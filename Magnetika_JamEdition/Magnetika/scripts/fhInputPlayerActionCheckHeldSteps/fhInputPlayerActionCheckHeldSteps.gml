
function fhInputPlayerActionCheckHeldSteps(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionCheckHeldSteps()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].heldSteps;
}

function fhi_player_action_check_held_steps(playerNum, actionNum)
{
	if(false){return fhi_player_action_check_held_steps;}
	return fhInputPlayerActionCheckHeldSteps(playerNum, actionNum);
}