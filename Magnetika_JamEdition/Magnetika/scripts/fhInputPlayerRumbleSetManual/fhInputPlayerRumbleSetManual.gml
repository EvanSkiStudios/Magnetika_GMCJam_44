function fhInputPlayerRumbleSetManual(playerNum, leftMotor, rightMotor)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputPlayerRumbleSetManual()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		if(leftMotor > 1 || leftMotor < 0 || rightMotor > 1 || rightMotor < 0)
			__fhInputThrowError("Called fhInputPlayerRumbleSetManual() with out of range motor argument");
	}
	if(global.__fhInputRumbleEnabled)
	{
		if(__fhInputObjController.myPlayers[playerNum].rumbleEnabled)
		{
			var gp = __fhInputObjController.myPlayers[playerNum].getAssignedGamepad();
			if(gp >= 0 && gp < 4)
			{
				gamepad_set_vibration(playerNum, leftMotor, rightMotor);
			}
		}
	}
	return true;
}

function fhi_player_rumble_set_manual(playerNum, leftMotor, rightMotor)
{
	if(false){return fhi_player_rumble_set_manual};
	return fhInputPlayerRumbleSetManual(playerNum, leftMotor, rightMotor);
}