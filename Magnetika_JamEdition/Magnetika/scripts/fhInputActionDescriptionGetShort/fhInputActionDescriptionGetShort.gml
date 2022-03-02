
function fhInputActionDescriptionGetShort(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionDescriptionGetShort()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].shortDescription;
}

function fhi_action_description_get_short(actionNum)
{
	if(false){return fhi_action_description_get_short;}
	return fhInputActionDescriptionGetShort(actionNum);
}