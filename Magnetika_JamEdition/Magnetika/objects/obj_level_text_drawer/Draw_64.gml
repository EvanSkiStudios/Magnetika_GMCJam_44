if ( !(global.level_intro_done) || (global.level_end_reached) || (instance_exists(obj_ETW_Dialog_Typewriter)) || (instance_exists(obj_ctrl_create_typewriter)) ) exit;

draw_set_font(fnt_text);
draw_set_valign(fa_top);
draw_set_halign(fa_center);


var _h = display_get_gui_height();
var _w = ((display_get_gui_width() / 2));

var level_num = ("Level "+string(level_number+1));
var string_level_title = ("== "+string(level_title)+" ==");

draw_text(_w - (string_length(level_num)/2), 50, level_num);

draw_text(_w - (string_length(string_level_title)/2),_h - 50, string_level_title);


draw_set_font(-1);
draw_set_halign(fa_left);