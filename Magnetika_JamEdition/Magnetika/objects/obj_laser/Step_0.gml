event_inherited();
depth = -(_y + 1);

if (turret_heat >= 15) {
	kill_turret();
	return;
}

switch (laser_state) {
	
	case LASER_STATES.on:
		laser_calc_timer++;
		if (laser_calc_timer >= laser_calc_time) {
			laser_calc_timer = 0;
			calculate_laser(switch_id, aim_direction);	
		}
		laser_on = true;
		laser_color = irandom_range(c_aqua, c_silver);
		set_beams_on(true);
		
		timer++;
		if (timer >= time_on) {
			timer = 0;
			if (time_off > 0) {
				laser_on = false;
				stop_laser_sound();
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
		if (global.playing_laser_hum) {
			audio_stop_sound(snd_laser_loop);
			global.playing_laser_hum = false;
		}
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
	
	case LASER_STATES.powering_on:
		switch_timer ++;
		if (switch_timer >= switch_delay) {
			power_on();
		}
	break;
	case LASER_STATES.powering_off:
		switch_timer ++;
		if (switch_timer >= switch_delay) {
			power_off();
		}
	break;
	
	
}
