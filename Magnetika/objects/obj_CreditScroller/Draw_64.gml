/// @description Insert description here
// You can write your code in this editor

draw_set_font(C64ProMono);
draw_set_halign(fa_center);
draw_set_color(text_color);

line_position = 0;

//draw_sprite(spr_credits_logo, 0, display_get_gui_width() * .5, scroll_position);

draw_sprite_ext(credit_logo, _image_index, display_get_gui_width() * .5, scroll_position, 1, 1, 0, c_white, 1);
line_position += display_get_gui_height() * .5;

for (var i = 0; i < array_length(credits); i++) {
	var line = credits[i];
	
	draw_text_color(display_get_gui_width() / 2, scroll_position + line_position, line, c_white, c_white, c_purple, c_purple,1);
	line_position += line_spacing;
};

if (scroll) {
	scroll_position -= scroll_speed / room_speed;
}

//End of credits reached
if (scroll_position <= 0 - total_height) {
	//scroll_position = display_get_gui_height();//start over, or...
	fadetoroom(rm_mainmenu,60,c_purple);
}