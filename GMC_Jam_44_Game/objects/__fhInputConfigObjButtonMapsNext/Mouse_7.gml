with(__fhInputConfigObjCtlMaps)
{
	if(currentMap < array_length(__fhInputObjController.myDefaultActionMaps))
	{
		currentMap++;
		if(currentMap < array_length(__fhInputObjController.myDefaultActionMaps))
			fhInputPlayerActionMapSetDefault(0, currentMap);
	}
	else
		__fhInputConfigCreateTempText("Please save before adding another map.");
}