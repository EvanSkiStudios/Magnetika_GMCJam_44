function fhAudioSoundPlayQuick(sounds, _looped = false, _pitchVariance = 0, _volumeVariance = 0)
{
	/// @param sound
	/// @param _looped=false
	/// @param _pitchVariance=0
	/// @param _volumeVariance=0
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertArgumentNotUndefined("fhAudioSoundPlayQuick()", "sounds", sounds);
		if(is_array(sounds))
		{
			for(var i = 0; i < array_length(sounds)-1; i++)
			{
				if(audio_get_name(sounds[i])==undefined)
				{
					__fhAudioThrowError("Called fhAudioSoundPlayQuick() with an invalid value in the sounds variable array argument, must only be a sound asset or an array of sound assets.");
				}
			}
		}
		else
		{
			if(audio_get_name(sounds)==undefined)
			{
				__fhAudioThrowError("Called fhAudioSoundPlayQuick() with an invalid value in the sounds argument, must only be a sound asset or an array of sound assets.");
			}
		}
		if(_looped != true && _looped != false)
		{
			__fhAudioThrowError("Called fhAudioSoundPlayQuick() with an invalid loop argument, must be true or false.");
		}
	}
	var soundToPlay;
	if(is_array(sounds))
	{
		var index = irandom_range(0, array_length(sounds)-1);
		soundToPlay = sounds[index];
	}
	else
	{
		soundToPlay = sounds;
	}
	var pitch = random_range(1-_pitchVariance, 1+_pitchVariance);
	var volume = random_range(1-_volumeVariance, 1+_pitchVariance);
	var ref = audio_play_sound(soundToPlay, 1, _looped);
	audio_sound_gain(ref, volume, 0);
	audio_sound_pitch(ref, pitch);
	return ref;
}

function fha_sound_play_quick(sounds, _looped = false, _pitchVariance = 0, _volumeVariance = 0)
{
	/// @param sound
	/// @param _looped=false
	/// @param _pitchVariance=0
	/// @param _volumeVariance=0
	
	if(false){return fha_sound_play_quick;}
	return fhAudioSoundPlayQuick(sounds, _looped, _pitchVariance, _volumeVariance);
}