
function fhInputConfigQuickSave(filename)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputConfigQuickSave()";
		__fhInputAssertInitialization(str);
	}
	if(file_exists(filename))
		file_delete(filename);
	var file = file_text_open_write(filename);
	if(file)
	{
		file_text_write_string(file, string(global.__fhInputNumPlayers));
		file_text_writeln(file);
		file_text_write_string(file, string(global.__fhInputNumActions));
		for(var i = 0; i < global.__fhInputNumPlayers; i++)
		{
			file_text_writeln(file);
			var str = fhInputPlayerActionMapGet(i);
			file_text_write_string(file, str);
		}
		file_text_close(file);
	}
	else
	{
		__fhInputDebugLog("fhInputConfigQuickSave(): Specified file could not be created at ", filename, ".");
		return false;
	}
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("fhInputConfigQuickSave() saved quicksave file to ", filename, ".");
	}
	return true;
}

function fhi_config_quick_save(filename)
{
	if(false){return fhi_config_quick_save;}
	return fhInputConfigQuickSave(filename);
}