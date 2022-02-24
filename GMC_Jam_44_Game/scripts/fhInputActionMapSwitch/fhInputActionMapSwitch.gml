
function fhInputActionMapSwitch(actionNum1, actionNum2)
{
	var playerNum1 = global.__fhInputSelectedPlayer;
	var playerNum2 = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapSwitch()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum1);
		__fhInputAssertValidPlayer(str, playerNum2);
	}
	
	var map1 = fhInputPlayerActionMapGetStruct(playerNum1, actionNum1);
	var map2 = fhInputPlayerActionMapGetStruct(playerNum2, actionNum2);
	fhInputPlayerActionMapSetStruct(playerNum1, actionNum1, map2);
	fhInputPlayerActionMapSetStruct(playerNum2, actionNum2, map1);
	return true;
}

function fhi_action_map_switch(actionNum1, actionNum2)
{
	if(false){return fhi_action_map_switch;}
	return fhInputActionMapSwitch(actionNum1, actionNum2);
}