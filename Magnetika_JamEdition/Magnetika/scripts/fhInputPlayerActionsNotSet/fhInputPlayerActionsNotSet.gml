
function fhInputPlayerActionsNotSet(playerNum)
{
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

function fhi_player_actions_not_set(playerNum)
{
	if(false){return fhi_player_actions_not_set;}
	return fhInputPlayerActionsNotSet(playerNum);
}