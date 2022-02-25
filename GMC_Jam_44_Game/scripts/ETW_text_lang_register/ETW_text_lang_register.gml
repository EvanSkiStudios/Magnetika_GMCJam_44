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
				level_1_intro: "Hello, Welcome to the Gauss Magnetics Corporation, [SUBJECT_NAME_HERE]. Your goal is simple, make it from point A to point B.",
				level_1_outro: "Very well done! The G.M.C would like to congratulate"+"\n"+"you on completing such a hard task."
			};
		}break;
	}
}