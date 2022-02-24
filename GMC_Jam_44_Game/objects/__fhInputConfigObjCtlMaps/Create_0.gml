searching = false;
timeOut = 0;
searchDelay = 0;
buttonX = 64;
buttonX2 = 960;
drawStartY = 128;
drawSeparation = 32;
amount = global.__fhInputNumActions;
currentMap = 0;
numMaps = array_length(__fhInputObjController.myDefaultActionMaps);

var currY = drawStartY;
var tempAmount;
if(amount > 0)
{
	if(amount > 18)
	{
			
		for(var i = 18; i < amount; i++)
		{
			with(instance_create_depth(buttonX2, currY, 0, __fhInputConfigObjButtonMapsChange))
			{
				myIndex = i;
			}
			currY += drawSeparation;
		}
		tempAmount = 18;
	}
	else
		tempAmount = amount;
	currY = drawStartY;
	for(var i = 0; i < tempAmount; i++)
	{
		with(instance_create_depth(buttonX, currY, 0, __fhInputConfigObjButtonMapsChange))
		{
			myIndex = i;
		}
		currY += drawSeparation;
	}	
}

var loaded = __fhInputConfigLoadDefaultActionMaps();
if(loaded)
{
	__fhInputConfigCreateTempText("Maps Loaded");
	__fhInputConfigObjCtlMaps.currentMap = 0;
	__fhInputConfigObjCtlMaps.numMaps = array_length(__fhInputObjController.myDefaultActionMaps);
	fhInputPlayerActionMapSetDefault(0, 0);
}


#region //callback()
callback = function(value)
{
	searching = false;
	if(value == FHINPUT_RESULT_CONFLICT)
		__fhInputConfigCreateTempText("Attempted to set a conflicting input.");
	else if(value == FHINPUT_RESULT_TIMEOUT)
		__fhInputConfigCreateTempText("Input Search Timed Out.");
	else if(value == FHINPUT_RESULT_SUCCESS)
		__fhInputConfigCreateTempText("Input changed.");
}
#endregion