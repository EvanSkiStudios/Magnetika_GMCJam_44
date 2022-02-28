//input
fhInputInitialize();
fhInputActionMapSetDefault(global.control_scheme);

mymethod = function(a, gp_id, disc){
	show_debug_message(
		string(a)+"\n"+
		string(gp_id)+"\n"+
		string(disc)
	);
	
	//fhInputSystemActionsInputMissing(); bool
	
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

#macro SND_GIRL_FOOTSTEP "snd_girl_footstep" 
fhAudioSoundCreate(SND_GIRL_FOOTSTEP,FHAUDIO_CATEGORY_GAME,snd_girl_footstep,0.1,0.1,);

#macro SND_LEVEL_IN "snd_sfx_level_in"
fhAudioSoundCreate(SND_LEVEL_IN,FHAUDIO_CATEGORY_GAME,snd_sfx_level_in,);

#macro SND_LEVEL_OUT "snd_sfx_level_out"
fhAudioSoundCreate(SND_LEVEL_OUT,FHAUDIO_CATEGORY_GAME,snd_sfx_level_out,);

//music
fhAudioMusicSetLoopPoints(snd_mus_menu,18823,65882);
fhAudioMusicSetLoopPoints(snd_mus_levels,16695,125217);
fhAudioMusicSetLoopPoints(snd_mus_boss,11636,58181);


fhAudioMusicRoomChangeSet(rm_mainmenu,snd_mus_menu);
fhAudioMusicRoomChangeSet(rm_levelselect,snd_mus_menu);
fhAudioMusicRoomChangeSet(rm_credits,snd_mus_victory);
fhAudioMusicRoomChangeSet(rm_level_12,snd_mus_boss);


var _array_length = (array_length(global.lvl_list_array));
	
for (var i = 0; i < _array_length; ++i){
	var _array_room = global.lvl_list_array[i]._room;
	
	fhAudioMusicRoomChangeSet(_array_room,snd_mus_levels);
}