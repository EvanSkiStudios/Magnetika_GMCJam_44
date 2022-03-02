//global.text_wrap = 1000;
room_start_did_once = false;

if (room == rm_credits) instance_destroy();


if (room != rm_levelselect){
	pop_lock();
	save_game();
}