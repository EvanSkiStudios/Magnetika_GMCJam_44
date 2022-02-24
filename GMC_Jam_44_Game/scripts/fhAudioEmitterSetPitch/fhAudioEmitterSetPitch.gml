function fhAudioEmitterSetPitch(emitter, pitch)
{
	/// @param emitter
	/// @param pitch
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetPitch()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPitch()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPitch()", "pitch", pitch);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("You called fhAudioEmitterSetPitch() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setPitch(pitch);
	return true;
}

function fha_emitter_set_pitch(emitter, pitch)
{
	/// @param emitter
	/// @param pitch
	
	if(false){return fha_emitter_set_pitch;}
	return fhAudioEmitterSetPitch(emitter, pitch);
}