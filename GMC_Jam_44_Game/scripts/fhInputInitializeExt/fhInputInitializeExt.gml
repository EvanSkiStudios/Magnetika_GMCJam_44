
function fhInputInitializeExt(numPlayers, numActions, allowConflicts)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		if(instance_exists(__fhInputObjController))
		{
			__fhInputDebugLog("FHINPUT: You called fhInputInitializeExt() but the system is already initialized.");
		}
	}
	if(numPlayers < 1)
		return false;
	if(numActions < 1)
		return false;
	global.__fhInputNumPlayers = numPlayers;
	global.__fhInputNumActions = numActions;
	global.__fhInputAllowConflicts = allowConflicts;
	instance_create_depth(0, 0, 0, __fhInputObjController);
	global.__fhInputIsInitialized = true;
	return true;
}

function fhi_initialize_ext(numPlayers, numActions, allowConflicts)
{
	if(false){return fhi_initialize_ext;}
	return fhInputInitializeExt(numPlayers, numActions, allowConflicts);
}