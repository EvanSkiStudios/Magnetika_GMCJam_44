
function fhInputActionMapGet()
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapGet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputActionMapGet() retrieved action map from player ", playerNum, ".");
	}
	return __fhInputObjController.myPlayers[playerNum].getActionMap();
}

function fhi_action_map_get()
{
	if(false){return fhi_action_map_get;}
	return fhInputActionMapGet();
}