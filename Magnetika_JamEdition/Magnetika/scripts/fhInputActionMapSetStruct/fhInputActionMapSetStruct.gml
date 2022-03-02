
function fhInputActionMapSetStruct(actionNum, struct)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapSetStruct()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	__fhInputSetAction(playerNum, actionNum, struct.deviceType, struct.deviceID, struct.input);
	__fhInputSetConflicts();
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("fhInputActionMapSetStruct() set player ", playerNum, "'s action number ", actionNum, ".");
	}
	return true;
}

function fhi_action_map_set_struct(actionNum, struct)
{
	if(false){return fhi_action_map_set_struct;}
	return fhInputActionMapSetStruct(actionNum, struct);
}