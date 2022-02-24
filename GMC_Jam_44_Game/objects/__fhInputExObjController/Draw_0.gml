
//Draws the state of all four actions in the upper left corner
draw_set_font(__fhInputFntSml);
draw_set_color(c_white);

/*gather all the states into a temporary 2d array
[x][0] is the raw value
[x][1] is the down state
[x][2] is the just pressed state
[x][3] is the just released state
[x][4] is the time held in steps
note that "pressed" and "released" only come true for a single step so are harder to catch
*/
var array;
for(var i = 0; i < 4; i++)
{
	array[i][0] = string(fhInputActionCheckRawValue(i));
	array[i][1] = fhInputActionCheckDown(i);
	array[i][2] = fhInputActionCheckPressed(i);
	array[i][3] = fhInputActionCheckReleased(i);
	array[i][4] = string(fhInputActionCheckHeldSteps(i));
	array[i][5] = fhInputActionDescriptionGetShort(i);
}

//draw the data to a little table

var xPosStart = 10;
var xPosIncrement = 70;
var yPosStart = 10;
var yPosIncrement = 15;
var tempText = "true";

var xPos = xPosStart;
var yPos = yPosStart;

draw_set_halign(fa_left);

draw_text(xPos, yPos, "#");
xPos += xPosIncrement;
draw_text(xPos, yPos, "Raw");
xPos += xPosIncrement;
draw_text(xPos, yPos, "Down");
xPos += xPosIncrement;
draw_text(xPos, yPos, "Pressed");
xPos += xPosIncrement;
draw_text(xPos, yPos, "Released");
xPos += xPosIncrement;
draw_text(xPos, yPos, "Time");
xPos += xPosIncrement;
draw_text(xPos, yPos, "Input Assigned");
yPos += yPosIncrement;


for(var i = 0; i < 4; i++)
{
	xPos = xPosStart;
	draw_text(xPos, yPos, string(i));
	xPos += xPosIncrement;
	draw_text(xPos, yPos, array[i][0]);
	xPos += xPosIncrement;
	tempText = array[i][1] ? "true" : "false";
	draw_text(xPos, yPos, tempText);
	xPos += xPosIncrement;
	tempText = array[i][2] ? "true" : "false";
	draw_text(xPos, yPos, tempText);
	xPos += xPosIncrement;
	tempText = array[i][3] ? "true" : "false";
	draw_text(xPos, yPos, tempText);
	xPos += xPosIncrement;
	draw_text(xPos, yPos, array[i][4]);
	xPos += xPosIncrement;
	draw_text(xPos, yPos, array[i][5]);
	
	yPos += yPosIncrement;
}