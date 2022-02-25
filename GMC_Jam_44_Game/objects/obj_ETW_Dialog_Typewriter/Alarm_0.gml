//end of line, press button notification symbol
eol_tri_blink = !eol_tri_blink;

eol_tri_blink_speed = eol_tri_blink ? 35.0 : 27.35;
alarm[0] = eol_tri_blink_speed;