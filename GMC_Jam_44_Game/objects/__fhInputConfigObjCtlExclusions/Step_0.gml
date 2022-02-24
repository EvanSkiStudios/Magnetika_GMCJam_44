if(searching)
{
	if(searchDelay > 0)
		searchDelay--;
	else
	{
		if(timeOut == 0)
		{
			searching = false;
			__fhInputConfigCreateTempText("Search Timed Out");
		}
		else
		{
			timeOut--;
			var key = __fhInputSearchKeyboard();
			if(key > -1)
			{
				var add = true;
				for(var i = 0; i < amount; i++)
				{
					if(__fhInputObjController.myExclusions[i] == key)
						add = false;
				}
				if(add)
				{
					array_push(__fhInputObjController.myExclusions, key);
					update();
					__fhInputConfigCreateTempText("Exclusion Added");
				}
				else
					__fhInputConfigCreateTempText("That Key is already excluded.");
				searching = false;
			}
			else
				__fhInputConfigCreateTempText("Press Key...");
		}
	}
}