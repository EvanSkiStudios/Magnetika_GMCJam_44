function fhInputMapperInit(actionNames)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputMapperInit()";
		__fhInputAssertInitialization(str);
		if(!is_array(actionNames))
			__fhInputThrowError("Called fhInputMapperInit() with non-array actionNames argument");
		if(array_length(actionNames) != global.__fhInputNumActions)
			__fhInputThrowError("Called fhInputMapperInit() with wrong amount of values in actionNames array argument");
		for(var i = 0; i < array_length(actionNames); i++)
		{
			if(!is_string(actionNames[i]))
				__fhInputThrowError("Called fhInputMapperInit() with non-string in actionNames array argument");
		}
	}
	instance_create_depth(0, 0, 0, __fhInputMapperObjCtl);
	var currX = FHINPUT_MAPPER_ButtonXPos;
	var currY = FHINPUT_MAPPER_YPosStart;
	var sep = FHINPUT_MAPPER_YSeparation;
	currY += sep;
	for(var i = 0; i < global.__fhInputNumActions; i++)
	{
		with(instance_create_depth(currX, currY, 0, __fhInputMapperObjButtonSet))
		{
			myText = actionNames[i];
			myAction = i;
		}
		currY += sep;
	}
	instance_create_depth(FHINPUT_MAPPER_ButtonDefaultXPos, FHINPUT_MAPPER_ButtonDefaultYPos, 0, __fhInputMapperObjButtonDefault);
}

function fhi_mapper_init(actionNames)
{
	if(false){return fhi_mapper_init;}
	return fhInputMapperInit(actionNames);
}