#region musicfading
if(musicStatus == __FHAUDIO_STATUS_CROSSFADING || musicStatus == __FHAUDIO_STATUS_SWAPFADING)
{
	if(current_time >= fadeTimeEnd)
	{
		__fhAudioStopFadedTrack();
	}
}
else
{
	if(array_length(musicPendingFades) > 0)
	{
		__fhAudioDoCrossFade(musicPendingFades[0]);
		array_delete(musicPendingFades, 0, 1);
	}
}
#endregion

#region music looping
if(currentMusicRef != -1)
{
	var loopPoints = musicLoopPoints[$ string(currentMusicTrack)];
	if(loopPoints != undefined)
	{
		var currPosition = audio_sound_get_track_position(currentMusicRef);
		if(currPosition > loopPoints.endingTime)
		{
			audio_sound_set_track_position(currentMusicRef, currPosition - loopPoints.loopLength);
		}
	}
}
if(fadingMusicRef != -1)
{
	var loopPoints = musicLoopPoints[$ string(fadingMusicTrack)];
	if(loopPoints != undefined)
	{
		var currPosition = audio_sound_get_track_position(fadingMusicRef);
		if(currPosition > loopPoints.endingTime)
		{
			audio_sound_set_track_position(fadingMusicRef, currPosition - loopPoints.loopLength);
		}
	}
}
#endregion

#region handle fading sound effects
for(var i = 0; i < array_length(fadingSoundsList); i++)
{
	if(fadingSoundsList[i].finishedTime <= current_time)
	{
		if(fadingSoundsList[i].fadeToPause)
		{
			audio_pause_sound(fadingSoundsList[i].mySound);
			//ds_map_add(pausedSoundsMap, fadingSoundsList[i].mySound, fadingSoundsList[i].originalVolume);
			pausedSoundsMap[$ string(fadingSoundsList[i].mySound)] = fadingSoundsList[i].originalVolume;
		}
		else
		{
			audio_stop_sound(fadingSoundsList[i].mySound);
			variable_struct_remove(playingSoundsMap, string(fadingSoundsList[i].mySound));
		}
		array_delete(fadingSoundsList, i, 1);
		i--;
	}
}
#endregion
