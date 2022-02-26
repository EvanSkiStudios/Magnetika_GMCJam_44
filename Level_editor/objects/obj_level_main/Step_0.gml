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
		
		state = LEVEL_STATES.floor_pieces_enter;
	}
	
	break;
	
	case LEVEL_STATES.floor_pieces_enter:
	
	break;
	
	case LEVEL_STATES.paused:
	
	break;
	
	case LEVEL_STATES.outro:
	
	break;
}
