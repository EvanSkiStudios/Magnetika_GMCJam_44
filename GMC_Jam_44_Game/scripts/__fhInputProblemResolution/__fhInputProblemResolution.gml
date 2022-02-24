//Here belongs all the code relating to issues, conflicts, disconnects, etc...

#region XInput to DInput conversion array
__fhInputXToDValues[__FHINPUT_XInput_Left_Stick_Right] = __FHINPUT_DInput_XPlus;
__fhInputXToDValues[__FHINPUT_XInput_Left_Stick_Left] = __FHINPUT_DInput_XMinus;
__fhInputXToDValues[__FHINPUT_XInput_Left_Stick_Up] = __FHINPUT_DInput_YPlus;
__fhInputXToDValues[__FHINPUT_XInput_Left_Stick_Down] = __FHINPUT_DInput_YMinus;
__fhInputXToDValues[__FHINPUT_XInput_Right_Stick_Right] = __FHINPUT_DInput_ZPlus;
__fhInputXToDValues[__FHINPUT_XInput_Right_Stick_Left] = __FHINPUT_DInput_ZMinus;
__fhInputXToDValues[__FHINPUT_XInput_Right_Stick_Up] = __FHINPUT_DInput_RPlus;
__fhInputXToDValues[__FHINPUT_XInput_Right_Stick_Down] = __FHINPUT_DInput_RMinus;
__fhInputXToDValues[__FHINPUT_XInput_Left_Shoulder_Trigger] = __FHINPUT_DInput_UPlus;
__fhInputXToDValues[__FHINPUT_XInput_Right_Shoulder_Trigger] = __FHINPUT_DInput_UMinus;
__fhInputXToDValues[__FHINPUT_XInput_DPad_Up] = __FHINPUT_DInput_Hat1_Up;
__fhInputXToDValues[__FHINPUT_XInput_DPad_Down] = __FHINPUT_DInput_Hat1_Down;
__fhInputXToDValues[__FHINPUT_XInput_DPad_Left] = __FHINPUT_DInput_Hat1_Left;
__fhInputXToDValues[__FHINPUT_XInput_DPad_Right] = __FHINPUT_DInput_Hat1_Right;
__fhInputXToDValues[__FHINPUT_XInput_A] = __FHINPUT_DInput_Button1;
__fhInputXToDValues[__FHINPUT_XInput_B] = __FHINPUT_DInput_Button2;
__fhInputXToDValues[__FHINPUT_XInput_X] = __FHINPUT_DInput_Button3;
__fhInputXToDValues[__FHINPUT_XInput_Y] = __FHINPUT_DInput_Button4;
__fhInputXToDValues[__FHINPUT_XInput_Left_Shoulder_Button] = __FHINPUT_DInput_Button5;
__fhInputXToDValues[__FHINPUT_XInput_Right_Shoulder_Button] = __FHINPUT_DInput_Button6;
__fhInputXToDValues[__FHINPUT_XInput_Left_Stick_Click] = __FHINPUT_DInput_Button7;
__fhInputXToDValues[__FHINPUT_XInput_Right_Stick_Click] = __FHINPUT_DInput_Button8;
__fhInputXToDValues[__FHINPUT_XInput_Select] = __FHINPUT_DInput_Button9;
__fhInputXToDValues[__FHINPUT_XInput_Start] = __FHINPUT_DInput_Button10;
#endregion

#region DInput to XInput conversion array
__fhInputDToXValues[__FHINPUT_DInput_XPlus] = __FHINPUT_XInput_Left_Stick_Right;
__fhInputDToXValues[__FHINPUT_DInput_XMinus] = __FHINPUT_XInput_Left_Stick_Left;
__fhInputDToXValues[__FHINPUT_DInput_YPlus] = __FHINPUT_XInput_Left_Stick_Up;
__fhInputDToXValues[__FHINPUT_DInput_YMinus] = __FHINPUT_XInput_Left_Stick_Down;
__fhInputDToXValues[__FHINPUT_DInput_ZPlus] = __FHINPUT_XInput_Right_Stick_Right;
__fhInputDToXValues[__FHINPUT_DInput_ZMinus] = __FHINPUT_XInput_Right_Stick_Left;
__fhInputDToXValues[__FHINPUT_DInput_RPlus] = __FHINPUT_XInput_Right_Stick_Up;
__fhInputDToXValues[__FHINPUT_DInput_RMinus] = __FHINPUT_XInput_Right_Stick_Down;
__fhInputDToXValues[__FHINPUT_DInput_UPlus] = __FHINPUT_XInput_Left_Shoulder_Trigger;
__fhInputDToXValues[__FHINPUT_DInput_UMinus] = __FHINPUT_XInput_Right_Shoulder_Trigger;
__fhInputDToXValues[__FHINPUT_DInput_VPlus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_VMinus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_APlus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_AMinus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_BPlus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_BMinus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_CPlus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_CMinus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_DPlus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_DMinus] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button1] = __FHINPUT_XInput_A;
__fhInputDToXValues[__FHINPUT_DInput_Button2] = __FHINPUT_XInput_B;
__fhInputDToXValues[__FHINPUT_DInput_Button3] = __FHINPUT_XInput_X;
__fhInputDToXValues[__FHINPUT_DInput_Button4] = __FHINPUT_XInput_Y;
__fhInputDToXValues[__FHINPUT_DInput_Button5] = __FHINPUT_XInput_Left_Shoulder_Button;
__fhInputDToXValues[__FHINPUT_DInput_Button6] = __FHINPUT_XInput_Right_Shoulder_Button;
__fhInputDToXValues[__FHINPUT_DInput_Button7] = __FHINPUT_XInput_Left_Stick_Click;
__fhInputDToXValues[__FHINPUT_DInput_Button8] = __FHINPUT_XInput_Right_Stick_Click;
__fhInputDToXValues[__FHINPUT_DInput_Button9] = __FHINPUT_XInput_Select;
__fhInputDToXValues[__FHINPUT_DInput_Button10] = __FHINPUT_XInput_Start;
__fhInputDToXValues[__FHINPUT_DInput_Button11] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button12] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button13] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button14] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button15] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button16] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button17] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button18] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button19] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button20] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button21] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button22] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button23] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button24] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button25] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button26] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button27] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button28] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button29] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button30] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button31] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Button32] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat1_Up] = __FHINPUT_XInput_DPad_Up;
__fhInputDToXValues[__FHINPUT_DInput_Hat1_Down] = __FHINPUT_XInput_DPad_Down;
__fhInputDToXValues[__FHINPUT_DInput_Hat1_Left] = __FHINPUT_XInput_DPad_Left;
__fhInputDToXValues[__FHINPUT_DInput_Hat1_Right] = __FHINPUT_XInput_DPad_Right;
__fhInputDToXValues[__FHINPUT_DInput_Hat1_UpRight] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat1_DownRight] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat1_DownLeft] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat1_UpLeft] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat2_Up] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat2_Down] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat2_Left] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat2_Right] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat2_UpRight] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat2_DownRight] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat2_DownLeft] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat2_UpLeft] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat3_Up] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat3_Down] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat3_Left] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat3_Right] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat3_UpRight] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat3_DownRight] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat3_DownLeft] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat3_UpLeft] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat4_Up] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat4_Down] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat4_Left] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat4_Right] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat4_UpRight] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat4_DownRight] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat4_DownLeft] = -1;
__fhInputDToXValues[__FHINPUT_DInput_Hat4_UpLeft] = -1;
#endregion

#region //__fhInputSetConflicts()
function __fhInputSetConflicts()
{
	var numPlayers = global.__fhInputNumPlayers;
	var numActions = global.__fhInputNumActions;
	
	for(var currPlayer = 0; currPlayer < numPlayers; currPlayer++)//for each player
	{
		for(var currAction = 0; currAction < numActions; currAction++)//for each action
		{
			__fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].numConflicts = 0;//assume there is no conflict
			for(var checkPlayer = 0; checkPlayer < numPlayers; checkPlayer++)//for each player
			{
				for(var checkAction = 0; checkAction < numActions; checkAction++)//for each action
				{
					var samePlayer = currPlayer==checkPlayer;//are we checking the same player
					var sameAction = currAction==checkAction;//are we checking the same action
					if(!samePlayer || !sameAction)//if not checking the same player and action(checking against itself basically)
					{
						if(__fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].deviceType ==
							__fhInputObjController.myPlayers[checkPlayer].myActionMaps[checkAction].deviceType)//if the device is the same
						{
							if(__fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].deviceID ==
								__fhInputObjController.myPlayers[checkPlayer].myActionMaps[checkAction].deviceID)//if the deviceID is the same as well
							{
								if(__fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].input ==
									__fhInputObjController.myPlayers[checkPlayer].myActionMaps[checkAction].input)//if the input is the same as well
								{
									var ind = __fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].numConflicts;
									__fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].conflicts[ind] = new __fhInputPlayerAction(checkPlayer, checkAction);
									__fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].numConflicts++;
								}
							}
						}		
					}
				}
			}
			if(__fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].deviceType == 0)//if an action is not set
			{
				__fhInputObjController.myPlayers[currPlayer].myActionMaps[currAction].numConflicts = 0;//set conflict flag to false
			}
		}
	}
}
#endregion

#region //__fhInputSearchForConflict(device, input)
function __fhInputSearchForConflict(deviceType, deviceID, input)
{
	var numPlayers = global.__fhInputNumPlayers;
	var numActions = global.__fhInputNumActions;
	for(var i = 0; i < numPlayers; i++)
	{
		for(var j = 0; j < numActions; j++)
		{
			if(__fhInputObjController.myPlayers[i].myActionMaps[j].deviceType == deviceType)
			{
				if(__fhInputObjController.myPlayers[i].myActionMaps[j].input == input)
				{
					if(__fhInputObjController.myPlayers[i].myActionMaps[j].input == input)
					{
						return true
					}
				}
			}
		}
	}
	return false;
}
#endregion

#region gamepad remapping

function __fhInputRemapGamepad(playerNum, oldID, newID)
{
	
	var newDeviceType = __FHINPUT_Device_DInput;
	if(os_type == os_windows && newID < 4)
		newDeviceType = __FHINPUT_Device_XInput;
	var success;
	for(var i = 0; i < global.__fhInputNumActions; i++)
	{
		var oldDeviceType = __fhInputObjController.myPlayers[playerNum].myActionMaps[i].deviceType;
		var oldActionID = __fhInputObjController.myPlayers[playerNum].myActionMaps[i].deviceID;
		success = false;
		if(oldActionID == oldID)//this action has the old gamepad indicated for remapping(needed since I don't enforce all actions to be on a specific gamepad)
		{
			if(oldDeviceType == __FHINPUT_Device_DInput)
			{
				if(newDeviceType == __FHINPUT_Device_DInput)
					success = __fhInputRemapActionDToD(playerNum, i, newID);
				else
					success = __fhInputRemapActionDToX(playerNum, i, newID);
			}
			else
			{
				if(newDeviceType == __FHINPUT_Device_DInput)
					success = __fhInputRemapActionXToD(playerNum, i, newID);
				else
				{
					__fhInputRemapActionXToX(playerNum, i, newID);
					success = true;
				}
			}
		}
		if(!success)
		{
			__fhInputSetAction(playerNum, i, 0, 0, 0);
		}
	}
	__fhInputSetConflicts();
}

function __fhInputRemapActionDToD(playerNum, actionNum, newID)
{
	var action = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum];
	var input = action.input;
	var success = false;
	if(action.deviceType != __FHINPUT_Device_DInput)
		return success;
	if(action.isAxis)
	{
		if(__fhInputAxisExists(input, newID))
			success = true;
	}
	else if(input < __FHINPUT_DInput_Hat1_Up)
	{
		if(__fhInputButtonExists(input, newID))
			success = true;
	}
	else
	{
		if(__fhInputPOVExists(input, newID))
			success = true;
	}
	if(success)
		__fhInputSetAction(playerNum, actionNum, __FHINPUT_Device_DInput, newID, input);
	else
		__fhInputSetAction(playerNum, actionNum, 0, 0, 0);
	return success;
}

function __fhInputRemapActionXToD(playerNum, actionNum, newID)
{
	var action = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum];
	var newInput = global.__fhInputXToDValues[action.input];
	var success = false;
	if(action.deviceType != __FHINPUT_Device_XInput)
		return success;
	if(action.isAxis)
	{
		if(__fhInputAxisExists(newInput, newID))
			success = true;
	}
	else if(newInput < __FHINPUT_DInput_Hat1_Up)
	{
		if(__fhInputButtonExists(newInput, newID))
			success = true;
	}
	else
	{
		if(__fhInputPOVExists(newInput, newID))
			success = true;
	}
	if(success)
		__fhInputSetAction(playerNum, actionNum, __FHINPUT_Device_DInput, newID, newInput);
	else
		__fhInputSetAction(playerNum, actionNum, 0, 0, 0);
	return success;
}

function __fhInputRemapActionDToX(playerNum, actionNum, newID)
{
	var action = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum];
	var newInput = global.__fhInputDToXValues[action.input];
	if(action.deviceType != __FHINPUT_Device_DInput)
		return false;
	if(newInput == -1)
		return false;
	__fhInputSetAction(playerNum, actionNum, __FHINPUT_Device_XInput, newID, newInput);
	return true;
}

function __fhInputRemapActionXToX(playerNum, actionNum, newID)
{
	var action = __fhInputObjController.myPlayers[playerNum].myActionMaps[actionNum];
	var input = action.input;
	if(action.deviceType != __FHINPUT_Device_XInput)
		return false;
	__fhInputSetAction(playerNum, actionNum, __FHINPUT_Device_XInput, newID, input);
}

#region functions for checking if axes/buttons/POV hats exist

function __fhInputAxisExists(input, gpID)
{
	var numAxes = gamepad_axis_count(gpID);
	if(input < 2 && numAxes > 0)//x axis
		return true;
	if(input < 4  && numAxes > 1)//y axis
		return true;
	if(input < 6 && numAxes > 2)//z axis
		return true;
	if(input < 8 && numAxes > 3)//r axis
		return true;
	if(input < 10 && numAxes > 4)//u axis
		return true;
	if(input < 12 && numAxes > 5)//v axis
		return true;
	if(input < 14 && numAxes > 6)//a axis
		return true;
	if(input < 16 && numAxes > 7)//b axis
		return true;
	if(input < 18 && numAxes > 8)//c axis
		return true;
	if(input < 20 && numAxes > 9)//d axis
		return true;
	return false;
}

function __fhInputButtonExists(input, gpID)
{
	var numButtons = gamepad_button_count(gpID);
	if(input-19 > numButtons)
		return false;
	return true;
}

function __fhInputPOVExists(input, gpID)
{
	var numPOVs = gamepad_hat_count(gpID);
	if(numPOVs == 0)
		return false;
	if(input > 75 && numPOVs < 4)
		return false;
	if(input > 67 && numPOVs < 3)
		return false;
	if(input > 59 && numPOVs < 2)
		return false;
	return true;
}

#endregion

#endregion