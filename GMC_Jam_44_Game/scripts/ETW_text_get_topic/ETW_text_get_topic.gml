//array refs
#macro TContent 0
#macro TLoop 1
#macro TColor 2
#macro TFont 3
#macro TSprite 4
#macro TVoice 5
#macro TSpeed 6

enum Typewriter_text_ref{
	error = 0,
	level_1
}

//wrapper function that auto fills info
function ETW_Topic(text_num, settings_loop=false, text_color=c_white, text_sprite=-1, text_voice=-1, text_font=fnt_text, text_speed=0.25){
		text[text_num][TLoop] = settings_loop;
		text[text_num][TColor] = text_color;
		text[text_num][TFont] = text_font;
		text[text_num][TSprite] = text_sprite;
		text[text_num][TVoice] = text_voice;
		text[text_num][TSpeed] = text_speed;
}


function ETW_texttopic(){
	//reset array
	text = undefined;
	var i = 0;
	
	//gets text language struct
	ETW_text_get_lang(global.ETW_Game_lang);
	
	switch(global.game_convo_number)
	{
		//error for somehow not knowing what game convo we are at
		default:{
			text[i][TContent] = "Text in array is not set for current convo number "+string(global.game_convo_number)+" !!";
			ETW_Topic(i,,c_orange,,,,1.0);
		}break;

		// default set text
		// text[i][TContent] = struct_name.string_ref_name;
		// call ETW_Topic with optinal arguments to customize text

		//testing
		case Typewriter_text_ref.level_1:{			
			text[i][TContent] = ETW_Text_lang.level_1_intro;
			ETW_Topic(i,,,,1,,);
		}break;
	}
	
	//sets last array position to the length of the array
	//array length counts 0 as 1 so we remove 1 
	text_last = (array_length(text)-1);
}