function fhInputActionMapStopSearch()
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapStopSearch()";
		__fhInputAssertInitialization(str);
	}
	__fhInputObjController.mySearching = false;
	__fhInputObjController.mySearchingGamepad = false;
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputActionMapStopSearch() stopped an action map search.");
	}
	return true;
}

function fhi_action_map_stop_search()
{
	if(false){return fhi_action_map_stop_search;}
	return fhInputActionMapStopSearch();
}