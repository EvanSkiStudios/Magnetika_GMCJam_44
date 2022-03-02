with(__fhInputConfigObjCtlMaps)
{
	if(currentMap > 0)
	{
		currentMap--;
		fhInputPlayerActionMapSetDefault(0, currentMap);
	}
	else
		__fhInputConfigCreateTempText("Already at first map index.");
}