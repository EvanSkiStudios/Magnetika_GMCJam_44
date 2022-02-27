event_inherited();

switch (laser_state) {
	
	case LASER_STATES.on:
		get_laser_points();
		laser_on = true;
		set_beams_on(true);
		timer++;
		if (timer >= time_on) {
			timer = 0;
			if (time_off > 0) {
				laser_on = false;
				var all_lasers_off = true;
				if (obj_laser.laser_on) {
					all_lasers_off = false;	
				}
				if (all_lasers_off) {
					global.playing_laser_hum = false;
					audio_stop_sound(snd_laser_loop);	
				}
				audio_play_sound(snd_laser_off, 1, false);
				show_debug_message("LASER_POINTS LENGTH:" + string(laser_length));
				show_debug_message("LASER OFF");
				laser_state = LASER_STATES.off;
			}
		}
	break;
	
	case LASER_STATES.off:
		laser_on = false;
		set_beams_on(false);
		timer++;
		if (timer >= time_off) {
			timer = 0;
			if (time_on > 0) {
				show_debug_message("LASER ON");
				if (!global.playing_laser_hum) {
					audio_play_sound(snd_laser_loop, 1, true);	
					global.playing_laser_hum = true;
				}
				audio_play_sound(snd_laser_begin, 1, false);
				laser_state = LASER_STATES.on;
			}
		}
	break;
	
	case LASER_STATES.powered_off:
		laser_on = false;
		set_beams_on(false);
		image_index = aim_direction;
	break;
	
	case LASER_STATES.powered_on:
		timer = 0;
		if (!global.playing_laser_hum) {
					audio_play_sound(snd_laser_loop, 1, true);	
					global.playing_laser_hum = true;
				}
				audio_play_sound(snd_laser_begin, 1, 0);
		laser_state = LASER_STATES.on;
	break;
}
