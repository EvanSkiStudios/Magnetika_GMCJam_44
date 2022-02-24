draw_set_color(c_white);
draw_set_font(__fhInputFntLrg);
draw_set_halign(fa_center);
draw_text(512, 200, "Conflict Resolution Example");
var str = "Status: ";
if(myStatus == 0)
	str += "Waiting....";
if(myStatus == 1)
	str += "Just a sec....";
if(myStatus == 2)
	str += "Press/Move an input to assign it.";
if(myStatus == 3)
	str += "Conflict Assigned... press 'Y' to swap, press 'N' to cancel.";
draw_text(512, 250, str);

draw_set_font(__fhInputFntSml);
draw_set_halign(fa_left);
draw_text(200, 320, "Up - Action #0: | " + fhInputActionDescriptionGetShort(0));
draw_text(200, 384, "Down - Action #1: | " + fhInputActionDescriptionGetShort(1));
draw_text(200, 448, "Left - Action #2: | " + fhInputActionDescriptionGetShort(2));
draw_text(200, 512, "Right - Action #3: | " + fhInputActionDescriptionGetShort(3));

draw_set_font(__fhInputFntLrg);
draw_text(200, 600, "Press Buttons to change assigned inputs");
draw_text(200, 630, "Set one that creates a conflict and see how it reacts.");
draw_text(200, 660, "Press Y or N to swap with the conflict or to revert the change.");