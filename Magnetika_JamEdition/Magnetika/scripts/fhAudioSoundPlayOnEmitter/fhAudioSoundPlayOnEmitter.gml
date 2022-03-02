function fhAudioSoundPlayOnEmitter(sound, emitter, _looped = false)
{
	/// @param sound
	/// @param emitter
	/// @param _looped=false
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPlayOnEmitter()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlayOnEmitter()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlayOnEmitter()", "emitter", emitter);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("You called fhAudioSoundPlayOnEmitter() with a non-existent emitter");
		if(!is_string(sound))
			__fhAudioThrowError("Called fhAudioSoundPlayOnEmitter() with an invalid sound.");
		if(__fhAudioObjController.soundList[$ sound] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundPlayOnEmitter() with an invalid sound.");
		}
		
	}
	var newSound = __fhAudioObjController.soundList[$ sound].playSound(_looped, emitter);
	if(_looped)
	{
		var add = new __fhAudioPlayingSound(newSound, __fhAudioObjController.soundList[$ sound].myCategory);
		__fhAudioObjController.playingSoundsMap[$ string(newSound)] = add;
	}
	return newSound;
}

function fha_sound_play_on_emitter(sound, emitter, _looped = false)
{
	/// @param sound
	/// @param emitter
	/// @param _looped=false
	
	if(false){return fha_sound_play_on_emitter;}
	return fhAudioSoundPlayOnEmitter(sound, emitter, _looped);
}