
function fhInputPlayerActionMapSetDefault(playerNum, defaultMapNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionMapSetDefault()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		if(defaultMapNum > array_length(__fhInputObjController.myDefaultActionMaps) + 1)
			__fhInputThrowError("FHINPUT: Called " + str + " with a non-existent default Action Map.");
	}
	__fhInputObjController.myPlayers[playerNum].setActionMap(__fhInputObjController.myDefaultActionMaps[defaultMapNum]);
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputPlayerActionMapSetDefault() set a default action map for player ", playerNum, ".");
	}
	return true;
}

function fhi_player_action_map_set_default(playerNum, defaultMapNum)
{
	if(false){return fhi_player_action_map_set_default;}
	return fhInputPlayerActionMapSetDefault(playerNum, defaultMapNum);
}