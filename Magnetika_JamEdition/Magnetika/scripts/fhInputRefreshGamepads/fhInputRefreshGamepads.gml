
function fhInputRefreshGamepads()
{
	if(FHINPUT_SETTING_DebugMode)
	{
		if(!instance_exists(__fhInputObjController))
		{
			__fhInputDebugLog("FHINPUT: You called fhInputRefreshGamepads() but the system is not currently initialized.");
		}
	}
	with(__fhInputObjController)
	{
		myGPList = new __fhInputGPList();
		for(var i = 0; i < FHINPUT_SETTING_MaxGamepadID; i++)
		{
			if(gamepad_is_connected(i))
			{
				myGPList.addID(i);
			}
		}
	}
	__fhInputFixGUIDs();
	__fhInputFixAllDescriptions();
	return true;
}

function fhi_refresh_gamepads()
{
	if(false){return fhi_refresh_gamepads;}
	return fhInputRefreshGamepads();
}