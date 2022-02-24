
function __fhAudioSaveVolumes()
{
	if(file_exists(__FHAUDIO_VOLUMES_FILE))
	{
		file_delete(__FHAUDIO_VOLUMES_FILE);
	}
	var file = file_text_open_write(__FHAUDIO_VOLUMES_FILE);
	file_text_write_string(file, __FHAUDIO_MAGIC_STRING);
	file_text_writeln(file);
	file_text_write_string(file, string(FHAUDIO_NUMBER_SOUND_CATEGORIES));
	file_text_writeln(file);
	file_text_write_string(file, string(__fhAudioObjController.masterVolume));
	file_text_writeln(file);
	file_text_write_string(file, string(__fhAudioObjController.musicVolume));
	for(var i = 0; i < FHAUDIO_NUMBER_SOUND_CATEGORIES; i++)
	{
		file_text_writeln(file);
		file_text_write_string(file, string(__fhAudioObjController.soundCategoryVolumes[i]));
	}
	file_text_close(file);
}

function __fhAudioLoadVolumes()
{
	if(!file_exists(__FHAUDIO_VOLUMES_FILE))
	{
		if(FHAUDIO_DEBUGMODE)
		{
			__fhAudioDebugLog("Volumes file doesn't exist...recreating from default.");
		}
		return false;
	}
	var file = file_text_open_read(__FHAUDIO_VOLUMES_FILE);
	var str = file_text_read_string(file);
	if(str != __FHAUDIO_MAGIC_STRING)
	{
		__fhAudioDebugLog("Volumes file is corrupt...recreating from default.");
		file_text_close(file);
		return false;
	}
	file_text_readln(file);
	str = file_text_read_string(file);
	if(real(str) != FHAUDIO_NUMBER_SOUND_CATEGORIES)
	{
		__fhAudioDebugLog("Volumes file has wrong number of categories(Did you change the amount?)...recreating from default.");
		file_text_close(file);
		return false;
	}
	file_text_readln(file);
	str = file_text_read_string(file);
	__fhAudioObjController.masterVolume = real(str);
	file_text_readln(file);
	str = file_text_read_string(file);
	__fhAudioObjController.musicVolume = real(str);
	for(var i = 0; i < FHAUDIO_NUMBER_SOUND_CATEGORIES; i++)
	{
		file_text_readln(file);
		str = file_text_read_string(file);
		__fhAudioObjController.soundCategoryVolumes[i] = real(str);
	}
	file_text_close(file);
	return true;
}