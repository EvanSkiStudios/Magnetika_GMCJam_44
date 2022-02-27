
function fhInputPlayerActionMapGamepadRemap(playerNum, newGamepadID)
{
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

function fhi_player_action_map_gamepad_remap(playerNum, newGamepadID)
{
	if(false){return fhi_player_action_map_gamepad_remap;}
	return fhInputPlayerActionMapGamepadRemap(playerNum, newGamepadID);
}