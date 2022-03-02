
function fhInputGetNextGamepadTouched(timeout, callback, _overrideCurrentSearching = false)
{
	if(_overrideCurrentSearching != true)
		_overrideCurrentSearching = false;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputGetNextGamepadTouched()";
		__fhInputAssertInitialization(str);
	}
	with(__fhInputObjController)
	{
		fhInputActionMapStopSearch();
		mySearchingGamepad = true;
		myCallbackGamepad = callback;
		myTimeLeft = timeout;
		myDelayTimeLeft = FHINPUT_SETTING_SearchDelay;
		myGPList.setAxes();
	}
	return true;
}

function fhi_get_next_gamepad_touched(timeout, callback, _overrideCurrentSearching = false)
{
	if(false){return fhi_get_next_gamepad_touched;}
	return fhInputGetNextGamepadTouched(timeout, callback, _overrideCurrentSearching);
}