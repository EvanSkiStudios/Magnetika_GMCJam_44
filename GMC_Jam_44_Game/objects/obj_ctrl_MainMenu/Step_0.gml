

input_up_p = fhInputActionCheckPressed(FHINPUTACTION_Up);
input_down_p = fhInputActionCheckPressed(FHINPUTACTION_Down);
input_enter_p = fhInputActionCheckPressed(FHINPUTACTION_Activate) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAlt) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAltLH) || fhInputActionCheckPressed(FHINPUTACTION_ActivateMenuAlt);

var ds_grid = menu_pages[page]; 
var ds_height = ds_grid_height(ds_grid);

if (inputting){
	switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.shift:{
			var hinput = fhInputActionCheckPressed(FHINPUTACTION_Right) - fhInputActionCheckPressed(FHINPUTACTION_Left);
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
				case 1: /*if(!audio_is_playing(snd_sfx_switch)) audio_play_sound(snd_sfx_switch,1,false);*/ break;
				case 2: break;
			}
			
			
			var hinput = fhInputActionCheckDown(FHINPUTACTION_Right) - fhInputActionCheckDown(FHINPUTACTION_Left);
			
			if (hinput != 0){
				ds_grid[# 3, menu_option[page]] += hinput*0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]] );
			}
		}break;
		
		case menu_element_type.toggle:{
			var hinput = fhInputActionCheckPressed(FHINPUTACTION_Right) - fhInputActionCheckPressed(FHINPUTACTION_Left);
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