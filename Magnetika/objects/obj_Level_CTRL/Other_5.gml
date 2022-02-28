/*
global.Level_current += 1;
if !(global.Level_current > array_length(global.lvl_list_array)){
	global.lvl_list_array[global.Level_current]._lock = false;
}
//show_message(global.lvl_list_array[1]._lock);
*/

if audio_is_playing(snd_laser_begin) audio_stop_sound(snd_laser_begin);
if audio_is_playing(snd_laser_loop) audio_stop_sound(snd_laser_loop);
if audio_is_playing(snd_laser_off) audio_stop_sound(snd_laser_off);


room_end_did_once = false;
do_fade = false;

GAME_RESET();