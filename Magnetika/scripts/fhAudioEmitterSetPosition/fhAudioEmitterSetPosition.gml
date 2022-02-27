function fhAudioEmitterSetPosition(emitter, newPosX, newPosY, _newPosZ = 0)
{
	/// @param emitter
	/// @param newPosX
	/// @param newPosY
	/// @param _newPosZ=0
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioEmitterSetPosition()");
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPosition()", "emitter", emitter);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPosition()", "newPosX", newPosX);
		__fhAudioAssertArgumentNotUndefined("fhAudioEmitterSetPosition()", "newPosY", newPosY);
		if(__fhAudioObjController.emitterMap[$ string(emitter)])
			__fhAudioThrowError("Called fhAudioEmitterSetPosition() with a non-existent emitter.");
	}
	__fhAudioObjController.emitterMap[$ string(emitter)].setPosition(newPosX, newPosY, _newPosZ);
	return true;
}

function fha_emitter_set_position(emitter, newPosX, newPosY, _newPosZ = 0)
{
	/// @param emitter
	/// @param newPosX
	/// @param newPosY
	/// @param _newPosZ=0
	
	if(false){return fha_emitter_set_position;}
	return fhAudioEmitterSetPosition(emitter, newPosX, newPosY, _newPosZ);
}