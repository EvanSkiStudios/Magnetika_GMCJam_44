draw_set_color(c_white);
draw_set_font(__fhInputFntLrg);
draw_set_halign(fa_center);
draw_text(512, 200, "Gamepad Remapping Example");
var str = "Status: ";
if(myStatus == 0)
	str += "Waiting....";
if(myStatus == 1)
	str += "Just a sec....";
if(myStatus == 2)
	str += "Touch a gamepad's input to remap the controls to it.";
draw_text(512, 250, str);

draw_set_font(__fhInputFntSml);
draw_set_halign(fa_left);
draw_text(100, 320, "Up - Action #0: | " + fhInputActionDescriptionGetLong(0));
draw_text(100, 384, "Down - Action #1: | " + fhInputActionDescriptionGetLong(1));
draw_text(100, 448, "Left - Action #2: | " + fhInputActionDescriptionGetLong(2));
draw_text(100, 512, "Right - Action #3: | " + fhInputActionDescriptionGetLong(3));

draw_set_font(__fhInputFntLrg);
draw_text(100, 600, "Press the button to remap assigned inputs to another gamepad.");
draw_text(100, 630, "Then touch an input on the second gamepad.");
draw_text(100, 660, "The system will remap the controls as well as possible.");