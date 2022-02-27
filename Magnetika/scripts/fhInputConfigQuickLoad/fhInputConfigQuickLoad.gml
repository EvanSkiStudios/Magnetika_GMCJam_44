
function fhInputConfigQuickLoad(filename)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputConfigQuickLoad()";
		__fhInputAssertInitialization(str);
	}
	if(file_exists(filename))
	{
		var file = file_text_open_read(filename);
		var numPlayers = real(file_text_read_string(file));
		file_text_readln(file);
		var numActions = real(file_text_read_string(file));
		if(FHINPUT_SETTING_DebugMode)
		{
			if(numPlayers != global.__fhInputNumPlayers)
				__fhInputThrowError("Attempted to load quicksave file with wrong number of players.");
			if(numActions != global.__fhInputNumActions)
				__fhInputThrowError("Attempted to load quicksave file with wrong number of actions.");
		}
		for(var i = 0; i < numPlayers; i++)
		{
			file_text_readln(file);
			var str = file_text_read_string(file);
			fhInputPlayerActionMapSet(i, str);
		}
		file_text_close(file);
	}
	else
	{
		__fhInputDebugLog("fhInputConfigQuickLoad(): Specified file was not found at ", filename, ".");
		return false;
	}
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("fhInputConfigQuickLoad() loaded quicksave file from ", filename, ".");
	}
	return true;
}

function fhi_config_quick_load(filename)
{
	if(false){return fhi_config_quick_load;}
	fhInputConfigQuickLoad(filename);
}