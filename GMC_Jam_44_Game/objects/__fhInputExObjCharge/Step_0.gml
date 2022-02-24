var time = fhInputActionCheckHeldSeconds(3);
if(time >= 2)
{
	if(canshoot)
	{
		canshoot = false;
		with(instance_create_depth(x, y, 0, __fhInputExObjBullet))
		{
			direction = 0;
			image_xscale = 2;
			image_yscale = 2;
		}
	}
}
else
	canshoot = true;