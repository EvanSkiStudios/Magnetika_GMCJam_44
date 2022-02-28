depth = -9000
visible = false;
if (obj_girl.potential_moveable_piece != -1) {
	if (obj_girl.current_moveable_piece == -1) {
		timer ++;
		if (timer >= timeout) {
			x = obj_girl.potential_moveable_piece.x;
			y = obj_girl.potential_moveable_piece.y;
			visible = true;
		}
	}else {
		timer = 0;
	}
} else {
	timer = 0;	
}

if (obj_girl.facing_dir != dir_last) {
	timer = 0;
	dir_last = obj_girl.facing_dir;
}
