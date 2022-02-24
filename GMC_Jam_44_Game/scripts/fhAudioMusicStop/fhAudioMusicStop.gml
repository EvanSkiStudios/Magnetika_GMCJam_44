function fhAudioMusicStop(_fadeTime = 0)
{
	/// @param _fadeTime=0
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicStop()");
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioMusicStop() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		__fhAudioStopFadedTrack();
		if(currentMusicRef != -1)
		{
			__fhAudioStoreMusicPos(false);
			if(_fadeTime > 0)
			{
				alarm[0] = _fadeTime/1000*room_speed;
				audio_sound_gain(currentMusicRef, 0, _fadeTime);
			}
			else
			{
				audio_stop_sound(currentMusicRef);
				currentMusicRef = -1;
				currentMusicTrack = -1;
			}
		}
		musicStatus = __FHAUDIO_STATUS_STOPPED;
	}
	return true;
}

function fha_music_stop(_fadeTime = 0)
{
	/// @param _fadeTime=1000
	
	if(false){return fha_music_stop;}
	return fhAudioMusicStop(_fadeTime);
}