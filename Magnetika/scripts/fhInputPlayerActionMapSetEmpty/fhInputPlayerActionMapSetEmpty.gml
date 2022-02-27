
function fhInputPlayerActionMapSetEmpty(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionMapSetEmpty()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	fhInputPlayerActionMapDirectSet(playerNum, actionNum, 0, 0, 0);
	__fhInputSetConflicts();
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("fhInputPlayerActionMapSetEmpty() set player ", playerNum, "'s action number ", actionNum, " to empty.");
	}
	return true;
}

function fhi_player_action_map_set_empty(playerNum, actionNum)
{
	if(false){return fhi_player_action_map_set_empty;}
	return fhInputPlayerActionMapSetEmpty(playerNum, actionNum);
}