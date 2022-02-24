
function fhInputActionDescriptionGetLong(actionNum)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionDescriptionGetLong()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	return __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum].longDescription;
}

function fhi_action_description_get_long(actionNum)
{
	if(false){return fhi_action_description_get_long;}
	return fhInputActionDescriptionGetLong(actionNum);
}