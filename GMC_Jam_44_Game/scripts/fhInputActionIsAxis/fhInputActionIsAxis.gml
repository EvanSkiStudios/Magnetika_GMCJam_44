
function fhInputActionIsAxis(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionIsAxis()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].isAxis;
}

function fhi_action_is_axis(actionNum)
{
	if(false){return fhi_action_is_axis;}
	return fhInputActionIsAxis(actionNum);
}