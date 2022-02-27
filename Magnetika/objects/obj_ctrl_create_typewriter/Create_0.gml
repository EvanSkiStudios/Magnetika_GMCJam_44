text_wrap = global.text_wrap;

if !(global.level_end_reached){
	//START ROOM TEXT
	switch(room){
		default: Text_convo_ref = Typewriter_text_ref.error; break;	
	
		case Level_1:{
			Text_convo_ref = Typewriter_text_ref.level_1_intro;
		} break;
		
		case Level_2:{
			Text_convo_ref = Typewriter_text_ref.level_2_intro;
		} break;
		
		case Level_4:{
			Text_convo_ref = Typewriter_text_ref.level_4_intro;
		} break;
		
		case Level_5:{
			Text_convo_ref = Typewriter_text_ref.level_5_intro;
		} break;
		
		case Level_6:{
			Text_convo_ref = Typewriter_text_ref.level_6_intro;
		} break;
	
	}
	
}else{
	
	//END ROOM TEXT
	switch(room){
		default: Text_convo_ref = Typewriter_text_ref.error; break;	
	
		case Level_1:{
			Text_convo_ref = Typewriter_text_ref.level_1_outro;
		} break;
		
		case Level_2:{
			Text_convo_ref = Typewriter_text_ref.level_2_outro;
		} break;
		
		case Level_4:{
			Text_convo_ref = Typewriter_text_ref.level_4_outro;
		} break;
		
		case Level_5:{
			Text_convo_ref = Typewriter_text_ref.level_5_outro;
		} break;
		
		case Level_6:{
			Text_convo_ref = Typewriter_text_ref.level_6_outro;
		} break;
	
	}
	
}