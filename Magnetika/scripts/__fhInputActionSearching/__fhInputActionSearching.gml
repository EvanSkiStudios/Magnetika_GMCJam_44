//here belong all search functions, including starting and stopping, and setting the action once one is found

#region //__fhInputStartSearch(playerNum, actionNum, callback)
function __fhInputStartSearch(playerNum, actionNum, callback)
{
	with(__fhInputObjController)
	{
		mySearching = true;
		myTimeLeft = FHINPUT_SETTING_SearchTimeout;
		myDelayTimeLeft = FHINPUT_SETTING_SearchDelay;
		mySearchingPlayer = playerNum;
		mySearchingAction = actionNum;
		myCallback = callback;
		myGPList.setAxes();
	}
}
#endregion

#region //__fhInputSearchKeyboard()
function __fhInputSearchKeyboard()
{
	if(__fhInputCheckKeyboard(vk_lshift) == 1)
	{
		return vk_lshift;
	}
	if(__fhInputCheckKeyboard(vk_rshift) == 1)
	{
		return vk_rshift;
	}
	if(__fhInputCheckKeyboard(vk_lcontrol) == 1)
	{
		return vk_lcontrol;
	}
	if(__fhInputCheckKeyboard(vk_rcontrol) == 1)
	{
		return vk_rcontrol;
	}
	if(__fhInputCheckKeyboard(vk_lalt) == 1)
	{
		return vk_lalt;
	}
	if(__fhInputCheckKeyboard(vk_ralt) == 1)
	{
		return vk_ralt;
	}
	for(var i = 2; i < 256; i++)
	{
		if(__fhInputCheckKeyboard(i) == 1)
		{
			return i;
		}
	}
	return -1;
}
#endregion

#region //__fhInputSearchMouse()
function __fhInputSearchMouse()
{
	for(var i = 0; i < 4; i++)
	{
		if(__fhInputCheckMouse(i) == 1)
		{
			return i;
		}
	}
	return -1;
}
#endregion

#region //__fhInputSearchGamepads()
function __fhInputSearchGamepads()
{
	var input;
	input[0] = -1;
	input[1] = -1;
	var value = 0;
	var compare = 0;
	var xInputList = myGPList.listXInputGPs();
	var dInputList = myGPList.listDInputGPs();
	var gpID;
	for(var i = 0; i < array_length(xInputList); i++)
	{
		gpID = myGPList.gpIDs[xInputList[i]];
		value = gamepad_axis_value(gpID, gp_axislh);
		compare = myGPList.gpAxes[xInputList[i]][__FHINPUT_XInput_Axis_Left_Horizontal];
		if(value > (compare + 0.5))
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Left_Stick_Right;
			return input;
		}
		if(value < (compare - 0.5))
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Left_Stick_Left;
			return input;
		}
		value = gamepad_axis_value(gpID, gp_axislv);
		compare = myGPList.gpAxes[xInputList[i]][__FHINPUT_XInput_Axis_Left_Vertical];
		if(value < (compare - 0.5))
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Left_Stick_Up;
			return input;
		}
		if(value > (compare + 0.5))
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Left_Stick_Down;
			return input;
		}
		value = gamepad_axis_value(gpID, gp_axisrh);
		compare = myGPList.gpAxes[xInputList[i]][__FHINPUT_XInput_Axis_Right_Horizontal];
		if(value > (compare + 0.5))
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Right_Stick_Right;
			return input;
		}
		if(value < (compare - 0.5))
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Right_Stick_Left;
			return input;
		}
		value = gamepad_axis_value(gpID, gp_axisrv);
		compare = myGPList.gpAxes[xInputList[i]][__FHINPUT_XInput_Axis_Right_Vertical];
		if(value < (compare - 0.5))
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Right_Stick_Up;
			return input;
		}
		if(value > (compare + 0.5))
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Right_Stick_Down;
			return input;
		}
		value = gamepad_button_value(gpID, gp_shoulderlb);
		compare = myGPList.gpAxes[xInputList[i]][__FHINPUT_XInput_Axis_Left_Shoulder];
		if(value < compare - 0.5 || value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Left_Shoulder_Trigger;
		}
		value = gamepad_button_value(gpID, gp_shoulderrb);
		compare = myGPList.gpAxes[xInputList[i]][__FHINPUT_XInput_Axis_Right_Shoulder];
		if(value < compare - 0.5 || value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_XInput_Right_Shoulder_Trigger;
		}
		for(var j = __FHINPUT_XInput_DPad_Up; j < __FHINPUT_XInput_Amount; j++)
		{
			if(__fhInputCheckXInput(gpID, j) > 0.5)
			{
				input[0] = gpID;
				input[1] = j;
				return input;
			}
		}
	}
	for(var i = 0; i < array_length(dInputList); i++)
	{
		gpID = myGPList.gpIDs[dInputList[i]];
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_X);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_X];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_XPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_XMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_Y);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_Y];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_YPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_YMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_Z);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_Z];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_ZPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_ZMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_R);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_R];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_RPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_RMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_U);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_U];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_UPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_UMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_V);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_V];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_VPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_VMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_A);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_A];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_APlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_AMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_B);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_B];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_BPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_BMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_C);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_C];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_CPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_CMinus;
			return input;
		}
		value = gamepad_axis_value(gpID, __FHINPUT_DInput_Axis_D);
		compare = myGPList.gpAxes[dInputList[i]][__FHINPUT_DInput_Axis_D];
		if(value > compare + 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_DPlus;
			return input;
		}
		if(value < compare - 0.5)
		{
			input[0] = gpID;
			input[1] = __FHINPUT_DInput_DMinus;
			return input;
		}
		for(var j = __FHINPUT_DInput_Button1; j < __FHINPUT_DInput_Amount; j++)
		{
			if(__fhInputCheckDInput(gpID, j) > 0.5)
			{
				input[0] = gpID;
				input[1] = j;
				return input;
			}
		}
	}
	return input;
}
#endregion

#region //__fhInputSetAction(playerNum, actionNum, deviceType, deviceID, input)
function __fhInputSetAction(playerNum, actionNum, deviceType, deviceID, input)
{
	var isAxis = false;
	var guid = "XInput";
	if(deviceType == __FHINPUT_Device_XInput)
	{
		isAxis = (input <= __FHINPUT_XInput_Right_Shoulder_Trigger);
	}
	if(deviceType == __FHINPUT_Device_DInput)
	{
		isAxis = (input <= __FHINPUT_DInput_DMinus)
		guid = gamepad_get_guid(deviceID);
	}
	var action = new __fhInputActionConfig();
	action.deviceType = deviceType;
	action.deviceID = deviceID;
	action.input = input;
	action.isAxis = isAxis;
	action.guid = guid;
	__fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum] = action;
	__fhInputObjController.myPlayers[playerNum].fixDescriptions();
	__fhInputObjController.myPlayers[playerNum].fixAssignedGamepad();
	__FHINPUT_GPLIST.updateUsedGPs();
}
#endregion