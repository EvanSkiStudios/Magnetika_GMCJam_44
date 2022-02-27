function fhAudioSoundPlay3d(sound, posX, posY, posZ, falloffStart, falloffEnd, _looped = false, _falloffFactor = 1)
{
	/// @param sound
	/// @param posX
	/// @param posY
	/// @param posZ
	/// @param falloffStart
	/// @param falloffEnd
	/// @param _looped=false
	/// @param _falloffFactor=1
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioSoundPlay3d()");
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "sound", sound);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "posX", posX);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "posY", posY);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "posZ", posZ);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "falloffStart", falloffStart);
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlay3d()", "falloffEnd", falloffEnd);
		if(!is_string(sound))
			__fhAudioThrowError("Called fhAudioSoundPlay3d() with an invalid sound.");
		if(__fhAudioObjController.soundList[$ sound] == undefined)
		{
			__fhAudioThrowError("Called fhAudioSoundPlay3d() with an invalid sound.");
		}
	}
	var newSound = __fhAudioObjController.soundList[$ sound].playSound(_looped, undefined, posX, posY, posZ, falloffStart, falloffEnd, _falloffFactor);
	if(_looped)
	{
		var add = new __fhAudioPlayingSound(newSound, __fhAudioObjController.soundList[$ sound].myCategory);
		__fhAudioObjController.playingSoundsMap[$ string(newSound)] = add;
	}
	return newSound;
}

function fha_sound_play_3d(sound, posX, posY, posZ, falloffStart, falloffEnd, _looped = false, _falloffFactor = 1)
{
	/// @param sound
	/// @param posX
	/// @param posY
	/// @param posZ
	/// @param falloffStart
	/// @param falloffEnd
	/// @param _looped=false
	/// @param _falloffFactor=1
	
	if(false){return fha_sound_play_3d;}
	return fhAudioSoundPlay3d(sound, posX, posY, posZ, falloffStart, falloffEnd, _looped, _falloffFactor);
}