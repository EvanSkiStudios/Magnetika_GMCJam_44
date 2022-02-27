event_inherited();

	switch (state) {
		case FLOOR_STATES.idle:
			
			if (is_toggle) {
				
				if (girl_standing() || pressed_by_moveable()) {
					if (floors_ready()) {
						activate_switch();
					}
				} else {
					if (floors_ready()) {
						image_index = 0;
						switch_activated = false;
					}
				}
	
			} else if (is_pressure) {
				
				if (!switch_activated && floors_ready()) {
					if (girl_standing()) {
						activate_switch();
					} else if (pressed_by_moveable() && floors_ready()) {
						if (!switch_activated) {
							activate_switch();
						}
					}
				} else if (switch_activated) {
						if (!girl_standing() && !pressed_by_moveable()) {
							image_index = 0;
							if (floors_ready()) {
								switch_activated = false;
								toggle_floors(floor_list, floor_entry_delay);
							}
						}
					}
			} else {
				if (girl_standing() || pressed_by_moveable() && floors_ready()) {
					activate_switch();
				} else if (!girl_standing() && !pressed_by_moveable()) {
					image_index = 0;
				}
			}

		break;
	}