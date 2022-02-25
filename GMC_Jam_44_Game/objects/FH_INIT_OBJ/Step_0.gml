//do_event_message("GAMEPAD UNPLUGGED");

var win_focus = window_has_focus();
var FHI_active = fhInputIsInitialized();

if (!win_focus) && (FHI_active) {
	//instance_deactivate_object(__fhInputObjController);
}else{
	if (win_focus){
		if !(FHI_active){
			//instance_activate_object(__fhInputObjController);	
			//fhi_activate();
		}
	}
}