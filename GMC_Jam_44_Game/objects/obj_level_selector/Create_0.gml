image_xscale = 2; image_yscale = 2;
x = WINDOW_WIDTH/2; y = (WINDOW_HEIGHT/2) - 50;

//methodz
lvl_select = function(rm_id, img_id=0, title="ERROR!!") constructor{
	_room = rm_id;
	_pic = img_id;
	_name = string(title);
}

//create structs
var i = 0;
lvl_array[i] = new lvl_select(rm_Level1, 1, "Only a Test");
lvl_array[++i] = new lvl_select(rm_test, 0, "A test concluded");

//create global ref
//global.lvl_list_array = lvl_array;

//selector
selected_level = 0;
lvl_select_list_end = (array_length(lvl_array) - 1);


//controll flag
selector_enabled = true;

