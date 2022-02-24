
function fhInputPlayerActionMapDirectSet(playerNum, actionNum, deviceType, deviceID, input)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionMapDirectSet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	__fhInputSetAction(playerNum, actionNum, deviceType, deviceID, input);
	__fhInputSetConflicts();
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputPlayerActionMapDirectSet() directly set a player ", playerNum, "'s action number ", actionNum, ".");
	}
	return true;
}

function fhi_player_action_map_direct_set(playerNum, actionNum, deviceType, deviceID, input)
{
	if(false){return fhi_player_action_map_direct_set;}
	return fhInputPlayerActionMapDirectSet(playerNum, actionNum, deviceType, deviceID, input);
}