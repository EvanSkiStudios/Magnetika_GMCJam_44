event_inherited();
depth = -(y + hover_dist) - 14;//15

switch (state) {
	
	case FLOOR_STATES.idle:
		if (lost_floor()) {
			set_moveable_lost();	
		}
	break;
	
	case FLOOR_STATES.falling:
	depth = -y - 5;
		y = y + outro_drop_speed;
		outro_drop_speed += outro_drop_accel;
	
		if (y > room_height) {
			movement_complete = true;
			y = room_height + sprite_height;
			state = FLOOR_STATES.gone;
		}
	break;	
}