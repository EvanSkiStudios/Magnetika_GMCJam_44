function fhAudioIsInitialized()
{
	if(instance_exists(__fhAudioObjController))
		return true;
	return false;
}

function fha_is_initialized()
{
	if(false){return fha_is_initialized;}
	return fhAudioIsInitialized();
}