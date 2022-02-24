//status
//0 = idle
//1 = search delay
//2 = searching

myStatus = 0;
actionNum = global.__fhInputNumActions;
delay = FHINPUT_SETTING_SearchDelay;

callback = function(result)
{
	myStatus = 0;
}

startSearch = function(actionNum)
{
	fhInputActionMapSearch(actionNum, callback);
	alarm[0] = delay;
	myStatus = 1;
}

myText = FHINPUT_MAPPER_StringIdle;
