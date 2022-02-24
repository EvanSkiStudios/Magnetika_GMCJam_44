
function fhInputPlayerActionMapSwitch(playerNum1, actionNum1, playerNum2, actionNum2)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapSwitch()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum1);
		__fhInputAssertValidPlayer(str, playerNum2);
		__fhInputAssertValidAction(str, actionNum1);
		__fhInputAssertValidAction(str, actionNum2);
	}
	var map1 = fhInputPlayerActionMapGetStruct(playerNum1, actionNum1);
	var map2 = fhInputPlayerActionMapGetStruct(playerNum2, actionNum2);
	fhInputPlayerActionMapSetStruct(playerNum1, actionNum1, map2);
	fhInputPlayerActionMapSetStruct(playerNum2, actionNum2, map1);
	return true;
}

function fhi_player_action_map_switch(playerNum1, actionNum1, playerNum2, actionNum2)
{
	if(false){return fhi_player_action_map_switch;}
	return fhInputPlayerActionMapSwitch(playerNum1, actionNum1, playerNum2, actionNum2);
}