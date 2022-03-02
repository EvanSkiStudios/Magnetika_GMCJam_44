function fhAudioSoundCreate(name, _category = 0, _tracks = undefined, _pitchVariance = 0, _volumeVariance = 0, _behavior = FHAUDIO_CHOOSE_RANDOM)
{
	/// @param name
	/// @param _category=0
	/// @param _tracks=undefined
	/// @param _pitchVariance=0
	/// @param _volumeVariance=0
	/// @param _behavior=FHAUDIO_CHOOSE_RANDOM
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioCreateSound()");
		if(!is_string(name))
			__fhAudioThrowError("Called fhAudioSoundCreate() with a non-string name argument.");
		if(_tracks!=undefined)
		{
			if(is_array(_tracks))
			{
				for(var i = 0; i < array_length(_tracks)-1; i++)
				{
					if(audio_get_name(_tracks[i])==undefined)
					{
						__fhAudioThrowError("Called fhAudioSoundCreate() with an invalid value in the sounds variable array argument, must only be a sound asset or an array of sound assets.");
					}
				}
			}
			else
			{
				if(audio_get_name(_tracks)==undefined)
				{
					__fhAudioThrowError("Called fhAudioSoundCreate() with an invalid value in the sounds argument, must only be a sound asset or an array of sound assets.");
				}
			}
		}
		if(_behavior != undefined)
		{
			if((_behavior != FHAUDIO_CHOOSE_RANDOM) &&
				(_behavior != FHAUDIO_CHOOSE_RANDOM_NOT_REPEATED) &&
				(_behavior!= FHAUDIO_CHOOSE_SEQUENCE))
			{
				__fhAudioThrowError("Called fhAudioSoundCreate() with an invalid '_behavior' argument.");
			}
		}
	}
	if(FHAUDIO_DEBUGMODE)
	{
		if(_category >= FHAUDIO_NUMBER_SOUND_CATEGORIES)
		{
			__fhAudioThrowError("fhAudioCreateSound() called with a non-existent category.");
		}
	}
	var newSound = new __fhAudioSound(_category);
	if(_tracks != undefined)
	{
		if(is_array(_tracks))
		{
			for(var i = 0; i < array_length(_tracks); i++)
			{
				newSound.addTrack(_tracks[i]);
			}
		}
		else
			newSound.addTrack(_tracks);
	}
	newSound.setPitchVariance(_pitchVariance);
	newSound.setVolumeVariance(_volumeVariance);
	newSound.setBehavior(_behavior);
	with(__fhAudioObjController)
	{
		soundList[$ name] = newSound;
		soundIndexList[soundNumber] = name;
		soundNumber++;
	}
	return true;
}

function fha_sound_create(name, _category = 0, _tracks = undefined, _pitchVariance = 0, _volumeVariance = 0, _behavior = FHAUDIO_CHOOSE_RANDOM)
{
	/// @param _category=0
	/// @param _tracks=undefined
	/// @param _pitchVariance=0
	/// @param _volumeVariance=0
	/// @param _behavior=FHAUDIO_CHOOSE_RANDOM
	
	if(false){return fha_sound_create;}
	return fhAudioSoundCreate(name, _category, _tracks, _pitchVariance, _volumeVariance, _behavior);
}