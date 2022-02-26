input_up_p = fhInputActionCheckReleased(FHINPUTACTION_Up) || keyboard_check_released(vk_up);
input_down_p = fhInputActionCheckReleased(FHINPUTACTION_Down) || keyboard_check_released(vk_down);
input_enter_p =(
	fhInputActionCheckReleased(FHINPUTACTION_Activate) || 
	fhInputActionCheckReleased(FHINPUTACTION_ActivateAlt) || 
	fhInputActionCheckReleased(FHINPUTACTION_ActivateAltLH) || 
	fhInputActionCheckReleased(FHINPUTACTION_ActivateMenuAlt) ||
	keyboard_check_released(vk_enter)
);

input_left = fhInputActionCheckReleased(FHINPUTACTION_Left) || keyboard_check_released(vk_left);
input_right = fhInputActionCheckReleased(FHINPUTACTION_Right) || keyboard_check_released(vk_right);

input_left_down = fhInputActionCheckDown(FHINPUTACTION_Left) || keyboard_check(vk_left);
input_right_down = fhInputActionCheckDown(FHINPUTACTION_Right) || keyboard_check(vk_right);

var ds_grid = menu_pages[page]; 
var ds_height = ds_grid_height(ds_grid);

if (room != rm_mainmenu){
	if keyboard_check_pressed(vk_escape) instance_destroy();
}

if (inputting){
	switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.shift:{
			var hinput = input_right - input_left;
			if (hinput != 0){
				//audio
				//audio_play_sound(snd_sfx_wep_cast_fire,1,false);
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length(ds_grid[# 4, menu_option[page]])-1);
			}
		}break;
		
		case menu_element_type.slider:{
			switch(menu_option[page]){
				case 0: /*if(!audio_is_playing(snd_sfx_wep_punch)) audio_play_sound(snd_sfx_wep_punch,1,false);*/  break;
				case 1: if(!audio_is_playing(snd_marte_const_01)) audio_play_sound(snd_marte_const_01,1,false); break;
				case 2: break;
			}
			
			
			var hinput = input_right_down - input_left_down;
			
			if (hinput != 0){
				ds_grid[# 3, menu_option[page]] += hinput*0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]] );
			}
		}break;
		
		case menu_element_type.toggle:{
			var hinput = input_right - input_left;
			if (hinput != 0){
				//audio
				//audio_play_sound(snd_sfx_wep_cast_fire,1,false);
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
		}break;
		
		
		case menu_element_type.input:{
			var kk = keyboard_lastkey;
			if (kk != vk_enter){
				
				if (kk != ds_grid[# 3, menu_option[page]]){
					//audio
					//audio_play_sound(snd_sfx_wep_cast_fire,1,false);	
				}
				
				ds_grid[# 3, menu_option[page]] = kk;
				variable_global_set(ds_grid[# 2, menu_option[page]], kk);
			}
			
		}break;
		
	}
}else{
	var ochange = input_down_p - input_up_p;
	if (ochange != 0){
		menu_option[page] += ochange;
		if (menu_option[page] > (ds_height - 1)){
			menu_option[page] = 0;
		}
		if (menu_option[page] < 0) {
			menu_option[page] = (ds_height - 1);
		}
	}
}

if (input_enter_p){
	switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]) break;
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;
		
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: if (inputting){ script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]] );}
		case menu_element_type.input:
			inputting = !inputting;
		break;
		
	}
	
	//audio
	//audio_play_sound(snd_sfx_wep_cast_fire,1,false);
}