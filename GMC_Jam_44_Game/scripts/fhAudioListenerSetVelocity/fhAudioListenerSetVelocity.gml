function fhAudioListenerSetVelocity(newVelX, newVelY, _newVelZ = 0)
{
	/// @param newVelX
	/// @param newVelY
	/// @param _newVelZ=0
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetVelocity()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetVelocity()", "newVelX", newVelX);
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetVelocity()", "newVelY", newVelY);
		if(__fhAudioObjController.listenerInstanceToFollow != -1 || __fhAudioObjController.listenerInstanceToFollowVelocity)
		{
			__fhAudioThrowError("Called fhAudioListenerSetVelocity() while listener is set to follow an instance's velocity.");
		}
	}
	audio_listener_velocity(newVelX, newVelY, _newVelZ);
	return true;
}

function fha_listener_set_velocity(newVelX, newVelY, _newVelZ = 0)
{
	/// @param newVelX
	/// @param newVelY
	/// @param _newVelZ=0
	
	if(false){return fha_listener_set_velocity;}
	return fhAudioListenerSetVelocity(newVelX, newVelY, _newVelZ);
}