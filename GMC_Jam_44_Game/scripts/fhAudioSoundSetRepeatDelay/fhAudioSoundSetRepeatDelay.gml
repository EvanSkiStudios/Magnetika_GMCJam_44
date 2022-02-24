function fhAudioSoundSetRepeatDelay(sound, delay)
{
	/// @param sound
	/// @param delay
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundSetRepeatDelay()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetRepeatDelay()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetRepeatDelay()", "delay", delay);
		if(!is_string(sound))
			__fhAudioThrowError("Called fhAudioSoundSetRepeatDelay() with an invalid sound.");
		if(__fhAudioObjController.soundList[$ sound] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundSetRepeatDelay() with an invalid sound.");
		}
	}
	__fhAudioObjController.soundList[$ sound].setRepeatDelay(delay);
	return true;
}

function fha_sound_set_repeat_delay(sound, delay)
{
	/// @param sound
	/// @param delay
	
	if(false){return fha_sound_set_repeat_delay;}
	return fhAudioSoundSetRepeatDelay(sound, delay);
}