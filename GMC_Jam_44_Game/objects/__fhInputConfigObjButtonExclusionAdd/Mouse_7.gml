with(__fhInputConfigObjCtlExclusions)
{
	if(!searching)
	{
		timeOut = 300;
		searchDelay = 30;
		searching = true;
		__fhInputConfigCreateTempText("Hold on...");
	}
}