if(fhInputActionCheckReleased(2))
{
	with(instance_create_depth(x, y, 0, __fhInputExObjBullet))
		direction = 180;
}