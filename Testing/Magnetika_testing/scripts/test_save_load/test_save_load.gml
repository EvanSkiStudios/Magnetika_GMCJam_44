//methodz
function save_inst(inst) constructor{

	//empty_struct
	inst_save_struct = {};
	var save_struct = {};
		
	var _var_array = variable_instance_get_names(inst);
	var _var_array_length = array_length(_var_array);
	
	for (var i = 0; i < _var_array_length; ++i;){
		//GET THE VARIBLE FROM OUR ARRAY's VALUE
		var _var_name = array_get(_var_array,i);
		
		//Get variable and value
		var _var_value = variable_instance_get(inst,_var_name);
			
		_var_name = string(_var_name);
			
		if !( (_var_name == "save_inst") || (_var_name == "inst_save_struct") || (_var_name == "inst_pool") ){
			
			//save variable and vlaues to struct
			variable_struct_set(inst_save_struct,_var_name,_var_value);
		}
	}
		
	//save struct to master struct
	var inst_index = string( object_get_name(inst.object_index) );
	variable_struct_set(save_struct,inst_index,inst_save_struct);
		
	return(save_struct);
}

function save_game(){
	var json_save_struct = {};
	var index = 0;
	
	//so saving needs to be done/have 1 object to hold all the data globaly so that we can get the array and everything filled correctly, 
	//so we save the saving inst id here so we can send it the array for later use, as the scope of everything passes through everything
	global.save_inst_scope = id;
	
	//save all instaces
	with(type_save){
		var save_struct = save_inst(id);
		
		global.save_inst_scope.inst_pool[index] = save_struct;
		index += 1;
	}
	
	//load array with structs into master struct
	variable_struct_set(json_save_struct,"inst_pool",inst_pool);
	
	//create files
	if (file_exists("SAVE.phrs")) file_delete("SAVE.phrs");
	
	//var json_string = base64_encode(json_stringify(save_struct));
	var json_string = (json_stringify(json_save_struct));
	
	var buffer = buffer_create(string_length(json_string)+1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, json_string);
	buffer_save(buffer,"SAVE.phrs");
	buffer_delete(buffer);
	
	show_debug_message("==== GAME SAVED ====");
	show_debug_message(string(filename_path("SAVE.phrs")));
	show_debug_message("====================");
}



//oh hey you need to fix loading now lmao
function load_game(){
	exit;
	if !(file_exists("SAVE.phrs")) return(-1);
	
	var save_file = buffer_load("SAVE.phrs");
	var json_string = buffer_read(save_file,buffer_string);
	buffer_delete(save_file);
	
	json_string = base64_decode(json_string);
	var game_struct = json_parse(json_string);

	show_debug_message("==== GAME LOADED ====");
}