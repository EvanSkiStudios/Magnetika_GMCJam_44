//this gets called when the textbox is out of text

//reset
text_current = 0; //sets current spot in array to start
text_last = 1; //sets the last array spot to 1
char_current = 1; //sets the current letter of the string to the start
text_color = text_color_default; //reset text color
//global.game_convo_number += 1; //increases the conversation number for next array set

//destroy text
text = 0;

//room_restart();
instance_destroy();