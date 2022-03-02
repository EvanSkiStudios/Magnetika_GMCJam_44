//Here belong all the functions that directly check specific device inputs

#region //__fhInputCheckKeyboard(keycode)
function __fhInputCheckKeyboard(keycode)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		if(keycode > 255 || keycode < 0)
			__fhInputThrowError("Attempted to check keyboard for invalid keycode.  You may have incorrectly set a manual action mapping.");
	}
	if(os_type == os_windows)
	{
		if(keyboard_check_direct(keycode))
			return 1;
		else
			return 0;
	}
	else
	{
		if(keyboard_check(keycode))
			return 1;
		else
			return 0;
	}
}
#endregion

#region //__fhInputCheckMouse(button)
function __fhInputCheckMouse(button)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		if(button < 0 || button > 4)
			__fhInputThrowError("Attempted to check mouse with invalid button.  You may have incorrectly set a manual action mapping.");
	}
	switch(button)
	{
		case 0:
			if(mouse_check_button(mb_left))
				return 1;
			break;
		case 1:
			if(mouse_check_button(mb_right))
				return 1;
			break;
		case 2:
			if(mouse_check_button(mb_middle))
				return 1;
			break;
		case 3:
			if(mouse_wheel_up())
				return 1;
			break;
		case 4:
			if(mouse_wheel_down())
				return 1;
			break;			
	}
	return 0;
}
#endregion

#region //__fhInputCheckXInput(device, input)
function __fhInputCheckXInput(device, input)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		if(input < 0 || input > 23)
			__fhInputThrowError("Attempted to check XInput for invalid input.  You may have incorrectly set a manual action mapping.");
	}
	var value = 0;
	switch(input)
	{
	    case __FHINPUT_XInput_Left_Stick_Right:
	        value = gamepad_axis_value(device, gp_axislh);
	        if(value < 0)
	            return 0;
	        else
	            return value;
	        break;
	    case __FHINPUT_XInput_Left_Stick_Left:
	        value = gamepad_axis_value(device, gp_axislh);
	        if(value > 0)
	            return 0;
	        else
	            return -1*value;
	        break;
	    case __FHINPUT_XInput_Left_Stick_Up:
	        value = gamepad_axis_value(device, gp_axislv);
	        if(value > 0)
	            return 0;
	        else
	            return -1*value;
	        break;
	    case __FHINPUT_XInput_Left_Stick_Down:
	        value = gamepad_axis_value(device, gp_axislv);
	        if(value < 0)
	            return 0;
	        else
	            return value;
	        break;
	    case __FHINPUT_XInput_Right_Stick_Right:
	        value = gamepad_axis_value(device, gp_axisrh);
	        if(value < 0)
	            return 0;
	        else
	            return value;
	        break;
	    case __FHINPUT_XInput_Right_Stick_Left:
	        value = gamepad_axis_value(device, gp_axisrh);
	        if(value > 0)
	            return 0;
	        else
	            return -1*value;
	        break;
	    case __FHINPUT_XInput_Right_Stick_Up:
	        value = gamepad_axis_value(device, gp_axisrv);
	        if(value > 0)
	            return 0;
	        else
	            return -1*value;
	        break;
	    case __FHINPUT_XInput_Right_Stick_Down:
	        value = gamepad_axis_value(device, gp_axisrv);
	        if(value < 0)
	            return 0;
	        else
	            return value;
	        break;
	    case __FHINPUT_XInput_Left_Shoulder_Trigger:
	        return gamepad_button_value(device, gp_shoulderlb);
	        break;
	    case __FHINPUT_XInput_Right_Shoulder_Trigger:
	        return gamepad_button_value(device, gp_shoulderrb);
	        break;
	    case __FHINPUT_XInput_DPad_Up:
	        if(gamepad_button_check(device, gp_padu))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_DPad_Down:
	        if(gamepad_button_check(device, gp_padd))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_DPad_Left:
	        if(gamepad_button_check(device, gp_padl))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_DPad_Right:
	        if(gamepad_button_check(device, gp_padr))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_A:
	        if(gamepad_button_check(device, gp_face1))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_B:
	        if(gamepad_button_check(device, gp_face2))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_X:
	        if(gamepad_button_check(device, gp_face3))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_Y:
	        if(gamepad_button_check(device, gp_face4))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_Left_Shoulder_Button:
	        if(gamepad_button_check(device, gp_shoulderl))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_Right_Shoulder_Button:
	        if(gamepad_button_check(device, gp_shoulderr))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_Left_Stick_Click:
	        if(gamepad_button_check(device, gp_stickl))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_Right_Stick_Click:
	        if(gamepad_button_check(device, gp_stickr))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_Select:
	        if(gamepad_button_check(device, gp_select))
	            return 1;
	        else
	            return 0;
	        break;
	    case __FHINPUT_XInput_Start:
	        if(gamepad_button_check(device, gp_start))
	            return 1;
	        else
	            return 0;
	        break;
	}
}
#endregion

#region //__fhInputCheckDInput(device, input)
function __fhInputCheckDInput(device, input)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		if(input < 0 || input >= __FHINPUT_DInput_Amount)
			__fhInputThrowError("Attempted to check DInput for invalid input.  You may have incorrectly set a manual action mapping.");
	}
	var value = 0;
	if(input < __FHINPUT_DInput_Button1 || input > __FHINPUT_DInput_Button32)
	{
		switch(input)
		{
		    case __FHINPUT_DInput_XPlus:
		        value = gamepad_axis_value(device, 0);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_XMinus:
		        value = gamepad_axis_value(device, 0);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_YPlus:
		        value = gamepad_axis_value(device, 1);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_YMinus:
		        value = gamepad_axis_value(device, 1);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_ZPlus:
		        value = gamepad_axis_value(device, 2);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_ZMinus:
		        value = gamepad_axis_value(device, 2);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_RPlus:
		        value = gamepad_axis_value(device, 3);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_RMinus:
		        value = gamepad_axis_value(device, 3);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_UPlus:
		        value = gamepad_axis_value(device, 4);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_UMinus:
		        value = gamepad_axis_value(device, 4);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_VPlus:
		        value = gamepad_axis_value(device, 5);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_VMinus:
		        value = gamepad_axis_value(device, 5);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_APlus:
		        value = gamepad_axis_value(device, 6);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_AMinus:
		        var value = gamepad_axis_value(device, 6);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_BPlus:
		        value = gamepad_axis_value(device, 7);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_BMinus:
		        value = gamepad_axis_value(device, 7);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_CPlus:
		        value = gamepad_axis_value(device, 8);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_CMinus:
		        value = gamepad_axis_value(device, 8);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
		    case __FHINPUT_DInput_DPlus:
		        value = gamepad_axis_value(device, 9);
		        if(value < 0)
		            return 0;
		        else
		            return value;
		        break;
		    case __FHINPUT_DInput_DMinus:
		        value = gamepad_axis_value(device, 9);
		        if(value > 0)
		            return 0;
		        else
		            return -1*value;
		        break;
			case __FHINPUT_DInput_Hat1_Up:
				if(gamepad_hat_value(device, 0) == 1)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat1_Down:
				if(gamepad_hat_value(device, 0) == 4)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat1_Left:
				if(gamepad_hat_value(device, 0) == 8)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat1_Right:
				if(gamepad_hat_value(device, 0) == 2)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat1_UpRight:
				if(gamepad_hat_value(device, 0) == 3)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat1_DownRight:
				if(gamepad_hat_value(device, 0) == 6)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat1_DownLeft:
				if(gamepad_hat_value(device, 0) == 12)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat1_UpLeft:
				if(gamepad_hat_value(device, 0) == 9)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat2_Up:
				if(gamepad_hat_value(device, 1) == 1)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat2_Down:
				if(gamepad_hat_value(device, 1) == 4)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat2_Left:
				if(gamepad_hat_value(device, 1) == 8)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat2_Right:
				if(gamepad_hat_value(device, 1) == 2)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat2_UpRight:
				if(gamepad_hat_value(device, 1) == 3)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat2_DownRight:
				if(gamepad_hat_value(device, 1) == 6)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat2_DownLeft:
				if(gamepad_hat_value(device, 1) == 12)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat2_UpLeft:
				if(gamepad_hat_value(device, 1) == 9)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat3_Up:
				if(gamepad_hat_value(device, 2) == 1)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat3_Down:
				if(gamepad_hat_value(device, 2) == 4)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat3_Left:
				if(gamepad_hat_value(device, 2) == 8)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat3_Right:
				if(gamepad_hat_value(device, 2) == 2)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat3_UpRight:
				if(gamepad_hat_value(device, 2) == 3)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat3_DownRight:
				if(gamepad_hat_value(device, 2) == 6)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat3_DownLeft:
				if(gamepad_hat_value(device, 2) == 12)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat3_UpLeft:
				if(gamepad_hat_value(device, 2) == 9)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat4_Up:
				if(gamepad_hat_value(device, 3) == 1)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat4_Down:
				if(gamepad_hat_value(device, 3) == 4)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat4_Left:
				if(gamepad_hat_value(device, 3) == 8)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat4_Right:
				if(gamepad_hat_value(device, 3) == 2)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat4_UpRight:
				if(gamepad_hat_value(device, 3) == 3)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat4_DownRight:
				if(gamepad_hat_value(device, 3) == 6)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat4_DownLeft:
				if(gamepad_hat_value(device, 3) == 12)
					return 1;
				else
					return 0;
				break;
			case __FHINPUT_DInput_Hat4_UpLeft:
				if(gamepad_hat_value(device, 3) == 9)
					return 1;
				else
					return 0;
				break;
		}
	}
	else
	{
		if(gamepad_button_check(device, input - 20))
	        return 1;
	    else
	        return 0;
	}    
}
#endregion