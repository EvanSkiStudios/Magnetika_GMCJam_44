function fhAudioEmitterSetInstanceToFollow(emitter, instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
{
	/// @param emitter
	/// @param instanceToFollow
	/// @param _followVelocity=false
	/// @param _velocityMultiplier=1
	/// @param _followIn3d=false
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetInstanceToFollow()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetInstanceToFollow()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetInstanceToFollow()", "instanceToFollow", newInstanceToFollow);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("Called fhAudioEmitterSetInstanceToFollow() with a non-existent emitter.");
		if(!instance_exists(instanceToFollow))
			__fhAudioThrowError("Called fhAudioEmitterSetInstanceToFollow() with a non-existent instance.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setFollowInstance(instanceToFollow, _followIn3d, _followVelocity, _velocityMultiplier);
	return true;
}

function fha_emitter_set_instance_to_follow(emitter, instanceToFollow, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
{
	/// @param emitter
	/// @param instanceToFollow
	/// @param _followVelocity=false
	/// @param _velocityMultiplier=1
	/// @param _followIn3d=false
	
	if(false){return fha_emitter_set_instance_to_follow;}
	return fhAudioEmitterSetInstanceToFollow(emitter, instanceToFollow, _followVelocity, _velocityMultiplier, _followIn3d);
}