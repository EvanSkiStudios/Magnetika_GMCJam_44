function fhAudioMusicPlay(musicTrack, _fadeTime = 1000, _fromBeginning = false)
{
	/// @param musicTrack
	/// @param _fadeTime=0
	/// @param _fromBeginning=false
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicPlay()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicPlay()", "musicTrack", musicTrack);
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioMusicPlay() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		alarm[0] = 0;
		__fhAudioStoreMusicPos(false);
		currentMusicTrack = musicTrack;
		lastMusicTrack = currentMusicTrack;
		if(currentMusicRef != -1)
			audio_stop_sound(currentMusicRef);
		currentMusicRef = audio_play_sound(musicTrack, 1, true);
		if(musicTrackPositions[$ string(musicTrack)] != undefined)
		{
			if(!_fromBeginning)
			{
				
				audio_sound_set_track_position(currentMusicRef, musicTrackPositions[$ string(currentMusicTrack)]);
			}
			variable_struct_remove(musicTrackPositions, string(musicTrack));
		}
		audio_sound_gain(currentMusicRef, 0, 0);
		audio_sound_gain(currentMusicRef, realMusicVolume, _fadeTime);
		musicStatus = __FHAUDIO_STATUS_PLAYING;
	}
	return __fhAudioObjController.currentMusicRef;
}

function fha_music_play(musicTrack, _fadeTime = 1000, _fromBeginning = false)
{
	/// @param musicTrack
	/// @param _fadeTime=0
	/// @param _fromBeginning=false
	
	if(false){return fha_music_play;}
	return fhAudioMusicPlay(musicTrack, _fadeTime, _fromBeginning);
}