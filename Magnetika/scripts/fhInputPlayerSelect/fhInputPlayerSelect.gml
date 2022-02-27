function fhInputPlayerSelect(playerNum)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		str = "fhInputPlayerSelect()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	global.__fhInputSelectedPlayer = playerNum;
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputPlayerSelect() selected player #", playerNum, ".");
	}
	return true;
}

function fhi_player_select(playerNum)
{
	if(false){return fhi_player_select;}
	return fhInputPlayerSelect(playerNum);
}