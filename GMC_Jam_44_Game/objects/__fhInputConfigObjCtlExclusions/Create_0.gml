update = function()
{
	with(__fhInputConfigObjButtonExclusionRemove)
		instance_destroy();
	with(__fhInputConfigObjButtonExclusionAdd)
		instance_destroy();
	amount = array_length(__fhInputObjController.myExclusions);
	var currY = drawStartY;
	var tempAmount;
	if(amount > 0)
	{
		if(amount > 18)
		{
			
			for(var i = 18; i < amount; i++)
			{
				with(instance_create_depth(buttonX2, currY, 0, __fhInputConfigObjButtonExclusionRemove))
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
			with(instance_create_depth(buttonX, currY, 0, __fhInputConfigObjButtonExclusionRemove))
			{
				myIndex = i;
			}
			currY += drawSeparation;
		}
		
	}
	if(amount < 36)
		instance_create_depth(512, 672, 0, __fhInputConfigObjButtonExclusionAdd);
}

searching = false;
timeOut = 0;
searchDelay = 0;
buttonX = 64;
buttonX2 = 960;
drawStartY = 128;
drawSeparation = 32;
amount = 0;

update();