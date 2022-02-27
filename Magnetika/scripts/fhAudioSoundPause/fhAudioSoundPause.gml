function fhAudioSoundPause(sound, _fadeTime = 1000)
{
	/// @param sound
	/// @param _fadeTime=1000
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPause()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPause()", "sound", sound);
		var record = __fhAudioObjController.playingSoundsMap[$ string(sound)];
		if(record == undefined)
			__fhAudioThrowError("Called fhAudioSoundPause() with an invalid sound.");
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioSoundPause() with a negative fading time");
	}
	__fhAudioSoundPause(sound, _fadeTime);
	return true;
}

function fha_sound_pause(sound, _fadeTime = 1000)
{
	/// @param sound
	/// @param _fadeTime=1000
	
	if(false){return fha_sound_pause;}
	return fhAudioSoundPause(sound, _fadeTime);
}