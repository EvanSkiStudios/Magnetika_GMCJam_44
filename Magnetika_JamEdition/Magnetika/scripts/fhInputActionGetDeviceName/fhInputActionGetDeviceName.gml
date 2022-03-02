
function fhInputActionGetDeviceName(actionNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionGetDeviceName()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidAction(str, actionNum);
	}
	var playerNum = global.__fhInputSelectedPlayer;
	return fhInputPlayerActionGetDeviceName(playerNum, actionNum);
}

function fhi_action_get_device_name(actionNum)
{
	if(false){return fhi_action_get_device_name;}
	return fhInputActionGetDeviceName(actionNum);
}