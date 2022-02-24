function fhAudioSoundResume(sound, _fadeTime = 1000)
{
	/// @param sound
	/// @param _fadeTime=1000
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundResume()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundResume()", "sound", sound);
		var record = __fhAudioObjController.pausedSoundsMap[$ string(sound)];
		if(record == undefined)
			__fhAudioThrowError("Called fhAudioSoundResume() with an invalid sound.");
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioSoundResume() with a negative fading time.");
	}
	__fhAudioSoundResume(sound, _fadeTime);
	return true;
}

function fha_sound_resume(sound, _fadeTime = 1000)
{
	/// @param sound
	/// @param _fadeTime=1000
	
	if(false){return fha_sound_resume;}
	return fhAudioSoundResume(sound, _fadeTime);
}