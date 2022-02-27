
function fhInputPlayerActionMapSetStruct(playerNum, actionNum, struct)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionMapSetStruct()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	__fhInputSetAction(playerNum, actionNum, struct.deviceType, struct.deviceID, struct.input);
	__fhInputSetConflicts();
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("fhInputPlayerActionMapSetStruct() set player ", playerNum, "'s action number ", actionNum, ".");
	}
	return true;
}

function fhi_player_action_map_set_struct(playerNum, actionNum, struct)
{
	if(false){return fhi_player_action_map_set_struct;}
	return fhInputPlayerActionMapSetStruct(playerNum, actionNum, struct);	
}