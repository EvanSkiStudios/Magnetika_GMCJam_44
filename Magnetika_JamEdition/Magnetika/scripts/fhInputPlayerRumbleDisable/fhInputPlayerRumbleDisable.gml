function fhInputPlayerRumbleDisable(playerNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputPlayerRumbleDisable()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	if(global.__fhInputRumbleEnabled)
	{
		__fhInputObjController.myPlayers[playerNum].rumbleEnabled = false;
	}
	return true;
}

function fhi_player_rumble_disable(playerNum)
{
	if(false){return fhi_player_rumble_disable};
	return fhInputPlayerRumbleDisable(playerNum);
}