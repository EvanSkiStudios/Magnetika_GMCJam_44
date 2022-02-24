
function fhInputPlayerActionMapGetStruct(playerNum, actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionMapGetStruct()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	var _temp = new __fhInputActionConfig();
	var _temp2 = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum];
	_temp.deviceType = _temp2.deviceType;
	_temp.deviceID = _temp2.deviceID;
	_temp.input = _temp2.input;
	_temp.isAxis = _temp2.isAxis;
	_temp.shortDescription = _temp2.shortDescription;
	_temp.longDescription = _temp2.longDescription;
	_temp.numConflicts = _temp2.numConflicts;
	_temp.conflicts = _temp2.conflicts;
	return _temp;
}

function fhi_player_action_map_get_struct(playerNum, actionNum)
{
	if(false){return fhi_player_action_map_get_struct;}
	return fhInputPlayerActionMapGetStruct(playerNum, actionNum);
}