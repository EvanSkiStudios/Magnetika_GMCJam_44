/// @function fhInputInitialize()
/// @description Initializes the Firehammer Input system

function fhInputInitialize()
{
	if(FHINPUT_SETTING_DebugMode != true && FHINPUT_SETTING_DebugMode != false)
	{
		var str = "fhInputInitialize(): ";
		str += "Debug Mode #macro setting is not set to true/false.";
		__fhInputThrowError(str);
	}
	if(FHINPUT_SETTING_DebugMode)
	{
		if(instance_exists(__fhInputObjController))
		{
			__fhInputDebugLog("FHINPUT: You called fhInputInitialize() but the system is already initialized.");
		}
		if(!is_string(FHINPUT_SETTING_ProjectDirectory))
		{
			var str = "fhInputInitialize(): ";
			str += "Project Directory #macro setting is not set to a string.";
			__fhInputThrowError(str);
		}
		if(FHINPUT_SETTING_NumPlayers < 1 || is_string(FHINPUT_SETTING_NumPlayers))
		{
			var str = "fhInputInitialize(): ";
			str += "Player Number #macro setting is not set to a positive integer(or is a string instead of a number.";
			__fhInputThrowError(str);
		}
		if(FHINPUT_SETTING_NumActions < 1 || is_string(FHINPUT_SETTING_NumActions))
		{
			var str = "fhInputInitialize(): ";
			str += "Action Number #macro setting is not set to a positive integer(or is a string instead of a number.";
			__fhInputThrowError(str);
		}
		if(FHINPUT_SETTING_AllowConflicts != true && FHINPUT_SETTING_AllowConflicts != false)
		{
			var str = "fhInputInitialize(): ";
			str += "Conflict Allowance #macro setting is not set to a true/false value.";
			__fhInputThrowError(str);
		}
		if(FHINPUT_SETTING_AxisThreshold < 0 || FHINPUT_SETTING_AxisThreshold > 1 || is_string(FHINPUT_SETTING_AxisThreshold))
		{
			var str = "fhInputInitialize(): ";
			str += "Axis Threshold #macro setting is not set to a value between 0 and 1(or is a string instead of a number.";
			__fhInputThrowError(str);
		}
		if(FHINPUT_SETTING_SearchDelay < 0 || is_string(FHINPUT_SETTING_SearchDelay))
		{
			var str = "fhInputInitialize(): ";
			str += "Search Delay #macro setting is not set to a positive integer(or is a string instead of a number.";
			__fhInputThrowError(str);
		}
		if(FHINPUT_SETTING_SearchTimeout < 30 || is_string(FHINPUT_SETTING_SearchTimeout))
		{
			var str = "fhInputInitialize(): ";
			str += "Search Timeout #macro setting is not set to a positive integer over 29(or is a string instead of a number.";
			__fhInputThrowError(str);
		}
	}
	global.__fhInputNumPlayers = FHINPUT_SETTING_NumPlayers;
	global.__fhInputNumActions = FHINPUT_SETTING_NumActions;
	global.__fhInputAllowConflicts = FHINPUT_SETTING_AllowConflicts;
	instance_create_depth(0, 0, 0, __fhInputObjController);
	global.__fhInputIsInitialized = true;
	return true;
}

function fhi_initialize()
{
	if(false){return fhi_initialize;}
	return fhInputInitialize();
}