image_speed = 0;

sprite_on = spr_scaffold_on;
sprite_off = spr_scaffold_off;


/// @function set_on(on);
set_on = function (on) {
	if (on) {
		sprite_index = sprite_on;	
	} else {
		sprite_index = sprite_off;	
	}
}
