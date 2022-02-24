function fhAudioActivate()
{
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioActivate()");
	}
	instance_activate_object(__fhAudioObjController);
	return true;
}

function fha_activate()
{
	if(false){return fha_activate;}
	return fhAudioActivate();
}