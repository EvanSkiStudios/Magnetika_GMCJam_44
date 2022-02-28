switch (state) {
	
	case LEVEL_STATES.playing:
	
	break;
	
	case LEVEL_STATES.intro:
	
	timer++;
	
	if (timer >= time_to_scaffold_on) {
		if (instance_exists(obj_scaffolding)) {
			with (obj_scaffolding) {
				set_on(true);	
			}
		}
		
		fhAudioSoundPlay(SND_LEVEL_IN);
		state = LEVEL_STATES.floor_pieces_enter;
	}
	
	break;
	
	case LEVEL_STATES.floor_pieces_enter:
		
		var alldone = true;
		with (obj_floor) {
			if (!movement_complete) {
				alldone = false;
			}
		}
		if (alldone) {
			notify_room_intro_complete();
			state = LEVEL_STATES.playing;
		}
		
	
	break;
	
	case LEVEL_STATES.paused:
	
	break;
	
	case LEVEL_STATES.outro:
	var alldone = true;
		with (obj_floor) {
			if (!movement_complete) {
				alldone = false;
			}
		}
		if (alldone) {
			notify_room_outro_complete();
			state = LEVEL_STATES.standby;
		}
	
	
	break;
}
