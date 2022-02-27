/// @description Insert description here
// You can write your code in this editor
draw_set_font(message_font);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
//draw_text(display_get_gui_width() * .5, display_get_gui_height() * .5, "HELLO");//works
draw_text_ext_color(_w * pos_x, pos_y, current_message, 10, _w, color_upper, color_upper, color_lower, color_lower, 1);

draw_set_font(-1);
draw_set_halign(fa_left);