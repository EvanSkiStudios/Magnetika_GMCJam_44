//do_event_message("GAMEPAD UNPLUGGED");

var win_focus = window_has_focus();

if (!win_focus){
	if (window_is_focused){
		fhInputPlayerSetManual(0);
		window_is_focused = false;
	}
}else{
	if !(window_is_focused){
		fhInputPlayerSetAuto(0);
		window_is_focused = true;
	}
}