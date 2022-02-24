function fhInputActionsNotSet()
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionsNotSet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	for(var i = 0; i < global.__fhInputNumActions; i++)
	{
		if(fhInputPlayerActionNotSet(playerNum, i))
			return true;
	}
	return false;
}

function fhi_actions_not_set()
{
	if(false){return fhi_actions_not_set;}
	return fhInputActionsNotSet();
}