if (!selector_enabled) return;

if fhInputActionCheckPressed(FHINPUTACTION_Right) {
	selected_level = ( (selected_level != lvl_select_list_end) ? (selected_level + 1) : 0 );
}

if fhInputActionCheckPressed(FHINPUTACTION_Left) {
	selected_level = ( (selected_level != 0) ? (selected_level - 1) :  lvl_select_list_end);
}

if fhInputActionCheckPressed(FHINPUTACTION_Activate) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAlt) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAltLH) || fhInputActionCheckPressed(FHINPUTACTION_ActivateMenuAlt) {
	//collect data
	var level = lvl_array[selected_level];
	selected_level_room = level._room;
	fadetoroom(selected_level_room,15,$fddebf);
	selector_enabled = false;
}