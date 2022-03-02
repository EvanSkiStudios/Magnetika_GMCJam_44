function fhAudioMusicSwapfade(musicTrack, _fadeTime = 1000)
{
	/// @param musicTrack
	/// @param _fadeTime=1000
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicSwapfade()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicSwapfade()", "musicTrack", musicTrack);
	}
	var returnValue = -1;
	with(__fhAudioObjController)
	{
		alarm[0] = 0;
		if(currentMusicTrack == -1)
		{
			__fhAudioDebugLog("Attempted to Swapfade when no music is currently playing.");
			break;
		}
		else if(currentMusicTrack == musicTrack)
		{
			__fhAudioDebugLog("Attempted to Swapfade to the same music track that is already playing.");
			break;
		}
		else
		{
			fadingMusicRef = currentMusicRef;
			fadingMusicTrack = currentMusicTrack;
			currentMusicTrack = musicTrack;
			currentMusicRef = audio_play_sound(currentMusicTrack, 1, true);
			lastMusicTrack = currentMusicTrack;
			audio_sound_set_track_position(currentMusicRef, audio_sound_get_track_position(fadingMusicRef));
			audio_sound_gain(currentMusicRef, 0, 0);
			audio_sound_gain(currentMusicRef, realMusicVolume, _fadeTime);
			audio_sound_gain(fadingMusicRef, 0, _fadeTime);
			fadeTimeEnd = current_time + _fadeTime;
			musicStatus = __FHAUDIO_STATUS_SWAPFADING;
			returnValue = currentMusicRef;
		}
	}
	return returnValue;
}

function fha_music_swapfade(musicTrack, _fadeTime = 1000)
{
	/// @param musicTrack
	/// @param _fadeTime=1000
	
	if(false){return fha_music_swapfade;}
	return fhAudioMusicSwapfade(musicTrack, _fadeTime);
}