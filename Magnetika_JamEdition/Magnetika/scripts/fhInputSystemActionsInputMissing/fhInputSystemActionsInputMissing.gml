
function fhInputSystemActionsInputMissing()
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputSystemActionsInputMissing()";
		__fhInputAssertInitialization(str);
	}
	for(var i = 0; i < global.__fhInputNumPlayers; i++)
	{
		if(fhInputPlayerActionsInputMissing(i))
			return true;
	}
	return false;
}

function fhi_system_actions_input_missing()
{
	if(false){return fhi_system_actions_input_missing;}
	return fhInputSystemActionsInputMissing();
}