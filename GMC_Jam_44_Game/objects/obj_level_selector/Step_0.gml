if (!selector_enabled) return;

if keyboard_check_pressed(vk_right) {
	selected_level = ( (selected_level != lvl_select_list_end) ? (selected_level + 1) : 0 );
}

if keyboard_check_pressed(vk_left) {
	selected_level = ( (selected_level != 0) ? (selected_level - 1) :  lvl_select_list_end);
}

if keyboard_check_released(vk_space){
	//collect data
	var level = lvl_array[selected_level];
	selected_level_room = level._room;
	fadetoroom(selected_level_room,15,$fddebf);
	selector_enabled = false;
}