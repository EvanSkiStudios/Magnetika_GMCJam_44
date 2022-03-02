if !(DEBUG_MODE) exit;

var length = (array_length(global.lvl_list_array));

var array = global.lvl_list_array;

for (var i = 0; i < length; ++i){
	array[i]._lock = false;
	show_debug_message("POPPED LOCK OF LEVEL "+string(room_get_name(array[i]._room)));
}

