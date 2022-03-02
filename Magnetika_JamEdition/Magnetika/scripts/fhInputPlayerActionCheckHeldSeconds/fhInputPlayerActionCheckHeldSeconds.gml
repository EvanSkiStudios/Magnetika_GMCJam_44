
function fhInputPlayerActionCheckHeldSeconds(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionCheckHeldSeconds()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].heldSeconds;
}

function fhi_player_action_check_held_seconds(playerNum, actionNum)
{
	if(false){return fhi_player_action_check_held_seconds;}
	return fhInputPlayerActionCheckHeldSeconds(playerNum, actionNum);
}