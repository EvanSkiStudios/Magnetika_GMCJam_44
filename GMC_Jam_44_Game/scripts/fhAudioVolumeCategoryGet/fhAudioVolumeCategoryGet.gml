function fhAudioVolumeCategoryGet(category)
{
	/// @param category
	
	if(false){return argument[0];}
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeCategoryGet()");
		__fhAudioAssertArgumentNotUndefined("fhAudioVolumeCategoryGet()", "category", category);
		if(category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioVolumeCategoryGet() called with a non-existent category.");
		}
	}
	return __fhAudioGetCategoryVolume(category);
}

function fha_volume_category_get(category)
{
	/// @param category
	
	if(false){return argument[0];}
	if(false){return fha_volume_category_get;}
	return fhAudioVolumeCategoryGet(category);
}