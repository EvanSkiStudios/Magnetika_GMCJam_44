//input
fhInputInitialize();
fhInputActionMapSetDefault(global.control_scheme);

mymethod = function(a, gp_id, disc){
	show_debug_message(
		string(a)+"\n"+
		string(gp_id)+"\n"+
		string(disc)
	);
	
	
	if (a == 0){
		global.GAMEPAD_ISCONNECTED = true;
		do_event_message(string(disc) + " CONNECTED.");
		
		if ( (global.control_scheme != 1) && (global.control_scheme != 2) ){
			fhInputActionMapSetDefault(1);
			global.control_scheme = 1;
		}
	}else{
		global.GAMEPAD_ISCONNECTED = false;
		do_event_message(string(disc) + " DISCONNECTED.");
		
		if ( (global.control_scheme != 0) && (global.control_scheme != 3) ){
			fhInputActionMapSetDefault(0);
			global.control_scheme = 0;
		}
	}
}

fhInputSetGamepadEventCallback(mymethod);

window_is_focused = true;


//audio
fhAudioInitialize();

/*
#macro SND_MUS_MENU "snd_mus_menu"
fhAudioSoundCreate(SND_MUS_MENU,FHAUDIO_CATEGORY_GAME,snd_mus_menu,0.0,0.0,);
*/

fhAudioMusicSetLoopPoints(snd_mus_menu,18823,65882);
fhAudioMusicSetLoopPoints(snd_mus_levels,16695,125217);


fhAudioMusicRoomChangeSet(rm_mainmenu,snd_mus_menu);
fhAudioMusicRoomChangeSet(rm_levelselect,snd_mus_menu);

fhAudioMusicRoomChangeSet(rm_level_1,snd_mus_levels);
fhAudioMusicRoomChangeSet(rm_level_2,snd_mus_levels);
fhAudioMusicRoomChangeSet(rm_level_3,snd_mus_levels);