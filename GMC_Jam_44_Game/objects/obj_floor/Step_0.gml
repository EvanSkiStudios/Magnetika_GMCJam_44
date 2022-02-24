depth = -_y;

switch (state) {
	
	case FLOOR_STATES.idle:
	
	break;
	
	case FLOOR_STATES.standing:
		
	break;
	
	case FLOOR_STATES.intro:
	
	x = _x;
	y = round(lerp(y, _y, .1));
	
	if (y <= _y + 1) {
		y = _y;
		state = FLOOR_STATES.idle;
	}
	
	break;
	
	case FLOOR_STATES.outro:
	
	break;
	
	case FLOOR_STATES.init:
		
		x = _x;
		y = _y + intro_height;
		
		timer ++;
		if (timer >= delay) {
			timer = 0;
			state = FLOOR_STATES.intro;
		}
		
		
	
	break;
}
