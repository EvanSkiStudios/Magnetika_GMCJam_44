function fhAudioListenerSetLookAt(newLookAtX, newLookAtY, newLookAtZ)
{
	/// @param newLookAtX
	/// @param newLookAtY
	/// @param newLookAtZ
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetLookAt()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetLookAt()", "newLookAtX", newLookAtX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetLookAt()", "newLookAtY", newLookAtY);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetLookAt()", "newLookAtZ", newLookAtZ);
		if((__fhAudioObjController.listenerInstanceToFollow != -1) &&
			(__fhAudioObjController.listenerInstanceToFollowOrientation))
		{
			__fhAudioThrowError("Called fhAudioListenerSetLookAt() while listener is set to follow an instance's orientation.");
		}
	}
	with(__fhAudioObjController)
	{
		listenerCurrentLookAtX = newLookAtX;
		listenerCurrentLookAtY = newLookAtY;
		listenerCurrentLookAtZ = newLookAtZ;
		audio_listener_orientation(listenerCurrentLookAtX, listenerCurrentLookAtY, listenerCurrentLookAtZ, listenerCurrentUpX, listenerCurrentUpY, listenerCurrentUpZ);
	}
	return true;
}

function fha_listener_set_look_at(newLookAtX, newLookAtY, newLookAtZ)
{
	/// @param newLookAtX
	/// @param newLookAtY
	/// @param newLookAtZ
	
	if(false){return fha_listener_set_look_at;}
	return fhAudioListenerSetLookAt(newLookAtX, newLookAtY, newLookAtZ);
}