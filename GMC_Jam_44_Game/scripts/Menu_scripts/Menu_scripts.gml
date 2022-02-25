function create_menu_page(){
	//["name1", type1, entires1...]
	
	var arg, i = 0;
	repeat(argument_count){
		arg[i] = argument[i];
		++i;
	}
	
	var ds_grid_id = ds_grid_create(5, argument_count);
	i = 0; repeat(argument_count){
		var array = arg[i];
		var array_len = array_length(array);
		
		var xx = 0 repeat(array_len){
			ds_grid_id[# xx, i] = array[xx];
			++xx;
		}
		++i;
	}
	
	return ds_grid_id;

}

function controls_switchroom(){
		
}

function resume_game(){
	if (room == rm_mainmenu){
		fadetoroom(rm_levelselect,10,color_purple);
	}
}

function exit_game(){
	fadetoroom(QuitGame,20,color_purple);
}


function change_volume(){
	var type = menu_option[page];
	
	switch(type){
		case 0: audio_master_gain(argument0); break;
		case 1: audio_group_set_gain(AudioGroup_SFX, argument0, 0); break;
		case 2: audio_group_set_gain(AudioGroup_Music, argument0, 0); break;
	}
}