text_wrap = 650;

if !(global.level_end_reached){
	//START ROOM TEXT
	switch(room){
		default: Text_convo_ref = Typewriter_text_ref.error; break;	
	
		case rm_Level1:{
			Text_convo_ref = Typewriter_text_ref.level_1_intro;
		} break;
		
		case rm_Level2:{
			Text_convo_ref = Typewriter_text_ref.level_2_intro;
		} break;
	
	}
	
}else{
	
	//END ROOM TEXT
	switch(room){
		default: Text_convo_ref = Typewriter_text_ref.error; break;	
	
		case rm_Level1:{
			Text_convo_ref = Typewriter_text_ref.level_1_outro;
		} break;
		
		case rm_Level2:{
			Text_convo_ref = Typewriter_text_ref.level_2_outro;
		} break;
	
	}
	
}