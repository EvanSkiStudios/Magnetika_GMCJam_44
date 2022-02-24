if(myStatus == 3)
{
	if(keyboard_check(ord("Y")))
	{
		myStatus = 0;
		fhInputActionMapSetStruct(conflictingAction, currActionMap);
	}
	if(keyboard_check(ord("N")))
	{
		myStatus = 0;
		fhInputActionMapSetStruct(actionToSet, currActionMap);
	}
}