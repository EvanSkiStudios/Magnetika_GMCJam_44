
function fhInputActionSetManual(actionNum, value)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionSetManual()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		__fhInputAssertValidAction(str, actionNum);
		if(value < 0 || value > 1)
			__fhInputThrowError("Called fhInputActionSetManual() with input not between ZERO and ONE inclusive.");
		if(__fhInputObjController.myPlayers[playerNum].myIsAutomatic)
			__fhInputThrowError("Called fhInputActionSetManual() on a player that is set to use automatic inputs.");
	}
	__fhInputObjController.myPlayers[playerNum].myActionStatus[actionNum].rawValue = value;
	return true;
}

function fhi_action_set_manual(actionNum, value)
{
	if(false){return fhi_action_set_manual;}
	return fhInputActionSetManual(actionNum, value);
}