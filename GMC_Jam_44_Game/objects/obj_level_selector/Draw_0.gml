//collect data
var level = lvl_array[selected_level];
selected_level_pic = level._pic;
selected_level_title = level._name;


//draw pic
draw_self();

//if we have a sub image for it
if (selected_level_pic > (image_number-1)) selected_level_pic = 0;
image_index = selected_level_pic;

draw_set_font(fnt_text);
draw_set_halign(fa_center);

var spr_h = (sprite_height/2);

draw_text(
	x, (y + 50 + spr_h),
	("= "+selected_level_title+" =")
);

draw_text(
	x, (y - 50 - spr_h),
	"Level: "+string(selected_level+1)
);