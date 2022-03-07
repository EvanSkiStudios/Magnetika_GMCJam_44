function save_game(){
	
	//setup struct

	//methodz
	function save_inst(inst) constructor{
		
		//empty_struct
		inst_save_struct = {};
		
		var _var_array = variable_instance_get_names(inst);
		var _var_array_length = array_length(_var_array);
	
		for (var i = 0; i < _var_array_length; ++i;){
			//GET THE VARIBLE FROM OUR ARRAY's VALUE
			var _var_name = array_get(_var_array,i);
		
			//Get variable and value
			var _var_value = variable_instance_get(inst,_var_name);
			
			_var_name = string(_var_name);
			
			if !( (_var_name == "save_inst") || (_var_name == "inst_save_struct") ){
			
				//save variable and vlaues to struct
				variable_struct_set(inst_save_struct,_var_name,_var_value);
			
			}
		
			//debug
			_var_value = string(_var_value);
			show_debug_message((_var_name)+" = "+string(_var_value));
		}
	}

	var save_struct = {};

	//save all instaces
	with(all){	
		save_inst(id);
		//save struct to master struct
		var inst_index = string( object_get_name(object_index) );
		variable_struct_set(save_struct,inst_index,inst_save_struct);
	}
	
	//create files
	if (file_exists("SAVE.phrs")) file_delete("SAVE.phrs");
	
	var json_string = base64_encode(json_stringify(save_struct));
	show_message(json_string)
	
	var buffer = buffer_create(string_length(json_string)+1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, json_string);
	buffer_save(buffer,"SAVE.phrs");
	buffer_delete(buffer);
	
	show_debug_message("==== GAME SAVED ====");
}



//oh hey you need to fix loading now lmao
function load_game(){
	if !(file_exists("SAVE.phrs")) return(-1);
	
	var save_file = buffer_load("SAVE.phrs");
	var json_string = buffer_read(save_file,buffer_string);
	buffer_delete(save_file);
	
	json_string = base64_decode(json_string);
	var game_struct = json_parse(json_string);

	if variable_struct_exists(game_struct, "Test_key"){	global.test_value = game_struct.Test_key; };

	show_debug_message("==== GAME LOADED ====");
}