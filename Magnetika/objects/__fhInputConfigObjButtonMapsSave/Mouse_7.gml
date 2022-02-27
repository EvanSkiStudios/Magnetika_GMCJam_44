with(__fhInputConfigObjCtlMaps)
{
	/*if(currentMap == ds_list_size(__fhInputObjController.myDefaultActionConfigs))
	{
		var map = fhInputPlayerActionMapGet(0);
		__fhInputObjController.myDefaultActionConfigs[| currentMap] = map;
	}*/
	var map = fhInputPlayerActionMapGet(0);
	__fhInputObjController.myDefaultActionMaps[currentMap] = map;
	__fhInputConfigSaveDefaultActionMaps();
	__fhInputConfigCreateTempText("Maps Saved");
}