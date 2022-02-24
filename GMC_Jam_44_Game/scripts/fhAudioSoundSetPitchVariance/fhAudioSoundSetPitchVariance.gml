function fhAudioSoundSetPitchVariance(sound, variance)
{
	/// @param sound
	/// @param variance
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundSetPitchVariance()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetPitchVariance()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetPitchVariance()", "variance", variance);
		if(!is_string(sound))
			__fhAudioThrowError("Called fhAudioSoundSetPitchVariance() with an invalid sound.");
		if(__fhAudioObjController.soundList[$ sound] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundSetPitchVariance() with an invalid sound.");
		}
	}
	__fhAudioObjController.soundList[$ sound].setPitchVariance(variance);
	return true;
}

function fha_sound_set_pitch_variance(sound, variance)
{
	/// @param sound
	/// @param variance
	
	if(false){return fha_sound_set_pitch_variance;}
	return fhAudioSoundSetPitchVariance(sound, variance);
}