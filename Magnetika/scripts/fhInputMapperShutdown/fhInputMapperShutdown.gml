function fhInputMapperShutdown()
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputShutdown()";
		__fhInputAssertInitialization(str);
	}
	with(__fhInputMapperObjButtonDefault)
		instance_destroy();
	with(__fhInputMapperObjButtonSet)
		instance_destroy();
	with(__fhInputMapperObjCtl)
		instance_destroy();
}

function fhi_mapper_shutdown()
{
	if(false){return fhi_mapper_shutdown;}
	return fhInputMapperShutdown();
}