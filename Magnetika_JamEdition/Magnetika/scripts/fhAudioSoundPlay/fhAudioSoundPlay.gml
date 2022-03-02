function fhAudioSoundPlay(sound, _looped = false)
{
	/// @param sound
	/// @param _looped=false
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPlay()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay()", "sound", sound);
		if(!is_string(sound))
			__fhAudioThrowError("Called fhAudioSoundPlay() with an invalid sound.");
		if(__fhAudioObjController.soundList[$ sound] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundPlay() with an invalid sound.");
		}
	}
	var newSound = __fhAudioObjController.soundList[$ sound].playSound(_looped);
	if(_looped)
	{
		var add = new __fhAudioPlayingSound(newSound, __fhAudioObjController.soundList[$ sound].myCategory);
		__fhAudioObjController.playingSoundsMap[$ string(newSound)] = add;
	}
	return newSound;
}

function fha_sound_play(sound, _looped = false)
{
	/// @param sound
	/// @param _looped=false
	
	if(false){return fha_sound_play;}
	return fhAudioSoundPlay(sound, _looped);
}