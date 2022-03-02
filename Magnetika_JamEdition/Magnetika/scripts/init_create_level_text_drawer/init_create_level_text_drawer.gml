function init_create_level_text_drawer(){
	if !(instance_exists(obj_level_text_drawer)){
		instance_create_depth(x,y,depth,obj_level_text_drawer);	
	}
}