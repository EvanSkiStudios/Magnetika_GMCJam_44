//Check if we need to update the content of the array every loop due to dynamic things like a color macro
var settings_loop = text[text_current][TLoop];
if (settings_loop == true){
	ETW_texttopic();	
}

//draw talker_sprite_here


/*
With that done, it's time to actually draw our dialogue text! First, we need to check the current last character of the text being drawn,
and if it's not the last character of the whole text, advance it by the speed that we set in the create event:
*/

//set textspeed
char_speed = text[text_current][TSpeed];

var len = string_length(text[text_current][TContent]); 
if (char_current < len) { 
	char_current += char_speed;
	
	//play audio
	voice_profile = text[text_current][TVoice];
	if (voice_profile != -1){
		ETW_typewriter_audio(voice_profile);
	}
}


/*
To draw the text, we simply use the string_copy() function to copy the section of the 
total text from the beginning to the current last character and then draw that, like this:
*/

//draw text settings
draw_set_halign(display_text_H_align);
draw_set_valign(fa_top);

var cam_w = camera_get_view_width(0);
//magic number is from testing where we want it, so our start y is how high from the camera height we want
var full_y = camera_get_view_height(0);
var _y = ( full_y - 44 );
// x is how far to the right do we want the text to start
var _x = x;

var color = $1c1414;
marte_string = "MART-E";
draw_set_font(fnt_text_small);
//NAME TAG
draw_rectangle_color(
	0,
	(_y - 20) - string_height("W") - 3,
	2 + string_width(marte_string),
	_y - 20,
	c_white,c_white,c_white,c_white,
	true
);
draw_set_alpha(0.9);
draw_rectangle_color(
	0,
	(_y - 20) - string_height("W") - 3,
	2 + string_width(marte_string),
	_y - 20,
	color,color,color,color,
	false
);
draw_text(2,
	((_y - 20) - string_height("W")),
	marte_string
);

//BACKGROUND
draw_rectangle_color(
	_x - cam_w,
	_y - 20,
	_x + cam_w,
	full_y - 2, //minus width of white outline
	c_white,c_white,c_white,c_white,
	true
);
draw_set_alpha(0.9);
draw_rectangle_color(
	_x - cam_w,
	_y - 20,
	_x + cam_w,
	full_y - 2,
	color,color,color,color,
	false
);
draw_set_alpha(1);

//gets custom font from array
custom_text_font = text[text_current][TFont];
if (custom_text_font != -1) text_font = custom_text_font;
//if the above value is -1 it will use teh default from create event instead
draw_set_font(text_font);

if (global.ETW_Game_lang == game_langs.japanese){
	//fallback to font that allows cjf glyphs
	draw_set_font(fnt_ETW_lang);
}


//gets color of text from array
text_color = text[text_current][TColor];

//supplies text from array pased through draw_set_color
var _str = string_copy(text[text_current][TContent], 1, char_current);
draw_text_color(text_x, text_y,  _str, text_color,text_color,text_color,text_color,1);

//draw end of text symbol
if ( (char_current == len) && (eol_tri_blink) ){
	
	draw_set_color($ffffff);
	
	//tri size
	var tri_w = 12; var tri_h = 6;
	
	//tri location
	var tri_1_x = ((cam_w/2) - (tri_w/2));
	var tri_1_y = (full_y - 10);
	
	draw_triangle(
	tri_1_x, (tri_1_y),
	(tri_1_x + tri_w), (tri_1_y),
	(tri_1_x + (tri_w/2)), (tri_1_y + tri_h),
	false);
}

//reset draw
ETW_draw_set_default();