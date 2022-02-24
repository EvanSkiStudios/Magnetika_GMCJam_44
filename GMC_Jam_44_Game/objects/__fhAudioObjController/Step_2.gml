#region handle listener following instance stuff
if(listenerInstanceToFollow != -1)
{
	if(instance_exists(listenerInstanceToFollow))
	{
		var xPos = listenerInstanceToFollow.x;
		var yPos = listenerInstanceToFollow.y;
		var zPos = 0;
		if(listenerInstanceToFollow3d)
			zPos = listenerInstanceToFollow.z;
		audio_listener_position(xPos, yPos, zPos);
		if(listenerInstanceToFollowVelocity)
		{
			var xVel = xPos - listenerPrevX;
			var yVel = yPos - listenerPrevY;
			var zVel = zPos - listenerPrevZ;
			listenerPrevX = xPos;
			listenerPrevY = yPos;
			listenerPrevZ = zPos;
			xVel*=listenerVelocityMultiplier;
			yVel*=listenerVelocityMultiplier;
			zVel*=listenerVelocityMultiplier;
			audio_listener_velocity(xVel, yVel, zVel);
		}
		if(!listenerInstanceToFollow3d && listenerInstanceToFollowOrientation)
		{
			var xDir = lengthdir_x(1, listenerInstanceToFollow.image_angle);
			var yDir = lengthdir_y(1, listenerInstanceToFollow.image_angle);
			audio_listener_orientation(xDir, yDir, 0, 0, 0, -1);
		}
	}
	else
	{
		listenerInstanceToFollow = -1;
	}
}
#endregion
#region handle emitter step events
if(variable_struct_names_count(emitterMap) > 0)
//if(ds_map_size(emitterMap)>0)
{
	var temp = variable_struct_get_names(emitterMap);
	for(var i = 0; i < array_length(temp); i++)
	{
		emitterMap[$ temp[i]].step();
	}
}
#endregion