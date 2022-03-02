draw_set_font(fnt_mm_text);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(color_purple);

draw_text(display_get_gui_width() * .5, (display_get_gui_height() * .7) + 30, titlescreen_instructions);
draw_text(display_get_gui_width() * .5, (display_get_gui_height() * .9) - 10, titlescreen_mini_credits);

draw_set_font(-1);
draw_set_color(c_white);
draw_set_halign(fa_left);