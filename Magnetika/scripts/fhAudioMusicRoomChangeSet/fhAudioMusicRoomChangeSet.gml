function fhAudioMusicRoomChangeSet(roomToSet, musicToSet)
{
	/// @param roomToSet
	/// @param musicToSet
	
	if(FHAUDIO_DEBUGMODE)
	{
		__fhAudioAssertSystemInitialized("fhAudioMusicRoomChangeSet()");
		if(!room_exists(roomToSet))
			__fhAudioThrowError("Called fhAudioMusicRoomChangeSet() with non-existent room.");
		if(!audio_exists(musicToSet))
			__fhAudioThrowError("Called fhAudioMusicRoomChangeSet() with non-existent audio.");
	}
	__fhAudioObjController.musicRoomStarts[$ string(roomToSet)] = musicToSet;
	return true;
}

function fha_music_room_change_set(roomToSet, musicToSet)
{
	/// @param roomToSet
	/// @param musicToSet
	
	if(false){return fha_music_room_change_set}
	return fhAudioMusicRoomChangeSet(roomToSet, musicToSet);
}