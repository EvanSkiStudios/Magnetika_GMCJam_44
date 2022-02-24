function fhAudioEmitterDestroy(emitter)
{
	/// @param emitter
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterDestroy()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterDestroy()", "emitter", emitter);
		if(__fhAudioObjController.emitterMap[$ string(emitter)] == undefined)
			__fhAudioThrowError("You called fhAudioEmitterDestroy() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].destroy();
	variable_struct_remove(__fhAudioObjController.emitterMap, string(emitter));
	return true;
}

function fha_emitter_destroy(emitter)
{
	/// @param emitter
	
	if(false){return fha_emitter_destroy;}
	return fhAudioEmitterDestroy(emitter);
}