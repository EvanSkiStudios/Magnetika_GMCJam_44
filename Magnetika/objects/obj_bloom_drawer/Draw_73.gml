if !surface_exists(global.bloom_surface){
	var sw = surface_get_width(application_surface);
	var sh = surface_get_height(application_surface);
	global.bloom_surface = surface_create(sw,sh);
}


if (global.Bloom_Shader_enabled) && (global.Bloom_intensity > 0.0) && (global.bloom_draw_surface){
	
	//depth = (obj_floor.depth) + 100;
	shader_set(shd_bloom);
	shader_params = shader_get_uniform(shd_bloom, "intensity");
	shader_set_uniform_f(shader_params, global.Bloom_intensity);

	draw_surface(global.bloom_surface,0,0);
	shader_reset();
}