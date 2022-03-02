#region //define Description String Macros

#region //Devices
#macro __FHINPUT_Description_None "Not Set"
#macro __FHINPUT_Description_Keyboard "Keyboard"
#macro __FHINPUT_Description_Mouse "Mouse"
#macro __FHINPUT_Description_XInput_Long "XBOX Gamepad"
#macro __FHINPUT_Description_XInput_Short "XBOX"
#macro __FHINPUT_Description_Unknown_Gamepad_Long "Unknown Gamepad"
#macro __FHINPUT_Description_Disconnected_Gamepad_Long "Disconnected Gamepad"
#macro __FHINPUT_Description_Disconnected_Gamepad_Short "Disconnected"
#macro __FHINPUT_Description_Invalid_Input_Long "Invalid/Non-existent Gamepad Input"
#macro __FHINPUT_Description_Invalid_Input_Short "Invalid Input"
#endregion

#endregion

#region //define keyboard keys
__fhInputDescriptionKeys[255] = 0;
for(var i = 0; i < 256; i++)
{
    __fhInputDescriptionKeys[i] = "Unknown";
}
__fhInputDescriptionKeys[vk_escape] = "Escape";
__fhInputDescriptionKeys[vk_f1] = "F1";
__fhInputDescriptionKeys[vk_f2] = "F2";
__fhInputDescriptionKeys[vk_f3] = "F3";
__fhInputDescriptionKeys[vk_f4] = "F4";
__fhInputDescriptionKeys[vk_f5] = "F5";
__fhInputDescriptionKeys[vk_f6] = "F6";
__fhInputDescriptionKeys[vk_f7] = "F7";
__fhInputDescriptionKeys[vk_f8] = "F8";
__fhInputDescriptionKeys[vk_f9] = "F9";
__fhInputDescriptionKeys[vk_f10] = "F10";
__fhInputDescriptionKeys[vk_f11] = "F11";
__fhInputDescriptionKeys[vk_f12] = "F12";
__fhInputDescriptionKeys[145] = "Scroll Lock";
__fhInputDescriptionKeys[vk_pause] = "Pause";
__fhInputDescriptionKeys[192] = "Tilde(~)";
__fhInputDescriptionKeys[vk_tab] = "Tab";
__fhInputDescriptionKeys[49] = "1";
__fhInputDescriptionKeys[50] = "2";
__fhInputDescriptionKeys[51] = "3";
__fhInputDescriptionKeys[52] = "4";
__fhInputDescriptionKeys[53] = "5";
__fhInputDescriptionKeys[54] = "6";
__fhInputDescriptionKeys[55] = "7";
__fhInputDescriptionKeys[56] = "8";
__fhInputDescriptionKeys[57] = "9";
__fhInputDescriptionKeys[48] = "0";
__fhInputDescriptionKeys[189] = "Dash(-)";
__fhInputDescriptionKeys[187] = "Equals(=)";
__fhInputDescriptionKeys[vk_backspace] = "Backspace";
__fhInputDescriptionKeys[65] = "A";
__fhInputDescriptionKeys[66] = "B";
__fhInputDescriptionKeys[67] = "C";
__fhInputDescriptionKeys[68] = "D";
__fhInputDescriptionKeys[69] = "E";
__fhInputDescriptionKeys[70] = "F";
__fhInputDescriptionKeys[71] = "G";
__fhInputDescriptionKeys[72] = "H";
__fhInputDescriptionKeys[73] = "I";
__fhInputDescriptionKeys[74] = "J";
__fhInputDescriptionKeys[75] = "K";
__fhInputDescriptionKeys[76] = "L";
__fhInputDescriptionKeys[77] = "M";
__fhInputDescriptionKeys[78] = "N";
__fhInputDescriptionKeys[79] = "O";
__fhInputDescriptionKeys[80] = "P";
__fhInputDescriptionKeys[81] = "Q";
__fhInputDescriptionKeys[82] = "R";
__fhInputDescriptionKeys[83] = "S";
__fhInputDescriptionKeys[84] = "T";
__fhInputDescriptionKeys[85] = "U";
__fhInputDescriptionKeys[86] = "V";
__fhInputDescriptionKeys[87] = "W";
__fhInputDescriptionKeys[88] = "X";
__fhInputDescriptionKeys[89] = "Y";
__fhInputDescriptionKeys[90] = "Z";
__fhInputDescriptionKeys[219] = "Left Bracket([)";
__fhInputDescriptionKeys[221] = "Right Bracket(])";
__fhInputDescriptionKeys[220] = "Backslash(\\)";
__fhInputDescriptionKeys[20] = "Caps Lock";
__fhInputDescriptionKeys[186] = "Semi-Colon(;)";
__fhInputDescriptionKeys[222] = "Apostrophe(')";
__fhInputDescriptionKeys[13] = "Enter";
__fhInputDescriptionKeys[160] = "Left Shift";
__fhInputDescriptionKeys[161] = "Right Shift";
__fhInputDescriptionKeys[162] = "Left Control";
__fhInputDescriptionKeys[163] = "Right Control";
__fhInputDescriptionKeys[164] = "Left Alt";
__fhInputDescriptionKeys[165] = "Right Alt";
__fhInputDescriptionKeys[188] = "Comma(,)";
__fhInputDescriptionKeys[190] = "Period(.)";
__fhInputDescriptionKeys[191] = "Slash(/)";
__fhInputDescriptionKeys[vk_space] = "Space Bar";
__fhInputDescriptionKeys[93] = "Apps";
__fhInputDescriptionKeys[vk_insert] = "Insert";
__fhInputDescriptionKeys[vk_home] = "Home";
__fhInputDescriptionKeys[vk_pageup] = "Page Up";
__fhInputDescriptionKeys[vk_delete] = "Delete";
__fhInputDescriptionKeys[vk_end] = "End";
__fhInputDescriptionKeys[vk_pagedown] = "Page Down";
__fhInputDescriptionKeys[144] = "Number Lock";
__fhInputDescriptionKeys[111] = "Numpad Slash(/)";
__fhInputDescriptionKeys[106] = "Numpad Asterisk(*)";
__fhInputDescriptionKeys[109] = "Numpad Dash(-)";
__fhInputDescriptionKeys[vk_numpad0] = "Numpad 0";
__fhInputDescriptionKeys[vk_numpad1] = "Numpad 1";
__fhInputDescriptionKeys[vk_numpad2] = "Numpad 2";
__fhInputDescriptionKeys[vk_numpad3] = "Numpad 3";
__fhInputDescriptionKeys[vk_numpad4] = "Numpad 4";
__fhInputDescriptionKeys[vk_numpad5] = "Numpad 5";
__fhInputDescriptionKeys[vk_numpad6] = "Numpad 6";
__fhInputDescriptionKeys[vk_numpad7] = "Numpad 7";
__fhInputDescriptionKeys[vk_numpad8] = "Numpad 8";
__fhInputDescriptionKeys[vk_numpad9] = "Numpad 9";
__fhInputDescriptionKeys[110] = "Numpad Period(.)";
__fhInputDescriptionKeys[107] = "Numpad Plus(+)";
__fhInputDescriptionKeys[vk_left] = "Left Arrow";
__fhInputDescriptionKeys[vk_right] = "Right Arrow";
__fhInputDescriptionKeys[vk_up] = "Up Arrow";
__fhInputDescriptionKeys[vk_down] = "Down Arrow";
#endregion

#region //define mouse buttons
__fhInputDescriptionMouseButtons[0] = "Left Click";
__fhInputDescriptionMouseButtons[1] = "Right Click";
__fhInputDescriptionMouseButtons[2] = "Middle Click";
__fhInputDescriptionMouseButtons[3] = "Wheel Up";
__fhInputDescriptionMouseButtons[4] = "Wheel Down";
#endregion

#region //define XInput gamepad inputs
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Left_Stick_Right] = "Left Stick Right";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Left_Stick_Left] = "Left Stick Left";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Left_Stick_Up] = "Left Stick Up";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Left_Stick_Down] = "Left Stick Down";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Right_Stick_Right] = "Right Stick Right";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Right_Stick_Left] = "Right Stick Left";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Right_Stick_Up] = "Right Stick Up";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Right_Stick_Down] = "Right Stick Down";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Left_Shoulder_Trigger] = "Left Shoulder Trigger";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Right_Shoulder_Trigger] = "Right Shoulder Trigger";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_DPad_Up] = "DPad Up";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_DPad_Down] = "DPad Down";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_DPad_Left] = "DPad Left";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_DPad_Right] = "DPad Right";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_A] = "A";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_B] = "B";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_X] = "X";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Y] = "Y";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Left_Shoulder_Button] = "Left Shoulder Button";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Right_Shoulder_Button] = "Right Shoulder Button";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Left_Stick_Click] = "Left Stick Click";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Right_Stick_Click] = "Right Stick Click";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Select] = "Select";
__fhInputDescriptionGamePadXInputs[__FHINPUT_XInput_Start] = "Start";
#endregion

#region //define DInput gamepad inputs
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_XPlus] = "X+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_XMinus] = "X-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_YPlus] = "Y+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_YMinus] = "Y-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_ZPlus] = "Z+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_ZMinus] = "Z-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_RPlus] = "R+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_RMinus] = "R-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_UPlus] = "U+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_UMinus] = "U-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_VPlus] = "V+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_VMinus] = "V-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_APlus] = "A+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_AMinus] = "A-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_BPlus] = "B+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_BMinus] = "B-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_CPlus] = "C+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_CMinus] = "C-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_DPlus] = "D+";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_DMinus] = "D-";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button1] = "Button 1";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button2] = "Button 2";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button3] = "Button 3";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button4] = "Button 4";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button5] = "Button 5";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button6] = "Button 6";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button7] = "Button 7";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button8] = "Button 8";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button9] = "Button 9";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button10] = "Button 10";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button11] = "Button 11";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button12] = "Button 12";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button13] = "Button 13";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button14] = "Button 14";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button15] = "Button 15";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button16] = "Button 16";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button17] = "Button 17";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button18] = "Button 18";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button19] = "Button 19";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button20] = "Button 20";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button21] = "Button 21";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button22] = "Button 22";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button23] = "Button 23";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button24] = "Button 24";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button25] = "Button 25";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button26] = "Button 26";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button27] = "Button 27";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button28] = "Button 28";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button29] = "Button 29";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button30] = "Button 30";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button31] = "Button 31";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Button32] = "Button 32";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat1_Up] = "Hat 1 U";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat1_Down] = "Hat 1 D";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat1_Left] = "Hat 1 L";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat1_Right] = "Hat 1 R";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat1_UpRight] = "Hat 1 UR";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat1_DownRight] = "Hat 1 DR";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat1_DownLeft] = "Hat 1 DL";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat1_UpLeft] = "Hat 1 UL";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat2_Up] = "Hat 2 U";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat2_Down] = "Hat 2 D";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat2_Left] = "Hat 2 L";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat2_Right] = "Hat 2 R";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat2_UpRight] = "Hat 2 UR";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat2_DownRight] = "Hat 2 DR";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat2_DownLeft] = "Hat 2 DL";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat2_UpLeft] = "Hat 2 UL";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat3_Up] = "Hat 3 U";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat3_Down] = "Hat 3 D";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat3_Left] = "Hat 3 L";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat3_Right] = "Hat 3 R";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat3_UpRight] = "Hat 3 UR";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat3_DownRight] = "Hat 3 DR";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat3_DownLeft] = "Hat 3 DL";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat3_UpLeft] = "Hat 3 UL";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat4_Up] = "Hat 4 U";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat4_Down] = "Hat 4 D";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat4_Left] = "Hat 4 L";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat4_Right] = "Hat 4 R";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat4_UpRight] = "Hat 4 UR";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat4_DownRight] = "Hat 4 DR";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat4_DownLeft] = "Hat 4 DL";
__fhInputDescriptionGamePadDInputs[__FHINPUT_DInput_Hat4_UpLeft] = "Hat 4 UL";
#endregion

function __fhInputFixAllDescriptions()
{
	for(var i = 0; i < global.__fhInputNumPlayers; i++)
	{
		__fhInputObjController.myPlayers[i].fixDescriptions();
	}
}

#region __fhInputGetLongDescription(deviceType, deviceSpecific, input)
function __fhInputGetLongDescription(deviceType, deviceID, input)
{
	var str = "";
	switch(deviceType)
	{
	    case __FHINPUT_Device_None:
	        str = __FHINPUT_Description_None;
	        break;
	    case __FHINPUT_Device_Keyboard:
	        str = __FHINPUT_Description_Keyboard;
	        str += " ";
	        str += global.__fhInputDescriptionKeys[input];
	        str += " Key";
	        break;
	    case __FHINPUT_Device_Mouse:
	        str = __FHINPUT_Description_Mouse;
	        str += " ";
	        str += global.__fhInputDescriptionMouseButtons[input];
	        break;
	    case __FHINPUT_Device_XInput:
	        str = __FHINPUT_Description_XInput_Long;
	        str += " ";
			if(gamepad_is_connected(deviceID))
			{
				str += string(deviceID + 1);
				str += " ";
		        str += global.__fhInputDescriptionGamePadXInputs[input];
			}
			else
			{
				str += __FHINPUT_Description_Disconnected_Gamepad_Long;
			}
			break;
	    case __FHINPUT_Device_DInput:
			if(gamepad_is_connected(deviceID))
			{
				var guid = gamepad_get_guid(deviceID);
				var vendor = __fhInputGetGamepadVendor(guid);
				var model = __fhInputGetGamepadModel(guid);
				if(vendor == __FHINPUT_Gamepad_Vendor_Unknown)
					str = __FHINPUT_Description_Unknown_Gamepad_Long;
				else
					str = vendor;
		        str += " ";
				str += model;
				str += " ";
				var success = false;
				if(input < __FHINPUT_DInput_Button1)
				{
					if(__fhInputAxisExists(input, deviceID))
						success = true;
				}
				else if(input < __FHINPUT_DInput_Hat1_Up)
				{
					if(__fhInputButtonExists(input, deviceID))
						success = true;
				}
				else
				{
					if(__fhInputPOVExists(input, deviceID))
						success = true;
				}
				if(success)
					str += global.__fhInputDescriptionGamePadDInputs[input];
				else
					str += __FHINPUT_Description_Invalid_Input_Long;
			}
			else
			{
				str = __FHINPUT_Description_Disconnected_Gamepad_Long;
			}
	}
	return str;
}
#endregion

#region __fhInputGetShortDescription(deviceType, deviceID, input)
function __fhInputGetShortDescription(deviceType, deviceID, input)
{
	var str = "";
	switch(deviceType)
	{
	    case __FHINPUT_Device_None:
	        str = __FHINPUT_Description_None;
	        break;
	    case __FHINPUT_Device_Keyboard:
	        str = global.__fhInputDescriptionKeys[input];
	        str += " Key";
	        break;
	    case __FHINPUT_Device_Mouse:
	        str = global.__fhInputDescriptionMouseButtons[input];
	        break;
	    case __FHINPUT_Device_XInput:
	        str = __FHINPUT_Description_XInput_Short;
	        str += " ";
			if(gamepad_is_connected(deviceID))
			{
				str += string(deviceID + 1);
				str += " ";
		        str = global.__fhInputDescriptionGamePadXInputs[input];
			}
			else
			{
				str += __FHINPUT_Description_Disconnected_Gamepad_Short;
			}
			break;
	    case __FHINPUT_Device_DInput:
	        var success = false;
			if(gamepad_is_connected(deviceID))
			{
				if(input < __FHINPUT_DInput_Button1)
				{
					if(__fhInputAxisExists(input, deviceID))
						success = true;
				}
				else if(input < __FHINPUT_DInput_Hat1_Up)
				{
					if(__fhInputButtonExists(input, deviceID))
						success = true;
				}
				else
				{
					if(__fhInputPOVExists(input, deviceID))
						success = true;
				}
				if(success)
					str += global.__fhInputDescriptionGamePadDInputs[input];
				else
					str += __FHINPUT_Description_Invalid_Input_Short;
			}
			else
			{
				str = __FHINPUT_Description_Disconnected_Gamepad_Short;
			}
	}
	return str;
}
#endregion