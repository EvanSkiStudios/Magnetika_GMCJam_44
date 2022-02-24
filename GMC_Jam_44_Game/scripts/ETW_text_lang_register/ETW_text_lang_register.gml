//language id ref
enum game_langs{
	english = 0,
	spanish,
	japanese
}
//English should always be 0


function ETW_text_get_lang(lang=0){

/* =====How to use=====
struct_ref_game_uses_to_get_strings = {
	string_name_ref :  "string_value",
}*/

	switch(lang){
		
		default:
		case game_langs.english:{

			ETW_Text_lang = {
				gl_level_1 :  "Your mom is gay! Fatty Fatty no parents!",
				gl_level_1_a :  "And no one loves you!",
				gl_level_1_b :  "you will die alone!"
			};
		}break;
	}
}