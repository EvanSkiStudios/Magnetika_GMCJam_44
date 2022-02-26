room_end_did_once = false;
do_fade = false;

goto_room = rm_levelselect;


pop_lock = function(){
	if !(global.Level_current > array_length(global.lvl_list_array)){

		global.Level_current += 1;
		global.lvl_list_array[global.Level_current]._lock = false;	
	
	}
}