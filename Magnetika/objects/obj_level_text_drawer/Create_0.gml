var _array_length = (array_length(global.lvl_list_array));
	
for (var i = 0; i < _array_length; ++i){
	var _array_room = global.lvl_list_array[i]._room;
		
	if (_array_room == room){
		level_title = global.lvl_list_array[i]._name;
		level_number = i;
		break;
	}
}