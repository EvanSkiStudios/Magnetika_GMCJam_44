function fhAudioMusicCrossfade(musicTrack, _fadeTime = 1000, _fromBeginning = false)
{
	/// @param musicTrack
	/// @param _fadeTime=1000
	/// @param _fromBeginning=false
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicCrossfade()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicCrossfade()", "musicTrack", musicTrack);
		if(_fadeTime < 0)
			__fhAudioThrowError("Called fhAudioMusicCrossfade() with a negative fading time.");
	}
	with(__fhAudioObjController)
	{
		alarm[0] = 0;
		array_push(musicPendingFades, new __fhAudioFadeTask(musicTrack, _fadeTime, _fromBeginning));
	}
	return true;
}

function fha_music_crossfade(musicTrack, _fadeTime = 1000, _fromBeginning = false)
{
	/// @param musicTrack
	/// @param _fadeTime=1000
	/// @param _fromBeginning=false
	
	if(false){return fha_music_crossfade;}
	return fhAudioMusicCrossfade(musicTrack, _fadeTime, _fromBeginning);
}