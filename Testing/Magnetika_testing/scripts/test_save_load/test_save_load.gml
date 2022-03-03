function save_game(){
	if (file_exists("SAVE.phrs")) file_delete("SAVE.phrs");
	
	var save_strut = {
		Test_key : global.test_value,
	}
	
	var json_string = base64_encode(json_stringify(save_strut));
	show_message(json_string)
	
	var buffer = buffer_create(string_length(json_string)+1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, json_string);
	buffer_save(buffer,"SAVE.phrs");
	buffer_delete(buffer);
	
	show_debug_message("==== GAME SAVED ====");
}

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


//TEST

global.test_value = 420;
show_message(global.test_value);
save_game();
global.test_value = 99;
show_message(global.test_value);
load_game();
show_message(global.test_value);