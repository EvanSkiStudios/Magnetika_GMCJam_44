
function fhInputPlayerSetManual(playerNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputPlayerSetManual()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	__fhInputObjController.myPlayers[playerNum].myIsAutomatic = false;
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputPlayerSetManual() set player ", playerNum, " to manual mode.");
	}
}

function fhi_player_set_manual(playerNum)
{
	if(false){return fhi_player_set_manual;}
	return fhInputPlayerSetManual(playerNum);
}