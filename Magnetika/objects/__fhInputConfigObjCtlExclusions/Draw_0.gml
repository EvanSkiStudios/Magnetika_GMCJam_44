draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(__fhInputFntLrg);
draw_text(512, 32, "Firehammer Input Exclusions");
draw_set_font(__fhInputFntSml);
draw_set_halign(fa_left);
var instructionsX = 300;
draw_text(instructionsX, 100, "1.  Click ADD to add an exclusion.");
draw_text(instructionsX, 125, "2.  There is a slight delay before you can press a key.");
draw_text(instructionsX, 150, "3.  Press the key you want to exclude.");
draw_text(instructionsX, 175, "4.  Repeat to add more keys up to a total of 36.");
draw_text(instructionsX, 200, "5.  Click SAVE to save the showing exclusions.");
draw_text(instructionsX, 225, "6.  Click REMOVE to delete the exclusion next to the button.");
draw_text(instructionsX, 300, "Note that after exclusion #18 they will display to the right.");
draw_text(instructionsX, 325, "Check status information in the upper-left corner.");
draw_text(instructionsX, 350, "Click LOAD to go back to previously saved settings.");


if(amount > 0)
{
	var currY = drawStartY;
	var currX = buttonX2 - 72;
	var str = "";
	var key = 0;
	draw_set_halign(fa_right);
	if(amount > 18)
	{
		for(var i = 18; i < amount; i++)
		{
			key = __fhInputObjController.myExclusions[i];
			str = global.__fhInputDescriptionKeys[__fhInputObjController.myExclusions[i]];
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
		key = __fhInputObjController.myExclusions[i];
		str = global.__fhInputDescriptionKeys[__fhInputObjController.myExclusions[i]];
		draw_text(currX, currY, str);
		currY += drawSeparation;
	}
}