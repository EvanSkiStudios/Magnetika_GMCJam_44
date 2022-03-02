if audio_group_is_loaded(AudioGroup_SFX){
	if audio_group_is_loaded(AudioGroup_marte){
		if audio_group_is_loaded(AudioGroup_Music){
			//set audio
			audio_master_gain(global.Audio_master_volume);						
			audio_group_set_gain(AudioGroup_SFX, global.Audio_sfx_volume, 0);	
			audio_group_set_gain(AudioGroup_marte, global.Audio_marte_volume, 0);	
			audio_group_set_gain(AudioGroup_Music, global.Audio_music_volume, 0);

			room_goto_next();	
		}
	}
}