if event_data[? "event_type"] == "sprite event" // or you can check "sprite event"
{
	
	switch (event_data[? "message"])
    {
        case "play_footstep":
		//show_debug_message("STEP");
			fhAudioSoundPlay(SND_GIRL_FOOTSTEP);
			break;
	}
}