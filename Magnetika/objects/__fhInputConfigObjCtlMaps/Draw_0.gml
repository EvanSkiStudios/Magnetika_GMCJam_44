draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(__fhInputFntLrg);
draw_text(512, 48, "Firehammer Input Default Action Maps");
draw_set_color(c_blue);
draw_text(512, 635, "Working Map # " + string(currentMap));
draw_set_color(c_white);
draw_set_font(__fhInputFntSml);
draw_set_halign(fa_left);
var instructionsX = 400;
draw_text(instructionsX, 100, "1.  Click CHANGE to change");
draw_text(instructionsX, 125, "     an action's input.");
draw_text(instructionsX, 150, "2.  There is a slight delay");
draw_text(instructionsX, 175, "     before you can press a key.");
draw_text(instructionsX, 200, "3.  Press a key to assign");
draw_text(instructionsX, 225, "     it to that action number.");
draw_text(instructionsX, 250, "4.  Repeat for all the actions.");
draw_text(instructionsX, 275, "5.  Click SAVE to save this map.");
draw_text(instructionsX, 300, "6.  Click ADD to add");
draw_text(instructionsX, 325, "     a new action map.");
draw_text(instructionsX, 350, "7.  Click LOAD to go back");
draw_text(instructionsX, 375, "     to the saved map.");
draw_text(instructionsX, 400, "8.  Click PREVIOUS and NEXT to");
draw_text(instructionsX, 425, "     to move through the maps.");
draw_text(instructionsX, 475, "Don't forget to save before");
draw_text(instructionsX, 500, "     moving through maps.");
draw_text(instructionsX, 525, "Check status information in");
draw_text(instructionsX, 550, "     the upper-left corner.");
draw_text(instructionsX, 575, "See which default map you are");
draw_text(instructionsX, 600, "     working on below in blue.");


if(amount > 0)
{
	var currY = drawStartY;
	var currX = buttonX2 - 72;
	var str = "";
	draw_set_halign(fa_right);
	if(amount > 18)
	{
		for(var i = 18; i < amount; i++)
		{
			str = string(i);
			str += ": ";
			str += fhInputActionDescriptionGetLong(i);
			draw_text(currX, currY, str);
			currY += drawSeparation;
		}
		tempAmount = 18;	
	}
	else
		tempAmount = amount;
	currY = drawStartY;
	currX = buttonX + 72;
	draw_set_halign(fa_left);
	for(var i = 0; i < tempAmount; i++)
	{
		str = string(i);
		str += ": ";
		str += fhInputActionDescriptionGetLong(i);
		draw_text(currX, currY, str);
		currY += drawSeparation;
	}
}