with(__fhInputExObjConflicts)
{
	if(myStatus == 0)
	{
		myStatus = 1;
		alarm[0] = 30;
		actionToSet = other.myActionNum;
		currActionMap = fhInputActionMapGetStruct(actionToSet);
		fhInputActionMapSearch(other.myActionNum, myFunc);
	}
}