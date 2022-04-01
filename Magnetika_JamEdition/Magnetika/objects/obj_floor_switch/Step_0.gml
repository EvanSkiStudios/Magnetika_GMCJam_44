event_inherited();

	switch (state) {
		case FLOOR_STATES.idle:
			
			if (switch_type == SWITCH_TYPES.TOGGLE) {
				if (girl_standing() || pressed_by_moveable()) {
					image_index = 1;
					activate_switch();
				} else {
					switch_activated = false;
					image_index = 0;
				}
			} else if (switch_type == SWITCH_TYPES.PRESSURE) {
				if (girl_standing() || pressed_by_moveable() ) {
					image_index = 1;
					activate_switch();	
				} else {
					image_index = 0;
					deactivate_switch();	
				}
			} else if (switch_type == SWITCH_TYPES.ONE_SHOT) {
				if (girl_standing() || pressed_by_moveable() && switchables_ready()) {
					activate_switch();
				} else if (!girl_standing() && !pressed_by_moveable()) {
					image_index = 0;
				}
			} else if (switch_type == SWITCH_TYPES.INTERVAL) {
				if (switchables_ready()) {
					interval_timer++;
					if (!switch_activated) {
						if (interval_timer >= interval_time_off) {
							interval_timer = 0;
							activate_switch();
						}
					} else {
						if (interval_timer >= interval_time_on) {
							interval_timer = 0;
							deactivate_switch();
						}
					}
				}
			}

		break;
	}