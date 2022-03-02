
function fhInputActionNumConflicts(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionNumConflicts()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].numConflicts;
}

function fhi_action_num_conflicts(actionNum)
{
	if(false){return fhi_action_num_conflicts;}
	return fhInputActionNumConflicts(actionNum);
}