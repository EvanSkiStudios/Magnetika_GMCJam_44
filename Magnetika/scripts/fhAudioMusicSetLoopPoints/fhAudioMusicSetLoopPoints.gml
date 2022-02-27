function fhAudioMusicSetLoopPoints(musicTrack, beginningTime, endingTime)
{
	/// @param musicTrack
	/// @param beginningTime
	/// @param endingTime
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicSetLoopPoints()");
		__fhAudioAssertArgumentNotUndefined("fhAudioMusicSetLoopPoints()", "musicTrack", musicTrack);
		if(beginningTime < 0)
			__fhAudioThrowError("Called fhAudioMusicSetLoopPoints() with a negative beginning time.");
		if(endingTime < 0)
			__fhAudioThrowError("Called fhAudioMusicSetLoopPoints() with a negative ending time.");
	}
	__fhAudioObjController.musicLoopPoints[$ string(musicTrack)] = new __fhAudioMusicLoopPoints(beginningTime*0.001, endingTime*0.001);
	return true;
}

function fha_music_set_loop_points(musicTrack, beginningTime, endingTime)
{
	/// @param musicTrack
	/// @param beginningTime
	/// @param endingTime
	
	if(false){return fha_music_set_loop_points;}
	return fhAudioMusicSetLoopPoints(musicTrack, beginningTime, endingTime);
}