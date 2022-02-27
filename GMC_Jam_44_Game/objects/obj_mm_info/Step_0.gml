if (global.control_scheme == last_control_change) exit;

switch(global.control_scheme){
	default: case 0:{
		//WASD
		titlescreen_instructions = (
		"HOW TO PLAY"+"\n"+
		"MOVEMENT: W-A-S-D"+"\n"+
		"MAGNET GUN: SPACEBAR, NUMPAD 0, or Right Ctrl"+"\n"+
		"PAUSE: ESC"+"\n"+
		"READ THE README FOR MORE INFO!"
		);
	}break;
	
	case 1:{
		//Gamepad-joystick
		titlescreen_instructions = (
		"HOW TO PLAY"+"\n"+
		"MOVEMENT: LEFT JOY STICK"+"\n"+
		"MAGNET GUN: (Xbox) (A) or (B)"+"\n"+
		"PAUSE: START"+"\n"+
		"READ THE README FOR MORE INFO!"
		);
	}break;
	
	case 2:{
		//Gamepad-dpad
		//Gamepad-joystick
		titlescreen_instructions = (
		"HOW TO PLAY"+"\n"+
		"MOVEMENT: D-PAD"+"\n"+
		"MAGNET GUN: (Xbox) (A) or (B)"+"\n"+
		"PAUSE: START"+"\n"+
		"READ THE README FOR MORE INFO!"
		);
	}break;
	
	case 3:{
		//Arrow keys
		titlescreen_instructions = (
		"HOW TO PLAY"+"\n"+
		"MOVEMENT: ARROW KEYS"+"\n"+
		"MAGNET GUN: SPACEBAR, NUMPAD 0, or Right Ctrl"+"\n"+
		"PAUSE: ESC"+"\n"+
		"READ THE README FOR MORE INFO!"
		);
	}break;

}

last_control_change = global.control_scheme;