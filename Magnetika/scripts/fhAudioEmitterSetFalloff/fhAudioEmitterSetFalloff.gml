function fhAudioEmitterSetFalloff(emitter, falloffStart, falloffMax, _falloffFactor = 1)
{
	/// @param emitter
	/// @param falloffStart
	/// @param falloffMax
	/// @param _falloffFactor=1
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetFalloff()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetFalloff()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetFalloff()", "falloffStart", falloffStart);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetFalloff()", "falloffMax", falloffMax);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("Called fhAudioEmitterSetFalloff() with a non-existent emitter.");
		if(falloffStart <=1 || falloffMax <=1)
			__fhAudioThrowError("Called fhAudioEmitterSetFalloff() with too low of falloff values.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setFalloff(falloffStart, falloffMax, _falloffFactor);
	return true;
}

function fha_emitter_set_falloff(emitter, falloffStart, falloffMax, _falloffFactor = 1)
{
	/// @param emitter
	/// @param falloffStart
	/// @param falloffMax
	/// @param _falloffFactor=1
	
	if(false){return fha_emitter_set_falloff;}
	return fhAudioEmitterSetFalloff(emitter, falloffStart, falloffMax, _falloffFactor);
}