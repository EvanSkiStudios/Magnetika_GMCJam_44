function fhInputRumbleDisable()
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputRumbleDisable()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	if(global.__fhInputRumbleEnabled)
	{
		__fhInputObjController.myPlayers[playerNum].rumbleEnabled = false;
	}
	return true;
}

function fhi_rumble_disable()
{
	if(false){return fhi_rumble_disable};
	return fhInputRumbleDisable();
}