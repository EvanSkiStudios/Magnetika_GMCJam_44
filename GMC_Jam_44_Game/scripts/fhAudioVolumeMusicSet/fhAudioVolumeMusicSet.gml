function fhAudioVolumeMusicSet(newVolume, _time = 0)
{
	/// @param newVolume
	/// @param _time=0
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeMusicSet()");
		__fhAudioAssertArgumentNotUndefined("fhAudioVolumeMusicSet()", "newVolume", newVolume);
		if(_time < 0)
			__fhAudioThrowError("Called fhAudioVolumeMusicSet() with negative '_time' argument.");
		if(newVolume > 1 || newVolume < 0)
		{
			__fhAudioThrowError("Called fhAudioVolumeMusicSet() with the volume parameter either below 0 or above 1.")
		}
	}
	with(__fhAudioObjController)
	{
		musicVolume = newVolume;
		setRealVolumes();
		switch(musicStatus)
		{
			case __FHAUDIO_STATUS_CROSSFADING:
			case __FHAUDIO_STATUS_SWAPFADING:
				audio_sound_gain(currentMusicRef, realMusicVolume, _time+FHAUDIO_VOLUMEFIX_TIME);
				break;
			case __FHAUDIO_STATUS_PLAYING:
			case __FHAUDIO_STATUS_PAUSED:
				audio_sound_gain(currentMusicRef, realMusicVolume, _time);
				break;
		}
	}
	if(FHAUDIO_AUTOSAVE_SETTINGS)
		__fhAudioSaveVolumes();
	return true;
}

function fha_volume_music_set(newVolume, _time = 0)
{
	/// @param newVolume
	/// @param _time=0
	
	if(false){return fha_volume_music_set;}
	return fhAudioVolumeMusicSet(newVolume, _time);
}