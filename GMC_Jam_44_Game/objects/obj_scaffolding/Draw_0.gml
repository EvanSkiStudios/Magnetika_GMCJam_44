if ( (global.Bloom_Shader_enabled) && (surface_exists(global.bloom_surface)) && (sprite_index == sprite_on) ){
	surface_set_target(global.bloom_surface);
	draw_self();
	surface_reset_target();
}else{
	draw_self();	
}