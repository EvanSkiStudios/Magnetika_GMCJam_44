
function fhInputSetAuto()
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputSetAuto()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	__fhInputObjController.myPlayers[playerNum].myIsAutomatic = true;
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputSetAuto() set player ", playerNum, " to automatic mode.");
	}
	return true;
}

function fhi_set_auto()
{
	if(false){return fhi_set_auto;}
	return fhInputSetAuto();
}