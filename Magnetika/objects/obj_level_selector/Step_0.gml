if (!selector_enabled) return;

if fhInputActionCheckPressed(FHINPUTACTION_Right) {
	selected_level = ( (selected_level != lvl_select_list_end) ? (selected_level + 1) : 0 );
}

if fhInputActionCheckPressed(FHINPUTACTION_Left) {
	selected_level = ( (selected_level != 0) ? (selected_level - 1) :  lvl_select_list_end);
}

if fhInputActionCheckPressed(FHINPUTACTION_Activate) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAlt) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAltLH) || fhInputActionCheckPressed(FHINPUTACTION_ActivateMenuAlt) {
	//collect data
	if !(selected_level_locked){
		var level = lvl_array[selected_level];
		selected_level_room = level._room;
		if !room_exists(selected_level_room) selected_level_room = rm_levelselect;
		
		global.Level_current = selected_level+1;
		
		fadetoroom(selected_level_room,15,$fddebf);
		selector_enabled = false;
	}
}

if keyboard_check_pressed(vk_escape) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAlt) {
	fadetoroom(rm_mainmenu,20,$fddebf);
}