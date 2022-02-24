function fhInputRumbleEnable()
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputRumbleEnable()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	if(global.__fhInputRumbleEnabled)
	{
		__fhInputObjController.myPlayers[playerNum].rumbleEnabled = true;
	}
	return true;
}

function fhi_rumble_enable()
{
	if(false){return fhi_rumble_enable};
	return fhInputRumbleEnable();
}