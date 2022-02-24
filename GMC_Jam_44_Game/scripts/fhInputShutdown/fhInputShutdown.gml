
function fhInputShutdown()
{
	if(FHINPUT_SETTING_DebugMode)
	{
		if(!instance_exists(__fhInputObjController))
		{
			__fhInputDebugLog("FHINPUT: You called fhInputShutdown() but the system is not currently initialized.");
		}
	}
	with(__fhInputObjController)
		instance_destroy();
	return true;
}

function fhi_shutdown()
{
	if(false){return fhi_shutdown;}
	return fhInputShutdown();
}