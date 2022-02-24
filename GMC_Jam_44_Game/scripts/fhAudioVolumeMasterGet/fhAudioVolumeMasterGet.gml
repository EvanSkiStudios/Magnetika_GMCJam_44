function fhAudioVolumeMasterGet()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioVolumeMasterGet()");
	}
	return __fhAudioObjController.masterVolume;
}

function fha_volume_master_get()
{
	if(false){return fha_volume_master_get;}
	return fhAudioVolumeMasterGet();
}