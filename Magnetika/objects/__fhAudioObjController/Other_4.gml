var roomMusic = musicRoomStarts[$ string(room)];
if(roomMusic != undefined)
{
	if(roomMusic != currentMusicTrack)
		fhAudioMusicCrossfade(roomMusic, FHAUDIO_ROOM_MUSIC_CHANGE_FADE_TIME, FHAUDIO_ROOM_MUSIC_CHANGE_FROM_BEGINNING);
}