function fhAudioListenerSetInstanceToFollow(instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followOrientation = false, _followIn3d = false)
{
	/// @param instanceToFollow
	/// @param _followVelocity=false
	/// @param _velocityMultiplier=1
	/// @param _followOrientation=false
	/// @param _followIn3d=false
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioListenerSetInstanceToFollow()");
		__fhAudioAssertArgumentNotUndefined("fhAudioListenerSetInstanceToFollow()", "instanceToFollow", instanceToFollow);
		if(!instance_exists(instanceToFollow))
			__fhAudioThrowError("Called fhAudioListenerSetInstanceToFollow() with a non-existant instance.");
	}
	with(__fhAudioObjController)
	{
		listenerInstanceToFollow = instanceToFollow;
		listenerInstanceToFollow3d = _followIn3d;
		listenerInstanceToFollowVelocity = _followVelocity;
		listenerVelocityMultiplier = _velocityMultiplier;
		listenerInstanceToFollowOrientation = _followOrientation;
	}
	return true;
}

function fha_listener_set_instance_to_follow(instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followOrientation = false, _followIn3d = false)
{
	/// @param instanceToFollow
	/// @param _followVelocity=false
	/// @param _velocityMultiplier=1
	/// @param _followOrientation=false
	/// @param _followIn3d=false
	
	if(false){return fha_listener_set_instance_to_follow;}
	return fhAudioListenerSetInstanceToFollow(instanceToFollow, _followVelocity, _velocityMultiplier, _followOrientation, _followIn3d);
}