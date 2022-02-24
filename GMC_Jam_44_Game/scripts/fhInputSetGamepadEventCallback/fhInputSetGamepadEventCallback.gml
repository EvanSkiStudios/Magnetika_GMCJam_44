
function fhInputSetGamepadEventCallback(callback)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputSetGamepadEventCallback()";
		__fhInputAssertInitialization(str);
	}
	__fhInputObjController.myGPEventCallback = callback;
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputSetGamepadEventCallback() was called.");
	}
	return true;
}

function fhi_set_gamepad_event_callback(callback)
{
	if(false){return fhi_set_gamepad_event_callback;}
	return fhInputSetGamepadEventCallback(callback);
}