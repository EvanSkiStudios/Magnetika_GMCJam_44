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

var full_y = display_get_gui_height();
var _x = x;

//marte draw settings
var color = $1c1414;
marte_string = "MART-E";

draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//background box draw loc
var cam_w = display_get_gui_width();
var background_x_start = (_x - cam_w); var background_x_end = (_x + cam_w);
var background_y_end = (full_y - 3);
var background_y_start = (full_y - 100);

//marte box draw loc
var marte_name_end_y = (background_y_start);
var marte_name_start_y = ( (background_y_start) - ((string_height("W")) + 5) );
var marte_name_end_x = (2 + string_width(marte_string));

//NAME TAG for marte
//outline
draw_rectangle_color(
	0, (marte_name_start_y) ,
	marte_name_end_x, marte_name_end_y,
	c_white,c_white,c_white,c_white,
	true
);

//background 
draw_set_alpha(0.9);
	draw_rectangle_color(
		0, marte_name_start_y,
		marte_name_end_x, marte_name_end_y,
		color,color,color,color,
		false
	);
draw_set_alpha(1);

draw_text(
	2, ((marte_name_end_y) - string_height("W")),
	marte_string
);

//BACKGROUND for text
//outline
	draw_rectangle_color(
		background_x_start, background_y_start,
		background_x_end, background_y_end,
		c_white,c_white,c_white,c_white,true
	);
//background
draw_set_alpha(0.9);
	draw_rectangle_color(
		background_x_start, background_y_start,
		background_x_end, background_y_end,
		color,color,color,color,false
	);
draw_set_alpha(1);

//gets custom font from array
custom_text_font = text[text_current][TFont];
if (custom_text_font != -1) text_font = custom_text_font;

//if the above value is -1 it will use teh default from create event instead
draw_set_font(text_font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


//gets color of text from array
text_color = text[text_current][TColor];

//supplies text from array pased through draw_set_color
var _str = string_copy(text[text_current][TContent], 1, char_current);

/*
if (os_type == os_windows){
	if (room == rm_Level1){
		if (char_current >= 60){
			_str = string_replace(_str,"[SUBJECT_NAME_HERE]",USER_NAME);
		}
	}else{
		_str = string_replace(_str,"[USER_NAME]",USER_NAME);
	}
}
*/

draw_text_color(text_x, background_y_start+10,  _str, text_color,text_color,text_color,text_color,1);

//draw end of text symbol
if ( (char_current == len) && (eol_tri_blink) ){
	
	draw_set_color($ffffff);
	
	//tri size
	var scale = 2;
	
	var tri_w = (12)*scale; var tri_h = (6)*scale;
	
	//tri location
	var tri_1_x = ((cam_w/2) - (tri_w/2));
	var tri_1_y = (full_y - (10 * scale));
	
	draw_triangle(
	tri_1_x, (tri_1_y),
	(tri_1_x + tri_w), (tri_1_y),
	(tri_1_x + (tri_w/2)), (tri_1_y + tri_h),
	false);
}

//reset draw
ETW_draw_set_default();