//global.text_wrap = 1000;

var did_once = false;

//TEXT INTROS
switch(room){
	default: case rm_levelselect: break;
	
	case rm_Level1:{
		if (global.level_intro_done) && (!did_once){
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			did_once = true;
		}
	}break;
	
}