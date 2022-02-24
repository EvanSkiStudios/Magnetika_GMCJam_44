
function fhInputActionMapDirectSet(actionNum, deviceType, deviceID, input)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapDirectSet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	__fhInputSetAction(playerNum, actionNum, deviceType, deviceID, input);
	__fhInputSetConflicts();
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputActionMapDirectSet() directly set a player ", playerNum, "'s action number ", actionNum, ".");
	}
	return true;
}

function fhi_action_map_direct_set(actionNum, deviceType, deviceID, input)
{
	if(false){return fhi_action_map_direct_set;}
	return fhInputActionMapDirectSet(actionNum, deviceType, deviceID, input);
}