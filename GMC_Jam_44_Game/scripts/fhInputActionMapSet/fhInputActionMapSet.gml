
function fhInputActionMapSet(actionMap)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapSet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	
	__fhInputObjController.myPlayers[playerNum].setActionMap(actionMap);
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputActionMapSet() set an action map for player ", playerNum, ".");
	}
	return true;
}

function fhi_action_map_set(actionMap)
{
	if(false){return fhi_action_map_set;}
	return fhInputActionMapSet(actionMap);
}