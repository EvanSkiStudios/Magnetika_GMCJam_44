function fhAudioSoundSetVolumeVariance(sound, variance)
{
	/// @param sound
	/// @param variance
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundSetVolumeVariance()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetVolumeVariance()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetVolumeVariance()", "variance", variance);
		if(!is_string(sound))
			__fhAudioThrowError("Called fhAudioSoundSetVolumeVariance() with an invalid sound.");
		if(__fhAudioObjController.soundList[$ sound] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundSetVolumeVariance() with an invalid sound.");
		}
	}
	__fhAudioObjController.soundList[$ sound].setVolumeVariance(variance);
	return true;
}

function fha_sound_set_volume_variance(sound, variance)
{
	/// @param sound
	/// @param variance
	
	if(false){return fha_sound_set_volume_variance;}
	return fhAudioSoundSetVolumeVariance(sound, variance);
}