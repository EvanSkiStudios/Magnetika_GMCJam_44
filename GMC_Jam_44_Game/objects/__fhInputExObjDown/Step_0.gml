if(fhInputActionCheckDown(0) && canshoot == 0)
{
	with(instance_create_depth(x, y, 0, __fhInputExObjBullet))
		direction = 90;
	canshoot = 20;
}
if(canshoot > 0)
	canshoot--;