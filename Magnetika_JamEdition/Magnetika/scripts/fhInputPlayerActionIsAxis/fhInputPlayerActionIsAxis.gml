
function fhInputPlayerActionIsAxis(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionIsAxis()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].isAxis;
}

function fhi_player_action_is_axis(playerNum, actionNum)
{
	if(false){return fhi_player_action_is_axis;}
	return fhInputPlayerActionIsAxis(playerNum, actionNum);
}