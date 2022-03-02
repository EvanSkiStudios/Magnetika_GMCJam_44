
function fhInputSystemActionsNotSet()
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputSystemActionsNotSet()";
		__fhInputAssertInitialization(str);
	}
	for(var i = 0; i < global.__fhInputNumPlayers; i++)
	{
		if(fhInputPlayerActionsNotSet(i))
			return true;
	}
	return false;
}

function fhi_system_actions_not_set()
{
	if(false){return fhi_system_actions_not_set;}
	return fhInputSystemActionsNotSet();
}