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
			
			if (girl_standing() || pressed_by_moveable() ) {
				image_index = 1;
				activate_switch();	
			} else {
				image_index = 0;
				deactivate_switch();	
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