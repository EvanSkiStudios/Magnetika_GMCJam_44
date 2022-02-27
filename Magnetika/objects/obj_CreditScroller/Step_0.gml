/// @description Insert description here
// You can write your code in this editor

_image_index += .25;
if (_image_index >= sprite_get_number(spr_credits_logo) -1) {
	_image_index = 0;	
}

if (keyboard_check(vk_anykey)) {
	fadetoroom(rm_mainmenu,60,c_white);
}

if (timer >= max_time) {
	scroll = true;	
} else {
	timer ++;
}
