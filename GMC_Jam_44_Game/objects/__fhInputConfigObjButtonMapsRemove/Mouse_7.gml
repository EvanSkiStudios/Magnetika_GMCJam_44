with(__fhInputConfigObjCtlMaps)
{
	if(array_length(__fhInputObjController.myDefaultActionMaps) == 1)
	{
		__fhInputConfigCreateTempText("Can't Remove Last Map");
	}
	else
	{
		array_delete(__fhInputObjController.myDefaultActionMaps, currentMap, 1);
		if(currentMap > 0)
			currentMap--;
		fhInputPlayerActionMapSetDefault(0, currentMap);
		__fhInputConfigCreateTempText("Map Removed");
		__fhInputConfigSaveDefaultActionMaps();
	}
}