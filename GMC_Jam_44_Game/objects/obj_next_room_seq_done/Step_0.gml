if (DEBUG_MODE){
	var keys = invaild_keys();
	if !(keys){
		//|| fhInputActionCheckPressed(FHINPUTACTION_Action1)
		if ( keyboard_check_pressed(vk_anykey) || fhInputActionCheckPressed(FHINPUTACTION_Action1) ){
			fadetoroom(rm_mainmenu,20,c_white);
		}
	}
}


if (layer_sequence_is_finished(sequance_id)){
	if !(instance_exists(obj_gui_fadeout)){	
		fadetoroom(rm_mainmenu,2,c_white);
	}
}