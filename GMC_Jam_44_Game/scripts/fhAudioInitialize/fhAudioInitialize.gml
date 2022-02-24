function fhAudioInitialize(_falloffModel = audio_falloff_linear_distance)
{
	if(FHAUDIO_DEBUGMODE)
	{
		if(instance_exists(__fhAudioObjController))
		{
			__fhAudioDebugLog("Called fhAudioInitialize() when the system was already initialized.  You only need to call this function once.")
			return false;
		}
	}
	instance_create_depth(-99999, -99999, 0, __fhAudioObjController);
	audio_falloff_set_model(_falloffModel);
	return true;
}

function fha_initialize(_falloffModel = audio_falloff_linear_distance)
{
	if(false){return fha_initialize;}
	return fhAudioInitialize();
}