draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(__fhInputFntLrg);
draw_text(512, 32, "Firehammer Input Configuration Current Settings");

draw_set_halign(fa_left);
var drawX = 32;
var drawY = 128;
var drawSpace = 64;

var str = "Number of Players: ";
str += string(global.__fhInputNumPlayers);
draw_text(drawX, drawY, str);
drawY += drawSpace;

str = "Number of Actions: ";
str += string(global.__fhInputNumActions);
draw_text(drawX, drawY, str);
drawY += drawSpace;

str = "Debug Mode: ";
if(FHINPUT_SETTING_DebugMode)
	str += "Enabled";
else
	str += "Disabled";
draw_text(drawX, drawY, str);
drawY += drawSpace;

str = "Allow Conflicts: ";
if(global.__fhInputAllowConflicts)
	str += "Enabled";
else
	str += "Disabled";
draw_text(drawX, drawY, str);
drawY += drawSpace;

str = "Axis Down Threshold: ";
str += string(FHINPUT_SETTING_AxisThreshold);
draw_text(drawX, drawY, str);
drawY += drawSpace;

str = "Search Delay: ";
str += string(FHINPUT_SETTING_SearchDelay);
str += " Steps";
draw_text(drawX, drawY, str);
drawY += drawSpace;

str = "Search Timeout: ";
str += string(FHINPUT_SETTING_SearchTimeout);
str += " Steps";
draw_text(drawX, drawY, str);
drawY += drawSpace;