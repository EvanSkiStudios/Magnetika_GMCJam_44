function fhInputRumbleSetManual(leftMotor, rightMotor)
{
	var playerNum = global.__fhInputSelectedPlayer;
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputRumbleSetManual()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
		if(leftMotor > 1 || leftMotor < 0 || rightMotor > 1 || rightMotor < 0)
			__fhInputThrowError("Called fhInputRumbleSetManual() with out of range motor argument");
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

function fhi_rumble_set_manual(leftMotor, rightMotor)
{
	if(false){return fhi_rumble_set_manual};
	return fhInputRumbleSetManual(leftMotor, rightMotor);
}