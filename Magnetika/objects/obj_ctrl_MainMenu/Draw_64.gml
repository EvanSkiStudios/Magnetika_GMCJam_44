draw_set_font(fnt_text);

var gwidth = menu_width, gheight = menu_height;

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);
var y_buffer = 32, x_buffer = 16;
var start_y = (gheight/2) - ((((ds_height) /2) * y_buffer)) + 30;
var start_x = (gwidth/2);


//Draw menu Pause BACK
/*
var c = c_black;
draw_set_alpha(0.85);
draw_rectangle_color(0,0,gwidth,gheight, c,c,c,c, false);
draw_set_alpha(1);
*/

//Draw elements on left side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty, xo;

var yy = 0; repeat(ds_height){
	lty = start_y + (yy*y_buffer);
	var c = color_ltpurple;
	xo = 0;
	
	if (yy == menu_option[page]){
		c = color_purple;
		xo = -(x_buffer/2);
	}
	//background
	draw_text_color(ltx+xo+2, lty+2, ds_grid[# 0, yy], c_black,c_black,c_black,c_black, 1);
	
	draw_text_color(ltx+xo, lty, ds_grid[# 0, yy], c,c,c,c, 1);
	++yy;
}

//draw dividing line
//background
draw_set_color(c_black);
draw_line(start_x+2, start_y-y_buffer+2, start_x+2, lty+y_buffer+2);
draw_set_color(c_white);

draw_line(start_x, start_y-y_buffer, start_x, lty+y_buffer);

//draw_elements on right side
draw_set_halign(fa_left);

var rtx = start_x + x_buffer, rty;

yy= 0; repeat(ds_height){
	rty = start_y + (yy*y_buffer);
	
	
	switch(ds_grid[# 1, yy]){
		case menu_element_type.shift:{
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<<";
			var right_shift = ">>";
			
			if (current_val == 0) left_shift = "";
			if (current_val == array_length(ds_grid[# 4, yy])-1) right_shift = "";
			
			c = color_ltpurple;
			
			if (inputting && yy == menu_option[page]){ c = c_yellow;}
			//background
			draw_text_color(rtx+2,rty+2, left_shift+current_array[current_val]+right_shift, c_black,c_black,c_black,c_black, 1);
			
			draw_text_color(rtx,rty, left_shift+current_array[current_val]+right_shift, c,c,c,c, 1);
		}break;	
		
		case menu_element_type.slider:{
			
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			c = color_ltpurple;
			
			//background
			draw_set_color(c_black);
			draw_line_width(rtx+2, rty+2, rtx + len+2, rty+2, 2);
			draw_set_color(c_white);
			
			draw_line_width(rtx, rty, rtx + len, rty, 2);
			
			if (inputting && yy == menu_option[page]){ c = color_purple;}
			//bakcground
			draw_circle_color(rtx + (circle_pos*len)+2, rty+2, 4, c_black,c_black, false);
			draw_text_color(rtx + (len * 1.2)+2, rty+2, string(floor(circle_pos * 100))+"%", c_black,c_black,c_black,c_black, 1);
			
			draw_circle_color(rtx + (circle_pos*len), rty, 4, c,c, false);
			draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos * 100))+"%", c,c,c,c, 1);
		}break;
		
		case menu_element_type.toggle:{
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			c = color_ltpurple;
			
			if (inputting && yy == menu_option[page]){ c = color_purple;}
			
			if (current_val == 0) { 
				c1 = c; c2 = c_dkgray;
			}else{	
				c1 = c_dkgray; c2 = c;
			}
			
			//background
			draw_text_color(rtx+2, rty+2, "OFF", c_black,c_black,c_black,c_black, 1);
			draw_text_color(rtx + 96+2, rty+2, "ON", c_black,c_black,c_black,c_black, 1);
			
			draw_text_color(rtx, rty, "OFF", c1,c1,c1,c1, 1);
			draw_text_color(rtx + 96, rty, "ON", c2,c2,c2,c2, 1);
			
			
		}break;
	}
	++yy;
}

//reset
draw_set_halign(fa_top);