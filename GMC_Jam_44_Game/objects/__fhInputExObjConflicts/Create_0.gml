/*
myStatus
0 is for waiting
1 is for delay just before searching for an input
2 is for after delay, waiting on input
3 is for waiting on yes/no for conflict resolution
*/

myStatus = 0;
timer = 0;
currActionMap = 0;
actionToSet = 0;
conflictingAction = 0;

fhInputActionMapDirectSet(0, 1, -1, vk_up);
fhInputActionMapDirectSet(1, 1, -1, vk_down);
fhInputActionMapDirectSet(2, 1, -1, vk_left);
fhInputActionMapDirectSet(3, 1, -1, vk_right);

myFunc = function()
{
	myStatus = 0;
	if(fhInputActionNumConflicts(actionToSet) > 0)
	{
		myStatus = 3;
		var tempconflicts = fhInputActionGetConflicts(actionToSet);
		conflictingAction = tempconflicts[0].action;
	}
}