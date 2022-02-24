
function fhInputPlayerActionDescriptionGetLong(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionDescriptionGetLong()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].longDescription;
}

function fhi_player_action_description_get_long(playerNum, actionNum)
{
	if(false){return fhi_player_action_description_get_long;}
	return fhInputPlayerActionDescriptionGetLong(playerNum, actionNum);
}