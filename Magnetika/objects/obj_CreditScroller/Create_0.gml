/// @description Insert description here
// You can write your code in this editor
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

credits = [
"CODE, ART, AUDIO",
"BY",
"PIXELLATED HAMMERED RACCOON",
" ",
"CREATED WITH",
"GAMEMAKER STUDIO 2.3 by YoYo Games",
" ",
" ",
"HEAD OF PIXELLATED GRAPHICAL DESIGN:",
"Pat \"PIXEL-TEAM\" Ferguson",
" ",
"HEAD OF HAMMERED AUDIO DESIGN:",
"Ken Burkhart \"FireHammer Games\"",
" ",
"HEAD OF RACCOON PROGRAMMING:",
"Evanski",
" ",
" ",
"SPECIAL THANKS:",
"OUR FAMILES",
"for not going crazy on us,",
"for making a game for a week",
" ",
"Mark Overmars",
"for creating Game Maker",
" ",
"Raccoons",
"For being fuzzy and adorable",
" ",
"Pat Ferguson",
"for letting Evanski write the end credits",
" ",
" ",
" ",
"THANKS FOR PLAYING"
];

total_height = sprite_get_height(spr_credits_logo) * .5 + display_get_gui_height() * .5 + (display_get_gui_height() * .05) * array_length(credits);




