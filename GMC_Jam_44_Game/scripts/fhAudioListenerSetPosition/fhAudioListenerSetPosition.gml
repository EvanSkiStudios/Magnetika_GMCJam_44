function fhAudioListenerSetPosition(newPosX, newPosY, _newPosZ = 0)
{
	/// @param newPosX
	/// @param newPosY
	/// @param _newPosZ=0
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetPosition()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetPosition()", "newPosX", newPosX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetPosition()", "newPosY", newPosY);
		if(__fhAudioObjController.listenerInstanceToFollow != -1)
			__fhAudioThrowError("Called fhAudioListenerSetPosition() while listener is set to follow an instance.");
	}
	audio_listener_position(newPosX, newPosY, _newPosZ);
	return true;
}

function fha_listener_set_position(newPosX, newPosY, _newPosZ = 0)
{
	/// @param newPosX
	/// @param newPosY
	/// @param _newPosZ=0
	
	if(false){return fha_listener_set_position;}
	return fhAudioListenerSetPosition(newPosX, newPosY, _newPosZ);
}