//Useful functions for gameplay

function invaild_keys(){
	var input = false;
	input += keyboard_check_pressed(vk_enter);
	input += keyboard_check_pressed(vk_alt);
	input += keyboard_check_pressed(vk_f11);
	input += keyboard_check_pressed(vk_f12);
	
	return( (input > 0) ? true : false );
}

function ScreenShot(){
	static num = 0;
	
	var filename = (working_directory + "\\ScreenShots\\Screen_");
	
	//check to see if there is already a png
	var num = ("__"+string(current_hour)+string(current_minute)+"_"+string(current_day)+string(current_month)+string(current_year) );
	var new_filename = (filename+string(num)+".png");
	
	//save the png
	screen_save(new_filename);
	//add to the number for a future png
	show_debug_message("Screen shot "+string(num)+" saved");
}

function fadetoroom(gotoroom, dur, _color){
	var inst = instance_create_depth(0,0,0,obj_gui_fadeout);
	with (inst){
		targetroom = gotoroom;
		duration = dur;
		color = _color;
	}
}