function fhAudioMusicGetReference()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicGetReference()");
	}
	return __fhAudioObjController.currentMusicRef;
}

function fha_music_get_reference()
{
	
	if(false){return fha_music_get_reference;}
	return fhAudioMusicGetReference();
}