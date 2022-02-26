depth = -9999;

menu_width = display_get_gui_width();
menu_height = display_get_gui_height();


enum menu_page{
	main,
	settings,
	audio,
	graphics,
	height
}

enum menu_element_type{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

//CREATE MENU PAGES
if (room == rm_mainmenu){
	var play_game = "Start Game";	
}else{
	var play_game = "Resume Game";	
}

ds_menu_main = create_menu_page(
	[play_game,		menu_element_type.script_runner,	resume_game],
	["Settings",	menu_element_type.page_transfer,	menu_page.settings],
	["Quit",		menu_element_type.script_runner,	exit_game]
);

ds_menu_settings = create_menu_page(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	["CONTROLS",	menu_element_type.shift,	controls_scheme, 0, ["W-A-S-D", "Arrow Keys", "Gamepad-JoyStick", "Gamepad-DPad"]],
	["GRAPHICS",	menu_element_type.page_transfer,	menu_page.graphics],
	["BACK",		menu_element_type.page_transfer,	menu_page.main]
);

ds_menu_audio = create_menu_page(
	["MASTER",			menu_element_type.slider,	change_volume, 1, [0,1]],
	["SOUND EFFECTS",	menu_element_type.slider,	change_volume, 1, [0,1]],
	["MUSIC",			menu_element_type.slider,	change_volume, 1, [0,1]],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_graphics = create_menu_page(
	["Bloom Toggle",	menu_element_type.toggle,	change_bloom, global.Bloom_Shader_enabled, ["ON","OFF"]],
	["Bloom intensity",	menu_element_type.slider,	change_bloom_intense, global.Bloom_intensity, [0.0,1.0]],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings]
);

page = 0;
//has to be in same order as page enum
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics];

var i = 0, array_len = array_length(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	++i;
}

inputting = false;