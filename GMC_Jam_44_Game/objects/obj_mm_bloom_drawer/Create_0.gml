var sw = surface_get_width(application_surface);
var sh = surface_get_height(application_surface);
mm_bloom_surface = surface_create(sw,sh);

tile_layer = layer_get_id("Tiles_1");

function layer_pass_surface(){
	shader_params = shader_get_uniform(shd_bloom, "intensity");
	shader_set(shd_bloom);
	shader_set_uniform_f(shader_params, global.Bloom_intensity);	
}

function layer_pass_surface_end(){
	shader_reset();
}