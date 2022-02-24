function __fhAudioGetCategoryVolume(category)
{
	return __fhAudioObjController.realCategoryVolumes[category];
}

function __fhAudioSound(newCategoryID) constructor
{
	myCategory = newCategoryID;
	soundTracks = [];
	soundTrackLengths = [];
	amountOfTracks = 0;
	trackBehavior = FHAUDIO_CHOOSE_RANDOM;
	lastTrackPlayed = -1;
	pitchVariance = 0;
	volumeVariance = 0;
	repeatDelay = 0;
	lastPlayedTime = 0;
	static addTrack = function(soundAsset)
	{
		soundTracks[amountOfTracks] = soundAsset;
		soundTrackLengths[amountOfTracks] = audio_sound_length(soundAsset);
		amountOfTracks++;
	}
	static setBehavior = function(newBehavior)
	{
		trackBehavior = newBehavior;
	}
	static setPitchVariance = function(newPitchVariance)
	{
		pitchVariance = newPitchVariance;
	}
	static setVolumeVariance = function(newVolumeVariance)
	{
		volumeVariance = newVolumeVariance;
	}
	static setRepeatDelay = function(newRepeatDelay)
	{
		repeatDelay = newRepeatDelay;
	}
	static setVolume = function(soundID)
	{
		var variation = random_range(-volumeVariance, volumeVariance);
		audio_sound_gain(soundID, __fhAudioGetCategoryVolume(myCategory)+variation, 0);
	}
	static setPitch = function(soundID)
	{
		var variation = random_range(-pitchVariance, pitchVariance);
		audio_sound_pitch(soundID, 1+variation);
	}
	static playSound = function(isLooping, emitter, xPos, yPos, zPos, falloffStart, falloffEnd, falloffFactor)
	{
		var returnValue = undefined;
		if(current_time > lastPlayedTime + repeatDelay)
		{
			lastPlayedTime = current_time;
			var choice = 0;
			switch(trackBehavior)
			{
				case FHAUDIO_CHOOSE_RANDOM:
					choice = irandom_range(0, amountOfTracks-1);
					break;
				case FHAUDIO_CHOOSE_RANDOM_NOT_REPEATED:
					if(amountOfTracks > 1)
					{
						choice = irandom_range(0, amountOfTracks-1);
						while(choice == lastTrackPlayed)
						{
							choice = irandom_range(0, amountOfTracks-1);
						}
					}
					else
						choice = 0;
					lastTrackPlayed = choice;
				case FHAUDIO_CHOOSE_SEQUENCE:
					lastTrackPlayed = (lastTrackPlayed+1) % amountOfTracks;
					choice = lastTrackPlayed;
					break;
			}
			if(emitter == undefined)
			{
				if(xPos == undefined)
					returnValue = audio_play_sound(soundTracks[choice], 1, isLooping);
				else
					returnValue = audio_play_sound_at(soundTracks[choice], xPos, yPos, zPos, falloffStart, falloffEnd, falloffFactor, isLooping, 1);
			}
			else
				returnValue = audio_play_sound_on(__fhAudioObjController.emitterMap[$ string(emitter)].emitter, soundTracks[choice], isLooping, 1);
			if(volumeVariance>0)
				setVolume(returnValue);
			if(pitchVariance>0)
				setPitch(returnValue);
		}
		return returnValue;
	}
}

function __fhAudioPlayingSound(sound, category) constructor
{
	mySound = sound;
	myCategory = category;
}

function __fhAudioFadingSound(sound, fadeTime, _fadeToPause = false, _originalVolume = 0) constructor
{
	mySound = sound;
	finishedTime = current_time + fadeTime;
	fadeToPause = _fadeToPause;
	originalVolume = _originalVolume;
}

function __fhAudioEmitter() constructor
{
	emitter = audio_emitter_create();
	instanceToFollow = -1;
	instanceToFollow3d = false;
	instanceToFollowVelocity = false;
	velocityMultiplier = 1;
	prevX = 0;
	prevY = 0;
	prevZ = 0;
	
	static setPosition = function(newX, newY, newZ)
	{
		audio_emitter_position(emitter, newX, newY, newZ);
	}
	static setVelocity = function(newXVel, newYVel, newZVel)
	{
		audio_emitter_velocity(emitter, newXVel, newYVel, newZVel);
	}
	static setFalloff = function(falloffStart, falloffMax, _falloffFactor)
	{
		audio_emitter_falloff(emitter, falloffStart, falloffMax, _falloffFactor);
	}
	static setPitch = function(pitch)
	{
		audio_emitter_pitch(emitter, pitch);
	}
	static setVolume = function(volume)
	{
		audio_emitter_gain(emitter, volume);
	}
	static setFollowInstance = function(newInstanceToFollow, is3d, newInstanceToFollowVelocity, newVelocityMultiplier)
	{
		instanceToFollow = newInstanceToFollow;
		if(!variable_instance_exists(instanceToFollow, "z"))
			instanceToFollow.z = 0;
		instanceToFollow3d = is3d;
		instanceToFollowVelocity = newInstanceToFollowVelocity;
		velocityMultiplier = newVelocityMultiplier;
		prevX = 0;
		prevY = 0;
		prevZ = 0;
	}
	static stopFollowInstance = function()
	{
		instanceToFollow = -1;
		instanceToFollow3d = false;
		instanceToFollowVelocity = false;
		velocityMultiplier = 1;
		prevX = 0;
		prevY = 0;
		prevZ = 0;
	}
	static step = function()
	{
		if(!instance_exists(instanceToFollow))
		{
			stopFollowInstance();
			return false;
		}
		var xPos = instanceToFollow.x;
		var yPos = instanceToFollow.y;
		var zPos = 0;
		if(instanceToFollow3d)
		{
			zPos = instanceToFollow.z;
		}
		audio_emitter_position(emitter, xPos, yPos, zPos);
		if(instanceToFollowVelocity)
		{
			var xVel = xPos - prevX;
			var yVel = yPos - prevY;
			var zVel = zPos - prevZ;
			prevX = xPos;
			prevY = yPos;
			prevZ = zPos;
			xVel*=velocityMultiplier;
			yVel*=velocityMultiplier;
			zVel*=velocityMultiplier;
			audio_emitter_velocity(emitter, xVel, yVel, zVel);
		}
		return true;
	}
	static destroy = function()
	{
		audio_emitter_free(emitter);
	}
}

function __fhAudioSoundPause(sound, fadeTime)
{
	var gain = audio_sound_get_gain(sound);
	if(fadeTime > 0)
	{
		audio_sound_gain(sound, 0, fadeTime);
		var fading = new __fhAudioFadingSound(sound, fadeTime, true, gain);
		array_push(__fhAudioObjController.fadingSoundsList, fading);
	}
	else
	{
		audio_pause_sound(sound);
		__fhAudioObjController.pausedSoundsMap[$ string(sound)] = gain;
	}
	return true;
}

function __fhAudioSoundResume(sound, fadeTime)
{
	audio_resume_sound(sound);
	
	with(__fhAudioObjController)
	{
		audio_sound_gain(sound, 0, 0);
		if(pausedSoundsMap[$ string(sound)] != undefined)
		{
			audio_sound_gain(sound, pausedSoundsMap[$ string(sound)], fadeTime);
			variable_struct_remove(pausedSoundsMap, string(sound));
		}
	}
	return true;
}