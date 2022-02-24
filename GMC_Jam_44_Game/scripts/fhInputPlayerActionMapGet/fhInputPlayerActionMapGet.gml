
function fhInputPlayerActionMapGet(playerNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionMapGet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputPlayerActionMapGet() retrieved action map from player ", playerNum, ".");
	}
	return __fhInputObjController.myPlayers[playerNum].getActionMap();
}

function fhi_player_action_map_get(playerNum)
{
	if(false){return fhi_player_action_map_get;}
	fhInputPlayerActionMapGet(playerNum);
}