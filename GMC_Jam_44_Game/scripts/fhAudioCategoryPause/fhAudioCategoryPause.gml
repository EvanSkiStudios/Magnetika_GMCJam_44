function fhAudioCategoryPause(category, _fadeTime = 1000)
{
	/// @param category
	/// @param _fadeTime=1000
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioCategoryPause()");
		__fhAudioAssertArgumentNotUndefined("fhAudioCategoryPause()", "category", category);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioCategoryPause() called with a non-existent category.");
		}
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioCategoryPause() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		var array = variable_struct_get_names(playingSoundsMap);
		var size = array_length(array);
		for(var i = 0; i < size; i++)
		{
			if(playingSoundsMap[$ array[i]].myCategory == category)
			{
				__fhAudioSoundPause(playingSoundsMap[$ array[i]].mySound, _fadeTime);
			}
		}
	}
	return true;
}

function fha_category_pause(category, _fadeTime = 1000)
{
	/// @param category
	/// @param _fadeTime=1000
	
	if(false){return fha_category_pause;}
	return fhAudioCategoryPause(category, _fadeTime);
}