/// @description Insert description here
// You can write your code in this editor
start_gui_w = display_get_gui_width();
start_gui_h =display_get_gui_height();

display_set_gui_size(480, 270);
scroll_position = display_get_gui_height() * .5;
scroll_position_snapped = scroll_position;
line_position = 0;
line_spacing = display_get_gui_height() * .05;
//scroll_speed = ceil(display_get_gui_height() * .001);
scroll_speed = 15;//15
text_color = c_white;

_image_index = 0;

timer = 0;
logo_hold_time = 3;
max_time = logo_hold_time * room_speed;
scroll = false;

credit_logo = spr_credits_logo;

credits = [
"CODE, ART, AUDIO",
"BY",
"PIXELLATED HAMMERED RACCOON",
" ",
"CREATED WITH",
"GAMEMAKER STUDIO 2022.1 by YoYo Games",
" ",
" ",
"Project Lead:",
"Pat \"PIXEL-TEAM\" Ferguson",
" ",
"Audio / Gameplay Designer:",
"Ken Burkhart \"FireHammer Games\"",
" ",
"Lead Programmer / Level Designer:",
"Evanski",
" ",
" ",
" ",
" ",
"THANKS FOR PLAYING"
];

total_height = sprite_get_height(credit_logo) * .5 + display_get_gui_height() * .5 + (display_get_gui_height() * .05) * array_length(credits);




