
function fhInputSetManual()
{
	playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputSetManual()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	__fhInputObjController.myPlayers[playerNum].myIsAutomatic = false;
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputSetManual() set player ", playerNum, " to manual mode.");
	}
}

function fhi_set_manual()
{
	if(false){return fhi_set_manual;}
	return fhInputSetManual();
}