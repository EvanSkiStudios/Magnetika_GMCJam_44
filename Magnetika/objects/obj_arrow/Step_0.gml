depth = -9000
visible = false;
if (obj_girl.potential_moveable_piece != -1) {
	if (obj_girl.current_moveable_piece == -1) {
		x = obj_girl.potential_moveable_piece.x;
		y = obj_girl.potential_moveable_piece.y;
		visible = true;
	}
}
