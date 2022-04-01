draw_self();

if (beam_on) {
	if (deflector_direction == DEFLECTOR_DIR.LEFT_DOWN && laser_dir == LASER_DIRECTIONS.RIGHT) {
		draw_inner_beam (1);
	} else if (deflector_direction == DEFLECTOR_DIR.RIGHT_DOWN && laser_dir == LASER_DIRECTIONS.LEFT) {
		draw_inner_beam (0);
	}
}
