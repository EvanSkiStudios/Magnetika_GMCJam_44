function ETW_typewriter_audio(voice){

	//checks if char_current is a whole number or at the start of the string so we can check the letter we are on
	if ( (frac(char_current) == 0) || (char_current == (char_start+char_speed)) ){
		//show_debug_message(string_char_at(text[text_current],char_current));
		var can_get_current_char = true;	
	}else{
		var can_get_current_char = false;	
	}
	
	//if we cant get the current char then exit
	if !(can_get_current_char) exit;
	
	//Get current char in string
	var current_char = (string_char_at(text[text_current][TContent],char_current));
		
	typewriter_char_symbols = ("!@#$%^&*()\/?.,:;\"");
	typewriter_char_vowels = ("AaEeIiOoUu");
	
	
	var sound_to_play = noone;
	
	//default values
	voice_pitch = 1;
	sound_symbols = snd_ETW_null;
	sound_vowels = snd_ETW_null;
	sound_consts = snd_ETW_null;
	
	switch(voice){
		default:{
			//does not try to play audio and just returns
			return;
		}break;
		
		case 1:{
			voice_pitch = 1;
			sound_symbols = snd_ETW_null;
			sound_vowels = snd_marte_vowel_02;
			sound_consts = choose(snd_marte_const_01,snd_marte_const_02);
		}break;
		
	}
	
	
	
	if (string_count(current_char, typewriter_char_symbols) != 0){
		//show_debug_message(string(current_char)+" is an SYMBOL");
		sound_to_play = sound_symbols;
	}
	
	if (string_count(current_char, typewriter_char_vowels) != 0){
		//show_debug_message(string(current_char)+" is an vowel");
		sound_to_play = sound_vowels;
	}
	
	if (string_count(current_char, typewriter_char_symbols) == 0) && (string_count(current_char, typewriter_char_vowels) == 0){
		sound_to_play = sound_consts;	
	}	
		
	
	//if the char at the position of the string is not a space
	if !( (string_char_at(text[text_current][TContent],char_current)) == (" ") ){
		if !( (string_char_at(text[text_current][TContent],char_current)) == (".") ){
			
			if (sound_to_play != noone){	
			
				if ( audio_is_playing(sound_consts) || audio_is_playing(sound_vowels) || audio_is_playing(sound_symbols) ){
					audio_stop_sound(sound_consts);
					audio_stop_sound(sound_vowels);
					audio_stop_sound(sound_symbols);
				}
			
			
				//plays sound
				if !(audio_is_playing(sound_to_play)){
					audio_play_sound(sound_to_play,1,false);
				}else{
					audio_stop_sound(sound_to_play);
					audio_play_sound(sound_to_play,1,false);
				}
			
				audio_sound_pitch(sound_to_play,voice_pitch);	
				audio_play_sound(sound_to_play,1,false);
			}
		}
	}
}