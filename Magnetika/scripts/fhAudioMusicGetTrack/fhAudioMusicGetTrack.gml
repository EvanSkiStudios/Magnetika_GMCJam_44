function fhAudioMusicGetTrack()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicGetTrack()");
	}
	return __fhAudioObjController.currentMusicTrack;
}

function fha_music_get_track()
{
	if(false){return fha_music_get_track;}
	return fhAudioMusicGetTrack();
}