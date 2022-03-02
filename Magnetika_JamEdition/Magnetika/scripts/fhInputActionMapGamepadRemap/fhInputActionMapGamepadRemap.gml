
function fhInputActionMapGamepadRemap(newGamepadID)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputActionMapGamepadRemap()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	var oldGamepadID = __fhInputObjController.myPlayers[playerNum].getAssignedGamepad();
	if(oldGamepadID == -1)
		return false;
	__fhInputRemapGamepad(playerNum, oldGamepadID, newGamepadID);
	return true;
}

function fhi_action_map_gamepad_remap(newGamepadID)
{
	if(false){return fhi_action_map_gamepad_remap;}
	return fhInputActionMapGamepadRemap(newGamepadID);
}