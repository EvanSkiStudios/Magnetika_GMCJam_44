function fhAudioCategoryResume(category, _fadeTime = 1000)
{
	/// @param category
	/// @param _fadeTime=1000
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioCategoryResume()");
		__fhAudioAssertArgumentNotUndefined("fhAudioCategoryResume()", "category", category);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioCategoryResume() called with a non-existent category.");
		}
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioCategoryResume() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		var array = variable_struct_get_names(playingSoundsMap);
		var size = array_length(array);
		for(var i = 0; i < size; i++)
		{
			if(playingSoundsMap[$ array[i]].myCategory == category)
			{
				__fhAudioSoundResume(playingSoundsMap[$ array[i]].mySound, _fadeTime);
			}
		}
	}
	return true;
}

function fha_category_resume(category, _fadeTime = 1000)
{
	/// @param category
	/// @param _fadeTime=0
	
	if(false){return fha_category_resume;}
	return fhAudioCategoryResume(category, _fadeTime);
}