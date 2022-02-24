
function fhInputActionGetConflicts(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionGetConflicts()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].conflicts;
}

function fhi_action_get_conflicts(actionNum)
{
	if(false){return fhi_action_get_conflicts;}
	return fhInputActionGetConflicts(actionNum);
}