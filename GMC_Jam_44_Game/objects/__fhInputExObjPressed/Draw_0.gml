draw_self();
draw_set_font(__fhInputFntSml);
draw_set_halign(fa_left);
draw_text(x+16, y, "Use Action #1(Pressed Status) to shoot.");
draw_text(x+16, y+32, "Note that it only shoots when the input");
draw_text(x+16, y+64, "is first pressed and won't shoot again");
draw_text(x+16, y+96, "until you first release the input.");