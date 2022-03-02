
function fhInputActivate()
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActivate()";
		__fhInputAssertInitialization(str);
	}
	instance_activate_object(__fhInputObjController);
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputActivate() was called.");
	}
	return true;
}

function fhi_activate()
{
	if(false){return fhi_activate;}
	return fhInputActivate();
}