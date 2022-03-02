///@desc SCAFFOLDING DRAW CODE
if (sprite_index == sprite_on){
	global.bloom_draw_surface = true;
} else {
	global.bloom_draw_surface = false;
}
	
if (global.bloom_draw_surface && (global.Bloom_Shader_enabled) && (surface_exists(global.bloom_surface)) && (sprite_index == sprite_on) ){
	surface_set_target(global.bloom_surface);
	draw_self();
	surface_reset_target();
}else{
	draw_self();	
}	