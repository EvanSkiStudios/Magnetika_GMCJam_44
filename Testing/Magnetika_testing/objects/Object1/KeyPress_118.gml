//TEST
global.test_value = 420;
show_message(global.test_value);
save_game();

global.test_value = 99;
show_message(global.test_value);

load_game();
show_message(global.test_value);