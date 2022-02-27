//collect data
var level = lvl_array[selected_level];
selected_level_pic = level._pic;
selected_level_title = level._name;
selected_level_locked = level._lock;


//draw pic
if (selected_level_locked){
	shader_set(shd_greyscale);
	draw_self();
	draw_sprite_ext(spr_level_lock,0,x,y,2,2,0,c_white,1);
	shader_reset();
	selected_level_title = "Level Locked";
	
}else{
	draw_self();
}

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


switch(global.control_scheme){
	default: case 0:{
		//WASD
		level_select_instrct = (
		"Use A to cycle to the previous level"+"\n"+
		"Use D to cycle to the next level"+"\n"+
		"Use Space to select the Level"+"\n"+
		"Use Esc to return to the main menu!"
		);
	}break;
	
	case 1:{
		//JOY STICK
		level_select_instrct = (
		"Push the Left stick to the Left to cycle to the previous level"+"\n"+
		"Push the Left stick to the Right to cycle to the next level"+"\n"+
		"Use (xbox)(A) or Start to select the Level"+"\n"+
		"Use (xbox)(B) to return to the main menu!"
		);
		
	}break;
	
	case 2:{
		//D-Pad
		level_select_instrct = (
		"Use D-pad Left to the Left to cycle to the previous level"+"\n"+
		"Use D-pad Right stick to the Right to cycle to the next level"+"\n"+
		"Use (xbox)(A) or Start to select the Level"+"\n"+
		"Use (xbox)(B) to return to the main menu!"
		);
	}break;
	
	case 3:{
		//Arrows
		level_select_instrct = (
		"Use Arrow Left to cycle to the previous level"+"\n"+
		"Use Arrow Right to cycle to the next level"+"\n"+
		"Use Space to select the Level"+"\n"+
		"Use Esc to return to the main menu!"
		);
	}break;
	
}


draw_text(
	x, (y + 200 + spr_h),
	level_select_instrct
);

draw_set_halign(fa_left);