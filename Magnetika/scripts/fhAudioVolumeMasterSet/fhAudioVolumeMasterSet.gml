function fhAudioVolumeMasterSet(newVolume, _time = 0)
{
	/// @param newVolume
	/// @param _time=0
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeMasterSet()");
		__fhAudioAssertArgumentNotUndefined("fhAudioVolumeMasterSet()", "newVolume", newVolume);
		if(_time != 0)
			if(_time < 0)
				__fhAudioThrowError("Called fhAudioVolumeMasterSet() with negative '_time' argument.");
		if(newVolume>1 || newVolume < 0)
		{
			__fhAudioThrowError("You called fhAudioVolumeMasterSet() with the volume parameter either below 0 or above 1.")
		}
	}
	with(__fhAudioObjController)
	{
		masterVolume = newVolume;
		setRealVolumes();
	}
	fhAudioVolumeMusicSet(__fhAudioObjController.musicVolume, _time);
	for(var i = 0; i < FHAUDIO_NUMBER_SOUND_CATEGORIES; i++)
	{
		fhAudioVolumeCategorySet(i, __fhAudioObjController.soundCategoryVolumes[i]);
	}
	if(FHAUDIO_AUTOSAVE_SETTINGS)
		__fhAudioSaveVolumes();
	return true;
}

function fha_volume_master_set(newVolume, _time = 0)
{
	/// @param newVolume
	/// @param _time=0
	
	if(false){return fha_volume_master_set;}
	return fhAudioVolumeMasterSet(newVolume, _time);
}