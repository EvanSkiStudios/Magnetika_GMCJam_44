function fhAudioEmitterCreate(falloffStart, falloffMax, _falloffFactor = 1, _instanceToFollow = undefined, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
{
	/// @param falloffStart
	/// @param falloffMax
	/// @param _falloffFactor=1
	/// @param _instanceToFollow=undefined
	/// @param _followVelocity=false
	/// @param _velocityMultiplier=1
	/// @param _followIn3d=false
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterCreate()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterCreate()", "falloffStart", falloffStart);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterCreate()", "falloffMax", falloffMax);
		if(falloffStart <=1 || falloffMax <=1)
			__fhAudioThrowError("Called fhAudioEmitterCreate() with too low of falloff values.");
		if(!instance_exists(_instanceToFollow))
			__fhAudioThrowError("Called fhAudioEmitterCreate() with a non-existent instance.");
	}
	var emitStruct = new __fhAudioEmitter();
	emitStruct.setFalloff(falloffStart, falloffMax, _falloffFactor);
	if(_instanceToFollow != undefined)
	{
		emitStruct.setFollowInstance(_instanceToFollow, _followIn3d, _followVelocity, _velocityMultiplier);
	}
	var index = __fhAudioObjController.emitterNextIndex;
	with(__fhAudioObjController)
	{
		emitterMap[$ string(emitterNextIndex)] = emitStruct;
		emitterNextIndex++;
	}
	return index;
}

function fha_emitter_create(falloffStart, falloffMax, _falloffFactor = 1, _instanceToFollow = undefined, _followVelocity = false, _velocityMultiplier = 1, _followIn3d = false)
{
	/// @param falloffStart
	/// @param falloffMax
	/// @param _falloffFactor=1
	/// @param _instanceToFollow=undefined
	/// @param _followVelocity=false
	/// @param _velocityMultiplier=1
	/// @param _followIn3d=false
	
	if(false){return fha_emitter_create;}
	return fhAudioEmitterCreate(falloffStart, falloffMax, _falloffFactor, _instanceToFollow, _followVelocity, _velocityMultiplier, _followIn3d);
}