myText = "TempText";
with(__fhInputConfigObjTempText)
{
	if(id != other.id)
		instance_destroy();
}
alarm[0] = 180;