function fhAudioCategoryStop(category, _fadeTime = 0)
{
	/// @param category
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioCategoryStop()");
		__fhAudioAssertArgumentNotUndefined("fhAudioCategoryStop()", "category", category);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("Called fhAudioCategoryStop() with a non-existent category.");
		}
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioCategoryStop() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		var array = variable_struct_get_names(playingSoundsMap);
		var size = array_length(array);
		for(var i = 0; i < size; i++)
		{
			if(playingSoundsMap[$ array[i]].myCategory == category)
			{
				if(_fadeTime>0)
				{
					audio_sound_gain(playingSoundsMap[$ array[i]].mySound, 0, _fadeTime);
					var fading = new __fhAudioFadingSound(playingSoundsMap[$ array[i]].mySound, _fadeTime);
					array_push(__fhAudioObjController.fadingSoundsList, fading);
				}
				else
				{
					audio_stop_sound(playingSoundsMap[$ array[i]].mySound);
				}
				variable_struct_remove(playingSoundsMap, array[i]);
			}
		}
	}
	return true;
}

function fha_category_stop(category, _fadeTime = 0)
{
	/// @param category
	
	if(false){return fha_category_stop;}
	return fhAudioCategoryStop(category, _fadeTime);
}