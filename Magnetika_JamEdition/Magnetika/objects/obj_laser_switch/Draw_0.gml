draw_sprite_ext(spr_laser_switch, image_index, x, y, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_laser_switch_light, image_index, x, y, 1, 1, 0, switch_color, 1);

if (from_left) {
		draw_inner_beam (1);
	} else if (from_right) {
		draw_inner_beam (0);
	}	