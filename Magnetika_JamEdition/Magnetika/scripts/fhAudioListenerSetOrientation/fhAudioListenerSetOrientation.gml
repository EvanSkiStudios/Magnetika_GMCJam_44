function fhAudioListenerSetOrientation(newLookAtX, newLookAtY, newLookAtZ, newUpX, newUpY, newUpZ)
{
	/// @param newLookAtX
	/// @param newLookAtY
	/// @param newLookAtZ
	/// @param newUpX
	/// @param newUpY
	/// @param newUpZ
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetOrientation()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newLookAtX", newLookAtX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newLookAtY", newLookAtY);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newLookAtZ", newLookAtZ);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newUpX", newUpX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newUpY", newUpY);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetOrientation()", "newUpZ", newUpZ);
		if((__fhAudioObjController.listenerInstanceToFollow != -1) &&
			(__fhAudioObjController.listenerInstanceToFollowOrientation))
		{
			__fhAudioThrowError("Called fhAudioListenerSetOrientation() while listener is set to follow an instance's orientation.");
		}
	}
	with(__fhAudioObjController)
	{
		listenerCurrentLookAtX = newLookAtX;
		listenerCurrentLookAtY = newLookAtY;
		listenerCurrentLookAtZ = newLookAtZ;
		listenerCurrentUpX = newUpX;
		listenerCurrentUpY = newUpY;
		listenerCurrentUpZ = newUpZ;
		audio_listener_orientation(listenerCurrentLookAtX, listenerCurrentLookAtY, listenerCurrentLookAtZ, listenerCurrentUpX, listenerCurrentUpY, listenerCurrentUpZ);
	}
	return true;
}

function fha_listener_set_orientation(newLookAtX, newLookAtY, newLookAtZ, newUpX, newUpY, newUpZ)
{
	/// @param newLookAtX
	/// @param newLookAtY
	/// @param newLookAtZ
	/// @param newUpX
	/// @param newUpY
	/// @param newUpZ
	
	if(false){return fha_listener_set_orientation;}
	return fhAudioListenerSetOrientation(newLookAtX, newLookAtY, newLookAtZ, newUpX, newUpY, newUpZ);
}