/* If the current line hasn't finished being drawn, 
then pressing skip will draw the whole line rightto the end instantly
If the current line has finished being drawn, then pressing skip will go to the next line and
start drawing that */

if mouse_check_button_pressed(mb_left){
	next_line = true;
}

var _len = string_length(text[text_current][TContent]);

if (next_line)
{
	
	/* All this does is set the currently last character being drawn to the last character in the whole string, 
	so the whole string will instantly be displayed. If the whole string is already being displayed, 
	then we need to use an else and add into that the following: */
	
	if (char_current < _len)
	{
	    char_current = _len;
	}
	else
    {
	    text_current += 1;
	    if (text_current > text_last)
	    {
			//textbox is out of text what now?
			event_user(0);
	    }
	    else
	    {
		    text[text_current][TContent] = string_wrap(text[text_current][TContent], text_width);
		    char_current = 0;
	    }
    }
	
	/* Here we advance the variable that tells GameMaker which array position to get the text from, 
	and then we check to see if we've advanced outside of the size of the array. 
	Normally you'd then destroy the dialog object or have your game perform some action here. 
	If there is still more text in the array, then we call our string_wrapfunction to add line
	breaks to the next line to be displayed and reset the currently last character to the start 
	of the string ready to display it letter-by-letter again.*/
	next_line = 0;
}