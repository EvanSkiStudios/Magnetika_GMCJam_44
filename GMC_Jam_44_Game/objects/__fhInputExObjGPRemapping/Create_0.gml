/*
myStatus
0 is for waiting
1 is for delay just before searching for a gamepad
2 is for after delay, waiting on input
*/

myStatus = 0;


/*fhInputActionMapDirectSet(0, 3, 0, 0);
fhInputActionMapDirectSet(1, 3, 0, 1);
fhInputActionMapDirectSet(2, 3, 0, 2);
fhInputActionMapDirectSet(3, 3, 0, 3);*/

myFunc = function(newGP)
{
	myStatus = 0;
	if(newGP != -1)
		fhInputPlayerActionMapGamepadRemap(0, newGP);
}