draw_set_color(FHINPUT_MAPPER_TextColor);
draw_set_font(FHINPUT_MAPPER_DescriptionFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
var currX = FHINPUT_MAPPER_DescriptionXPos;
var currY = FHINPUT_MAPPER_YPosStart;
var sep = FHINPUT_MAPPER_YSeparation;
draw_text(FHINPUT_MAPPER_ButtonDefaultXPos, currY, FHINPUT_MAPPER_StringSetButtonLabel);
draw_set_halign(fa_left);
draw_text(currX, currY, "Input");
currY += sep;
for(var i = 0; i < actionNum; i++)
{
	var str = fhInputActionDescriptionGetLong(i);
	draw_text(currX, currY, str);
	currY += sep;
}

draw_text(FHINPUT_MAPPER_StatusTextXPos, FHINPUT_MAPPER_StatusTextYPos, myText);