room_end_did_once = false;
room_start_did_once = false;

goto_room = rm_levelselect;


pop_lock = function(){
	show_debug_message("REQUESTED POP");
	//cycle through array and find the room we are in and set its lock state to false
	var _array_length = (array_length(global.lvl_list_array));
	
	for (var i = 0; i < _array_length; ++i){
		var _array_room = global.lvl_list_array[i]._room;
		var _level_lock = global.lvl_list_array[i]._lock;
		
		if (_array_room == room){
			if (_level_lock == true){
				global.lvl_list_array[i]._lock = false;
				
				show_debug_message("POPPED LOCK OF "+string(room_get_name(_array_room)));
			}else{
				show_debug_message("NO LOCK ON "+string(room_get_name(_array_room)));
			}
			break;
		}
	}
	
}