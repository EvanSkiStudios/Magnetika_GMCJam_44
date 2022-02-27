function fhAudioListenerSetUp(newUpX, newUpY, newUpZ)
{
	/// @param newXUp
	/// @param newYUp
	/// @param newZUp
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetUp()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetUp()", "newUpX", newUpX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetUp()", "newUpY", newUpY);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetUp()", "newUpZ", newUpZ);
		if((__fhAudioObjController.listenerInstanceToFollow != -1) &&
			(__fhAudioObjController.listenerInstanceToFollowOrientation))
		{
			__fhAudioThrowError("Called fhAudioListenerSetUp() while listener is set to follow an instance's orientation.");
		}
		
	}
	with(__fhAudioObjController)
	{
		listenerCurrentUpX = newUpX;
		listenerCurrentUpY = newUpY;
		listenerCurrentUpZ = newUpZ;
		audio_listener_orientation(listenerCurrentLookAtX, listenerCurrentLookAtY, listenerCurrentLookAtZ, listenerCurrentUpX, listenerCurrentUpY, listenerCurrentUpZ);
		
	}
	return true;
}

function fha_listener_set_up(newUpX, newUpY, newUpZ)
{
	/// @param newXUp
	/// @param newYUp
	/// @param newZUp
	
	if(false){return fha_listener_set_up;}
	return fhAudioListenerSetUp(newUpX, newUpY, newUpZ);
}