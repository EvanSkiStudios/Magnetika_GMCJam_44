function fhAudioVolumeCategorySet(category, newVolume, _time = 0)
{
	/// @param category
	/// @param newVolume
	/// @param _time=0
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeCategorySet()");
		__fhAudioAssertArgumentNotUndefined("fhAudioVolumeCategorySet()", "category", category);
		__fhAudioAssertArgumentNotUndefined("fhAudioVolumeCategorySet()", "newVolume", newVolume);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioVolumeCategorySet() called with a non-existent category.");
		}
		if(_time < 0)
			__fhAudioThrowError("Called fhAudioVolumeCategorySet() with negative '_time' argument.");
		if(newVolume > 1 || newVolume < 0)
		{
			__fhAudioThrowError("You called fhAudioVolumeCategorySet() with the volume parameter either below 0 or above 1.")
		}
	}
	with(__fhAudioObjController)
	{
		soundCategoryVolumes[category] = newVolume;
		setRealVolumes();
		var array = variable_struct_get_names(playingSoundsMap);
		var size = array_length(array);
		if(array_length(array) > 0)
		{
			for(var i = 0; i < size; i++)
			{
				if(playingSoundsMap[$ array[i]].myCategory == category)
				{
					audio_sound_gain(playingSoundsMap[$ array[i]].mySound, realCategoryVolumes[category], _time);
				}
			}
		}
	}
	if(FHAUDIO_AUTOSAVE_SETTINGS)
		__fhAudioSaveVolumes();
	return true;
}

function fha_volume_category_set(category, newVolume, _time = 0)
{
	/// @param category
	/// @param newVolume
	/// @param _time=0
	
	if(false){return fha_volume_category_set;}
	return fhAudioVolumeCategorySet(category, newVolume, _time);
}