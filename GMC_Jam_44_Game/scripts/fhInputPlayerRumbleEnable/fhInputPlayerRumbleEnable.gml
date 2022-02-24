function fhInputPlayerRumbleEnable(playerNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputPlayerRumbleEnable()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	if(global.__fhInputRumbleEnabled)
	{
		__fhInputObjController.myPlayers[playerNum].rumbleEnabled = true;
	}
	return true;
}

function fhi_player_rumble_enable(playerNum)
{
	if(false){return fhi_player_rumble_enable};
	return fhInputPlayerRumbleEnable(playerNum);
}