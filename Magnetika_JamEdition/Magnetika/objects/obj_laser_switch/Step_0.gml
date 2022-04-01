event_inherited();

depth = -(_y + 1);

	switch (state) {
		case FLOOR_STATES.idle:
			if (switch_type == LASER_SWITCH_TYPES.PRESSURE) {
				if (laser_hitting) {
					image_index = 1;
					activate_switch();	
				} else {
					image_index = 0;
					deactivate_switch();	
				}
			} else if (switch_type == LASER_SWITCH_TYPES.ONE_SHOT) {
				if (laser_hitting && !switch_activated) {
					image_index = 1;
					activate_switch();
				} else if (!laser_hitting && !switch_activated) {
					image_index = 0;
				}
			}

		break;
	}