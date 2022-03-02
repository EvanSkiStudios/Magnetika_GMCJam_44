
function fhInputPlayerActionGetConflicts(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionGetConflicts()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].conflicts;
}

function fhi_player_action_get_conflicts(playerNum, actionNum)
{
	if(false){return fhi_player_action_get_conflicts;}
	return fhInputPlayerActionGetConflicts(playerNum, actionNum);
}