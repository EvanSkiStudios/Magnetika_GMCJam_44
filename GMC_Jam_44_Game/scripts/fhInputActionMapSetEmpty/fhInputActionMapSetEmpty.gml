
function fhInputActionMapSetEmpty(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapSetEmpty()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	fhInputPlayerActionMapDirectSet(playerNum, actionNum, 0, 0, 0);
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("fhInputActionMapSetEmpty() set player ", playerNum, "'s action number ", actionNum, " to empty.");
	}
	return true;
}

function fhi_action_map_set_empty(actionNum)
{
	if(false){return fhi_action_map_set_empty;}
	return fhInputActionMapSetEmpty(actionNum);
}