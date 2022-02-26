//input
fhInputInitialize();
fhInputActionMapSetDefault(global.control_scheme);

//audio
fhAudioInitialize();

mymethod = function(a, gp_id, disc){
	show_debug_message(
		string(a)+"\n"+
		string(gp_id)+"\n"+
		string(disc)
	);
	
	
	if (a == 0){
		global.GAMEPAD_ISCONNECTED = true;
		do_event_message(string(disc) + " CONNECTED.");
	}else{
		global.GAMEPAD_ISCONNECTED = false;
		do_event_message(string(disc) + " DISCONNECTED.");
	}
}

fhInputSetGamepadEventCallback(mymethod);

window_is_focused = true;