
function fhInputPlayerActionsInputMissing(playerNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionsInputMissing()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	for(var i = 0; i < global.__fhInputNumActions; i++)
	{
		if(fhInputPlayerActionInputMissing(playerNum, i))
			return true;
	}
	return false;
}

function fhi_player_actions_input_missing(playerNum)
{
	if(false){return fhi_player_actions_input_missing;}
	return fhInputPlayerActionsInputMissing(playerNum);
}