var loaded = __fhInputConfigLoadDefaultActionMaps();
if(loaded)
{
	__fhInputConfigCreateTempText("Maps Loaded");
	__fhInputConfigObjCtlMaps.currentMap = 0;
	__fhInputConfigObjCtlMaps.numMaps = array_length(__fhInputObjController.myDefaultActionMaps);
	fhInputPlayerActionMapSetDefault(0, 0);
}
else
{
	__fhInputConfigCreateTempText("Can't Load missing or invalid default maps");
}