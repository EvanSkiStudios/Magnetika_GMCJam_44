/// @function get_input();
/*
get_input = function () {
	
	left = false;
	right = false;
	up = false;
	down = false;
	fire = false;
	
	left_pressed = false;
	right_pressed = false;
	up_pressed = false;
	down_pressed = false;
	fire_pressed = false;
	
	if ( !(global.GAME_IS_PAUSED) && !(instance_exists(obj_ETW_Dialog_Typewriter)) ){
	
		if ( fhInputActionCheckDown(FHINPUTACTION_Activate) || fhInputActionCheckDown(FHINPUTACTION_ActivateAlt) || fhInputActionCheckDown(FHINPUTACTION_ActivateAltLH) ) {
			fire = true;	
		}
		if ( fhInputActionCheckPressed(FHINPUTACTION_Activate) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAlt) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAltLH) )  {
			fire_pressed = true;
		}
	
		if ( fhInputActionCheckDown(FHINPUTACTION_Left)) {
			left = true;	
		} else if ( fhInputActionCheckDown(FHINPUTACTION_Right)) {
			right = true;
		}
	
		if ( fhInputActionCheckPressed(FHINPUTACTION_Left)) {
			left_pressed = true;	
		} else if ( fhInputActionCheckPressed(FHINPUTACTION_Right)) {
			right_pressed = true;
		}
	
		if ( fhInputActionCheckDown(FHINPUTACTION_Up)) {
			up = true;	
		} else if ( fhInputActionCheckDown(FHINPUTACTION_Down)) {
			down = true;
		}
		if ( fhInputActionCheckPressed(FHINPUTACTION_Up)) {
			up_pressed = true;	
		} else if ( fhInputActionCheckPressed(FHINPUTACTION_Down)) {
			down_pressed = true;
		}
	
	}
}
