event_inherited();

if (is_toggle) {
	switch (state) {
		case FLOOR_STATES.idle:
			if (obj_girl.current_tile_pos[0] != current_tile_pos[0] || obj_girl.current_tile_pos[1] != current_tile_pos[1]) {
				image_index = 0;
				switch_activated = false;
			}
		break;
	}
}

