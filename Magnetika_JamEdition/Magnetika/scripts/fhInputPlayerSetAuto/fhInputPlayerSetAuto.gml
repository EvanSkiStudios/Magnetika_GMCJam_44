
function fhInputPlayerSetAuto(playerNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputPlayerSetAuto()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	__fhInputObjController.myPlayers[playerNum].myIsAutomatic = true;
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputPlayerSetAuto() set player ", playerNum, " to automatic mode.");
	}
	return true;
}

function fhi_player_set_auto(playerNum)
{
	if(false){return fhi_player_set_auto;}
	return fhInputPlayerSetAuto(playerNum);
}