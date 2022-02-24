draw_set_color(c_white);
draw_set_font(__fhInputFntLrg);
draw_set_halign(fa_center);
draw_text(512, 200, "Action Mapping Example");
var str = "Status: ";
if(myStatus == 0)
	str += "Waiting....";
if(myStatus == 1)
	str += "Just a sec....";
if(myStatus == 2)
	str += "Press/Move an input to assign it.";
draw_text(512, 250, str);

draw_set_font(__fhInputFntSml);
draw_set_halign(fa_left);
draw_text(200, 320, "Up - Action #0: | " + fhInputActionDescriptionGetLong(0));
draw_text(200, 384, "Down - Action #1: | " + fhInputActionDescriptionGetLong(1));
draw_text(200, 448, "Left - Action #2: | " + fhInputActionDescriptionGetLong(2));
draw_text(200, 512, "Right - Action #3: | " + fhInputActionDescriptionGetLong(3));

draw_set_halign(fa_right);
draw_text(1000, 320, fhInputActionGetDeviceName(0));
draw_text(1000, 384, fhInputActionGetDeviceName(1));
draw_text(1000, 448, fhInputActionGetDeviceName(2));
draw_text(1000, 512, fhInputActionGetDeviceName(3));

draw_set_halign(fa_left);
draw_set_font(__fhInputFntLrg);
draw_text(200, 600, "Press Buttons to change assigned inputs");
draw_text(200, 650, "Press Buttons on the right to go to other example rooms");