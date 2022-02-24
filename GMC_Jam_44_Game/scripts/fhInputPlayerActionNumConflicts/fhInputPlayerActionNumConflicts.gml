
function fhInputPlayerActionNumConflicts(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionNumConflicts()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].numConflicts;
}

function fhi_player_action_num_conflicts(playerNum, actionNum)
{
	if(false){return fhi_player_action_num_conflicts;}
	return fhInputPlayerActionNumConflicts(playerNum, actionNum);
}