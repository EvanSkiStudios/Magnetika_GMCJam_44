if !(global.GAME_IS_PAUSED) exit;

if !surface_exists(global.Pause_Surface){
	var sw = display_get_gui_width();
	var sh = display_get_gui_height();
	global.Pause_Surface = surface_create(sw,sh);
	
	surface_copy(global.Pause_Surface,0,0,application_surface);
}


//do blur
if (surface_exists(global.Pause_Surface)){
	//blur
	shader_set(shd_blur);
	
	var sw = display_get_gui_width();
	var sh = display_get_gui_height();

	var uniform_tex_size = shader_get_uniform(shd_blur, "texture_size");
	shader_set_uniform_f(uniform_tex_size, sw, sh);
	
	draw_surface(global.Pause_Surface,0,0);

	shader_reset();
}

//backness
draw_set_alpha(0.7);
draw_rectangle_color(-100,-100,sw+100,sh+100,c_black,c_black,c_black,c_black,false);
draw_set_alpha(1.0);

if !instance_exists(obj_ctrl_MainMenu){
	instance_create_depth(x,y,depth,obj_ctrl_MainMenu);	
}