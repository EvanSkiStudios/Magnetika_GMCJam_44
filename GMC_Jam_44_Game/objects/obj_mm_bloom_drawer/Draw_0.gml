if !surface_exists(mm_bloom_surface){
	var sw = surface_get_width(application_surface);
	var sh = surface_get_height(application_surface);
	mm_bloom_surface = surface_create(sw,sh);
}

layer_script_begin(tile_layer,layer_pass_surface);
layer_script_end(tile_layer,layer_pass_surface_end);