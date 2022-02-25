///Init Container for things needed for Typewriter
#macro C_RAINBOW make_color_hsv(current_time*0.1 mod 255,120,250)


//=====================================
//          globals
//=====================================
//sets game language
global.ETW_Game_lang = game_langs.english;


//=====================================
//          FUNCTIONS
//=====================================
function ETW_Create_typewriter(text_convo_number,  _text_wrap=400, _x=32, _y=304, _depth=depth){
	global.game_convo_number = text_convo_number;
	
	instance_create_depth(_x,_y,_depth,obj_ETW_Dialog_Typewriter);
}

function ETW_draw_set_default(){
	//Sets all Draw options to there default states.

	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}