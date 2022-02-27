function fhAudioVolumeMusicGet()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeMusicGet()");
	}
	return __fhAudioObjController.musicVolume;
}

function fha_volume_music_get()
{
	if(false){return fha_volume_music_get;}
	return fhAudioVolumeMusicGet();
}