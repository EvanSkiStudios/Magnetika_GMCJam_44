
function fhInputPlayerActionDescriptionGetShort(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionDescriptionGetShort()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].shortDescription;
}

function fhi_player_action_description_get_short(playerNum, actionNum)
{
	if(false){return fhi_player_action_description_get_short;}
	return fhInputPlayerActionDescriptionGetShort(playerNum, actionNum);
}