
function fhInputPlayerActionMapSearch(playerNum, actionNum, callback, _overrideCurrentSearching = false)
{
	if(_overrideCurrentSearching != true)
		_overrideCurrentSearching = false;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionMapSearch()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
	}
	if(_overrideCurrentSearching)
	{
		if(__fhInputObjController.mySearching)
		{
			fhInputActionMapStopSearch();
		}
		__fhInputObjController.mySearchingGamepad = false;
	}
	else
	{
		if(__fhInputObjController.mySearching || __fhInputObjController.mySearchingGamepad)
		{
			__fhInputDebugLog("FHINPUT: You called fhInputPlayerActionMapSearch() before a previous search had finished.");
			return false;
		}
	}
	__fhInputStartSearch(playerNum, actionNum, callback);
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputPlayerActionMapSearch() started a search for player ", playerNum, "'s action number ", actionNum, ".");
	}
	return true;
}

function fhi_player_action_map_search(playerNum, actionNum, callback, _overrideCurrentSearching = false)
{
	if(false){return fhi_player_action_map_search;}
	return fhInputPlayerActionMapSearch(playerNum, actionNum, callback, _overrideCurrentSearching);
}