//Various system defines and macros

//search callback return values
#macro FHINPUT_RESULT_SUCCESS 0
#macro FHINPUT_RESULT_TIMEOUT 1
#macro FHINPUT_RESULT_CONFLICT 2

//Gamepad event callback return values
#macro FHINPUT_GPEVENT_CONNECT 0
#macro FHINPUT_GPEVENT_DISCONNECT 1

#region global variables
__fhInputNumPlayers = FHINPUT_SETTING_NumPlayers;
__fhInputNumActions = FHINPUT_SETTING_NumActions;
__fhInputAllowConflicts = FHINPUT_SETTING_AllowConflicts;
#endregion

#region internal macros
#region general
#macro __FHINPUTFileExclusions working_directory+"FHInput/fhInputExclusions.fhi"
#macro __FHINPUTFileActionMaps working_directory+"FHInput/fhInputActionMaps.fhi"
#endregion

#region devices
#macro __FHINPUT_Device_None 0
#macro __FHINPUT_Device_Keyboard 1
#macro __FHINPUT_Device_Mouse 2
#macro __FHINPUT_Device_XInput 3
#macro __FHINPUT_Device_DInput 4
#endregion

#region XInput inputs
#macro __FHINPUT_XInput_Left_Stick_Right 0
#macro __FHINPUT_XInput_Left_Stick_Left 1
#macro __FHINPUT_XInput_Left_Stick_Up 2
#macro __FHINPUT_XInput_Left_Stick_Down 3
#macro __FHINPUT_XInput_Right_Stick_Right 4
#macro __FHINPUT_XInput_Right_Stick_Left 5
#macro __FHINPUT_XInput_Right_Stick_Up 6
#macro __FHINPUT_XInput_Right_Stick_Down 7
#macro __FHINPUT_XInput_Left_Shoulder_Trigger 8
#macro __FHINPUT_XInput_Right_Shoulder_Trigger 9
#macro __FHINPUT_XInput_DPad_Up 10
#macro __FHINPUT_XInput_DPad_Down 11
#macro __FHINPUT_XInput_DPad_Left 12
#macro __FHINPUT_XInput_DPad_Right 13
#macro __FHINPUT_XInput_A 14
#macro __FHINPUT_XInput_B 15
#macro __FHINPUT_XInput_X 16
#macro __FHINPUT_XInput_Y 17
#macro __FHINPUT_XInput_Left_Shoulder_Button 18
#macro __FHINPUT_XInput_Right_Shoulder_Button 19
#macro __FHINPUT_XInput_Left_Stick_Click 20
#macro __FHINPUT_XInput_Right_Stick_Click 21
#macro __FHINPUT_XInput_Select 22
#macro __FHINPUT_XInput_Start 23

#macro __FHINPUT_XInput_Amount 24
#endregion

#region DInput inputs
#macro __FHINPUT_DInput_XPlus 0
#macro __FHINPUT_DInput_XMinus 1
#macro __FHINPUT_DInput_YPlus 2
#macro __FHINPUT_DInput_YMinus 3
#macro __FHINPUT_DInput_ZPlus 4
#macro __FHINPUT_DInput_ZMinus 5
#macro __FHINPUT_DInput_RPlus 6
#macro __FHINPUT_DInput_RMinus 7
#macro __FHINPUT_DInput_UPlus 8
#macro __FHINPUT_DInput_UMinus 9
#macro __FHINPUT_DInput_VPlus 10
#macro __FHINPUT_DInput_VMinus 11
#macro __FHINPUT_DInput_APlus 12
#macro __FHINPUT_DInput_AMinus 13
#macro __FHINPUT_DInput_BPlus 14
#macro __FHINPUT_DInput_BMinus 15
#macro __FHINPUT_DInput_CPlus 16
#macro __FHINPUT_DInput_CMinus 17
#macro __FHINPUT_DInput_DPlus 18
#macro __FHINPUT_DInput_DMinus 19
#macro __FHINPUT_DInput_Button1 20
#macro __FHINPUT_DInput_Button2 21
#macro __FHINPUT_DInput_Button3 22
#macro __FHINPUT_DInput_Button4 23
#macro __FHINPUT_DInput_Button5 24
#macro __FHINPUT_DInput_Button6 25
#macro __FHINPUT_DInput_Button7 26
#macro __FHINPUT_DInput_Button8 27
#macro __FHINPUT_DInput_Button9 28
#macro __FHINPUT_DInput_Button10 29
#macro __FHINPUT_DInput_Button11 30
#macro __FHINPUT_DInput_Button12 31
#macro __FHINPUT_DInput_Button13 32
#macro __FHINPUT_DInput_Button14 33
#macro __FHINPUT_DInput_Button15 34
#macro __FHINPUT_DInput_Button16 35
#macro __FHINPUT_DInput_Button17 36
#macro __FHINPUT_DInput_Button18 37
#macro __FHINPUT_DInput_Button19 38
#macro __FHINPUT_DInput_Button20 39
#macro __FHINPUT_DInput_Button21 40
#macro __FHINPUT_DInput_Button22 41
#macro __FHINPUT_DInput_Button23 42
#macro __FHINPUT_DInput_Button24 43
#macro __FHINPUT_DInput_Button25 44
#macro __FHINPUT_DInput_Button26 45
#macro __FHINPUT_DInput_Button27 46
#macro __FHINPUT_DInput_Button28 47
#macro __FHINPUT_DInput_Button29 48
#macro __FHINPUT_DInput_Button30 49
#macro __FHINPUT_DInput_Button31 50
#macro __FHINPUT_DInput_Button32 51
#macro __FHINPUT_DInput_Hat1_Up 52
#macro __FHINPUT_DInput_Hat1_Down 53
#macro __FHINPUT_DInput_Hat1_Left 54
#macro __FHINPUT_DInput_Hat1_Right 55
#macro __FHINPUT_DInput_Hat1_UpRight 56
#macro __FHINPUT_DInput_Hat1_DownRight 57
#macro __FHINPUT_DInput_Hat1_DownLeft 58
#macro __FHINPUT_DInput_Hat1_UpLeft 59
#macro __FHINPUT_DInput_Hat2_Up 60
#macro __FHINPUT_DInput_Hat2_Down 61
#macro __FHINPUT_DInput_Hat2_Left 62
#macro __FHINPUT_DInput_Hat2_Right 63
#macro __FHINPUT_DInput_Hat2_UpRight 64
#macro __FHINPUT_DInput_Hat2_DownRight 65
#macro __FHINPUT_DInput_Hat2_DownLeft 66
#macro __FHINPUT_DInput_Hat2_UpLeft 67
#macro __FHINPUT_DInput_Hat3_Up 68
#macro __FHINPUT_DInput_Hat3_Down 69
#macro __FHINPUT_DInput_Hat3_Left 70
#macro __FHINPUT_DInput_Hat3_Right 71
#macro __FHINPUT_DInput_Hat3_UpRight 72
#macro __FHINPUT_DInput_Hat3_DownRight 73
#macro __FHINPUT_DInput_Hat3_DownLeft 74
#macro __FHINPUT_DInput_Hat3_UpLeft 75
#macro __FHINPUT_DInput_Hat4_Up 76
#macro __FHINPUT_DInput_Hat4_Down 77
#macro __FHINPUT_DInput_Hat4_Left 78
#macro __FHINPUT_DInput_Hat4_Right 79
#macro __FHINPUT_DInput_Hat4_UpRight 80
#macro __FHINPUT_DInput_Hat4_DownRight 81
#macro __FHINPUT_DInput_Hat4_DownLeft 82
#macro __FHINPUT_DInput_Hat4_UpLeft 83
#macro __FHINPUT_DInput_Amount 84
#endregion

#region XInputAxes
#macro __FHINPUT_XInput_Axis_Left_Horizontal 0
#macro __FHINPUT_XInput_Axis_Left_Vertical 1
#macro __FHINPUT_XInput_Axis_Right_Horizontal 2
#macro __FHINPUT_XInput_Axis_Right_Vertical 3
#macro __FHINPUT_XInput_Axis_Left_Shoulder 4
#macro __FHINPUT_XInput_Axis_Right_Shoulder 5
#endregion

#region DInputAxes
#macro __FHINPUT_DInput_Axis_X 0
#macro __FHINPUT_DInput_Axis_Y 1
#macro __FHINPUT_DInput_Axis_Z 2
#macro __FHINPUT_DInput_Axis_R 3
#macro __FHINPUT_DInput_Axis_U 4
#macro __FHINPUT_DInput_Axis_V 5
#macro __FHINPUT_DInput_Axis_A 6
#macro __FHINPUT_DInput_Axis_B 7
#macro __FHINPUT_DInput_Axis_C 8
#macro __FHINPUT_DInput_Axis_D 9
#macro __FHINPUT_DInput_Axis_Count 10

#endregion

#region Convenience Macros

#macro __FHINPUT_GPLIST __fhInputObjController.myGPList

#endregion
#endregion

#region //struct for player/action combo
function __fhInputPlayerAction(playerNum, actionNum) constructor
{
	player = playerNum;
	action = actionNum;
	if(false)
		player = 0;
}
#endregion

#region //struct for Action Mapping Definition for Single Action
function __fhInputActionConfig() constructor
{
	deviceType = 0;
	deviceID = 0;
	input = 0;
	guid = "";
	isAxis = false;
	shortDescription = "Not Set";
	longDescription = "Not Set";
	numConflicts = 0;
	conflicts[0] = 0;
}
#endregion

#region //struct for Action Status Definition
function __fhInputActionStatus() constructor
{
	rawValue = 0;
	isDown = false;
	isPressed = false;
	isReleased = false;
	heldSteps = 0;
	heldSeconds = 0;
}
#endregion

#region //struct for Player object
function __fhInputPlayer(number) constructor
{
	myPlayerNumber = number;
	myAssignedGamepad = -1;
	rumbleEnabled = true;
	for(var i = 0; i < global.__fhInputNumActions; i++)
	{
		myActionMaps[i] = new __fhInputActionConfig();
		myActionStatus[i] = new __fhInputActionStatus();
	}
	myIsAutomatic = true;
	static step = function()
	{
		if(myIsAutomatic)
		{
		    for(var i = 0; i < global.__fhInputNumActions; i++)
		    {
				if(FHINPUT_SETTING_DebugMode)
				{
					if(myActionMaps[i].deviceType < 0 || myActionMaps[i].deviceType > 4)
						__fhInputThrowError("An action is set to an invalid device.  You may have attempted to directly set an action's input incorrectly using fhInputActionDirectSet()");
					switch(myActionMaps[i].deviceType)
					{
						case __FHINPUT_Device_Keyboard:
							if(myActionMaps[i].input < 1 || myActionMaps[i].input > 254)
								__fhInputThrowError("An action is set to an invalid keycode.  You may have attempted to directly set an action's input incorrectly using fhInputActionDirectSet()");
							break;
						case __FHINPUT_Device_Mouse:
							if(myActionMaps[i].input < 0 || myActionMaps[i].input > 4)
								__fhInputThrowError("An action is set to an invalid mouse input.  You may have attempted to directly set an action's input incorrectly using fhInputActionDirectSet()");
							break;
						case __FHINPUT_Device_XInput:
							if(myActionMaps[i].input < 0 || myActionMaps[i].input >= __FHINPUT_XInput_Amount)
								__fhInputThrowError("An action is set to an invalid XInput input.  You may have attempted to directly set an action's input incorrectly using fhInputActionDirectSet()");
							break;
						case __FHINPUT_Device_DInput:
							if(myActionMaps[i].input < 0 || myActionMaps[i].input >= __FHINPUT_DInput_Amount)
								__fhInputThrowError("An action is set to an invalid DInput input.  You may have attempted to directly set an action's input incorrectly using fhInputActionDirectSet()");
							break;
					}
				}
				switch(myActionMaps[i].deviceType)
		        {
		            case __FHINPUT_Device_None://no device
		                break;
		            case __FHINPUT_Device_Keyboard:
		                myActionStatus[i].rawValue = __fhInputCheckKeyboard(myActionMaps[i].input);
		                break;
		            case __FHINPUT_Device_Mouse:
		                myActionStatus[i].rawValue = __fhInputCheckMouse(myActionMaps[i].input);
		                break;
		            case __FHINPUT_Device_XInput:
						myActionStatus[i].rawValue = __fhInputCheckXInput(myActionMaps[i].deviceID, myActionMaps[i].input);
		                break;
		            case __FHINPUT_Device_DInput:
		                myActionStatus[i].rawValue = __fhInputCheckDInput(myActionMaps[i].deviceID, myActionMaps[i].input);
		                break;
		        }
		    }
		}
		//update the rest of the structures
		for(i = 0; i < global.__fhInputNumActions; i++)
		{
		    //store current down/up
		    var current = myActionStatus[i].isDown;
    
		    //set new down/up
		    if(myActionStatus[i].rawValue > FHINPUT_SETTING_AxisThreshold)
		        myActionStatus[i].isDown = true;
		    else
		        myActionStatus[i].isDown = false;
        
		    //assume pressed/released are not happening
		    myActionStatus[i].isPressed = false;
		    myActionStatus[i].isReleased = false;
    
		    //verify new pressed/released values based on last and this steps
		    if(current)//was down last step
		    {
		        if(!myActionStatus[i].isDown)//is not down this step
		            myActionStatus[i].isReleased = true;
		    }
		    else//was not down last step
		    {
		        if(myActionStatus[i].isDown)//is down this step
		            myActionStatus[i].isPressed = true;
		    }
    
		    //do timeHeld checks
		    if(!myActionStatus[i].isDown)//if action is not currently down
		    {
		        //set times to 0
		        myActionStatus[i].heldSteps = 0;
		        myActionStatus[i].heldSeconds = 0;
		    }
		    else//if action is currently down
		    {
		        myActionStatus[i].heldSteps += 1;
		        myActionStatus[i].heldSeconds += delta_time/1000000;
		    }
		}
	}
	static getActionMap = function()
	{
		return json_stringify(myActionMaps);
	}
	static setActionMap = function(actionMap)
	{
		myActionMaps = json_parse(actionMap);
		fixAssignedGamepad();
		var assigned = getAssignedGamepad();
		if(assigned != -1)//is a gamepad at all
		{
			if(os_type == os_windows && assigned < 4)//is XInput
			{
				if(!gamepad_is_connected(assigned))
				{
					var list = __FHINPUT_GPLIST.listXInputGPs();
					if(array_length(list) > 0)
					{
						for(var i = 0; i < array_length(list); i++)
						{
							if(!__FHINPUT_GPLIST.isGPUsed(list[i]))
							{
								__fhInputRemapGamepad(myPlayerNumber, assigned, list[i]);
								break;
							}
						}
					}
				}
			}
			else//is DInput
			{
				var assignedGUID = getAssignedGUID();
				var same = false;
				if(gamepad_is_connected(assigned))
				{
					var currGUID = gamepad_get_guid(assigned);
					if(currGUID == assignedGUID)
						same = true;
				}
				if(!same)
				{
					var list = __FHINPUT_GPLIST.getIDsFromGUID(assignedGUID);
					if(array_length(list) > 0)
					{
						for(var i = 0; i < array_length(list); i++)
						{
							if(!__FHINPUT_GPLIST.isGPUsed(list[i]))
							{
								__fhInputRemapGamepad(myPlayerNumber, assigned, list[i]);
								break;
							}
						}
					}
				}
			}
		}
		fixGUIDs();
		fixDescriptions();
		__FHINPUT_GPLIST.updateUsedGPs();
		__fhInputSetConflicts();
	}
	static fixAssignedGamepad = function()
	{
		var gamepad = -1;
		if(FHINPUT_SETTING_GamepadAssignmentBehavior == 0)//go by first action
		{
			for(var i = 0; i < global.__fhInputNumActions; i++)
			{
				if(myActionMaps[i].deviceType == __FHINPUT_Device_XInput || myActionMaps[i].deviceType == __FHINPUT_Device_DInput)
				{
					gamepad = myActionMaps[i].deviceID;
					break;
				}
			}
		}
		else if(FHINPUT_SETTING_GamepadAssignmentBehavior == 1)//go by majority
		{
			var array = array_create(FHINPUT_SETTING_MaxGamepadID, 0);
			var currHigh = 0;
			for(var i = 0; i < global.__fhInputNumActions; i++)
			{
				if(myActionMaps[i].deviceType == __FHINPUT_Device_XInput || myActionMaps[i].deviceType == __FHINPUT_Device_DInput)
				{
					array[myActionMaps[i].deviceID]++;
				}
			}
			for(var i = 0; i < FHINPUT_SETTING_MaxGamepadID; i++)
			{
				if(array[i] > currHigh)
					gamepad = i;
			}
		}
		myAssignedGamepad = gamepad;
	}
	static getAssignedGamepad = function()
	{
		return myAssignedGamepad;
	}
	static getAssignedGUID = function()
	{
		var guid = "";
		if(FHINPUT_SETTING_GamepadAssignmentBehavior == 0)//go by first action
		{
			for(var i = 0; i < global.__fhInputNumActions; i++)
			{
				if(myActionMaps[i].deviceType == __FHINPUT_Device_DInput)
				{
					guid = myActionMaps[i].guid;
					break;
				}
			}
		}
		else if(FHINPUT_SETTING_GamepadAssignmentBehavior == 1)//go by majority
		{
			var guids = {};
			var currHigh = 0;
			var currGUID = "";
			for(var i = 0; i < global.__fhInputNumActions; i++)
			{
				if(myActionMaps[i].deviceType == __FHINPUT_Device_DInput)
				{
					currGUID = myActionMaps[i].guid;
					if(guids[$ currGUID] != undefined)
						guids[$ currGUID]++;
					else
						guids[$ currGUID] = 1;
				}
			}
			var list = variable_struct_get_names(guids);
			for(var i = 0 ; i < array_length(list); i++)
			{
				if(guids[$ list[i]] > currHigh)
					currHigh = i;
			}
			guid = list[currHigh];
		}
		return guid;
	}
	static fixGUIDs = function()
	{
		for(var i = 0; i < global.__fhInputNumActions; i++)
		{
			if(myActionMaps[i].deviceType == __FHINPUT_Device_DInput)
			{
				if(gamepad_is_connected(myActionMaps[i].deviceID))
				{
					myActionMaps[i].guid = gamepad_get_guid(myActionMaps[i].deviceID);
				}
				else
				{
					myActionMaps[i].guid = "";
				}
			}
		}
	}
	static fixDescriptions = function()
	{
		for(var i = 0; i < global.__fhInputNumActions; i++)
		{
			myActionMaps[i].shortDescription = __fhInputGetShortDescription(myActionMaps[i].deviceType, myActionMaps[i].deviceID, myActionMaps[i].input);
			myActionMaps[i].longDescription = __fhInputGetLongDescription(myActionMaps[i].deviceType, myActionMaps[i].deviceID, myActionMaps[i].input);
		}
	}
}
#endregion

#region //struct for joystick ID list
function __fhInputGPList() constructor
{
	gpAmount = 0;
	gpIDs = [];
	gpGUIDs = [];
	gpAPIs = [];
	gpAxes = [];
	gpIsUsed = [];
	IDtoIndex = {};
	
	static getIDsFromGUID = function(gpGUID)
	{
		var list = [];
		for(var i = 0; i < gpAmount; i++)
		{
			if(gpGUIDs[i] == gpGUID)
				array_push(list, gpIDs[i]);
		}
		return list;
	}
	static addID = function(gpID)
	{
		array_push(gpIDs, gpID);
		array_push(gpGUIDs, gamepad_get_guid(gpID));
		if(os_type == os_windows && gpID < 4)
			array_push(gpAPIs, __FHINPUT_Device_XInput);
		else
			array_push(gpAPIs, __FHINPUT_Device_DInput);
		array_push(gpAxes, array_create(10, 0));
		array_push(gpIsUsed, false);
		IDtoIndex[$ string(gpID)] = gpAmount;
		gpAmount++;
	}
	static removeID = function(gpID)
	{
		var index = -1;
		for(var i = 0; i < gpAmount; i++)
		{
			if(gpIDs[i] == gpID)
			{
				index = i;
				break;
			}
		}
		if(index != -1)
		{
			array_delete(gpIDs, index, 1);
			array_delete(gpGUIDs, index, 1);
			array_delete(gpAPIs, index, 1);
			array_delete(gpAxes, index, 1);
			array_delete(gpIsUsed, index, 1);
			gpAmount--;
			variable_struct_remove(IDtoIndex, string(index));
		}
	}
	static listXInputGPs = function()
	{
		var list = [];
		for(var i = 0; i < gpAmount; i++)
		{
			if(gpAPIs[i] == __FHINPUT_Device_XInput)
				array_push(list, i);
		}
		return list;
	}
	static listDInputGPs = function()
	{
		var list = [];
		for(var i = 0; i < gpAmount; i++)
		{
			if(gpAPIs[i] == __FHINPUT_Device_DInput)
				array_push(list, i);
		}
		return list;
	}
	static setAxes = function()
	{
		for(var i = 0; i < gpAmount; i++)
		{
			if(gpAPIs[i] == __FHINPUT_Device_XInput)
			{
				gpAxes[i][__FHINPUT_XInput_Axis_Left_Horizontal] = gamepad_axis_value(gpIDs[i], gp_axislh);
				gpAxes[i][__FHINPUT_XInput_Axis_Left_Vertical] = gamepad_axis_value(gpIDs[i], gp_axislv);
				gpAxes[i][__FHINPUT_XInput_Axis_Right_Horizontal] = gamepad_axis_value(gpIDs[i], gp_axisrh);
				gpAxes[i][__FHINPUT_XInput_Axis_Right_Vertical] = gamepad_axis_value(gpIDs[i], gp_axisrv);
				gpAxes[i][__FHINPUT_XInput_Axis_Left_Shoulder] = gamepad_button_value(gpIDs[i], gp_shoulderlb);
				gpAxes[i][__FHINPUT_XInput_Axis_Right_Shoulder] = gamepad_button_value(gpIDs[i], gp_shoulderrb);
			}
			else
			{
				for(var j = 0; j < __FHINPUT_DInput_Axis_Count; j++)
				{
					gpAxes[i][j] = gamepad_axis_value(gpIDs[i], j);
				}
			}
		}
	}
	static updateUsedGPs = function()
	{
		var i, j, k;
		for(i = 0; i < gpAmount; i++)
		{
			gpIsUsed[i] = false;//assume it is all not used
			for(j = 0; j < global.__fhInputNumPlayers; j++)//for each player
			{
				for(k = 0; k < global.__fhInputNumActions; k++)//for each action
				{
					if(__fhInputObjController.myPlayers[j].myActionMaps[k].deviceID != -1)//device is a gamepad(not keyboard or mouse)
					{
						if(gpIDs[i] == __fhInputObjController.myPlayers[j].myActionMaps[k].deviceID)
						{
							gpIsUsed[i] = true;
						}
					}
				}
			}
		}
	}
	static isGPUsed = function(gpID)
	{
		var index = -1;
		for(var i = 0; i < gpAmount; i++)
		{
			if(gpIDs[i] == gpID)
			{
				index = i;
				break;
			}
		}
		if(index == -1)
			return false;
		return gpIsUsed[index];
	}
}
#endregion

function __fhInputFixGUIDs()
{
	for(var i = 0; i < global.__fhInputNumPlayers; i++)
	{
		__fhInputObjController.myPlayers[i].fixGUIDs();
	}
}