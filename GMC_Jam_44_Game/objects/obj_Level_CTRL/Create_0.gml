room_end_did_once = false;
do_fade = false;

goto_room = rm_levelselect;


pop_lock = function(){
	
	if !(global.Level_current > array_length(global.lvl_list_array)){
		
		global.lvl_list_array[global.Level_current]._lock = false;
		show_debug_message("POPPED LOCK OF LEVEL "+string(room_get_name(global.lvl_list_array[global.Level_current]._room)));
		
	}
	
}