function fhAudioSoundSetBehavior(sound, behavior)
{
	/// @param sound
	/// @param behavior
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundSetBehavior()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetBehavior()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundSetBehavior()", "behavior", behavior);
		if(!is_string(sound))
			__fhAudioThrowError("Called fhAudioSoundAddSetBehavior() with an invalid sound.");
		if(__fhAudioObjController.soundList[$ sound] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundSetBehavior() with an invalid sound.");
		}
		if(behavior > (__FHAUDIO_NUM_CHOOSE_BEHAVIORS - 1))
		{
			__fhAudioThrowError("Called fhAudioSoundSetBehavior() with an invalid behavior argument.");
		}
	}
	__fhAudioObjController.soundList[$ sound].setBehavior(behavior);
	return true;
}

function fha_sound_set_behavior(sound, behavior)
{
	/// @param sound
	/// @param behavior
	
	if(false){return fha_sound_set_behavior;}
	return fhAudioSoundSetBehavior(sound, behavior);
}