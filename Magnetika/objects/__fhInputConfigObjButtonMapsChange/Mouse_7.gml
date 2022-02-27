with(__fhInputConfigObjCtlMaps)
{
	__fhInputConfigCreateTempText("Hold On...");
	alarm[0] = FHINPUT_SETTING_SearchDelay;
	fhInputPlayerActionMapSearch(0, other.myIndex, callback, true);
}