if ( !(global.level_intro_done) || (instance_exists(obj_ETW_Dialog_Typewriter)) || (instance_exists(obj_ctrl_create_typewriter)) ) exit;

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_text);


var _h = display_get_gui_height();
var _w = (display_get_gui_width() / 2);

draw_text(_w,50, "Level "+string(level_number+1));

draw_text(_w,_h - 50, "== "+string(level_title)+" ==");

draw_set_font(-1);
draw_set_halign(fa_left);