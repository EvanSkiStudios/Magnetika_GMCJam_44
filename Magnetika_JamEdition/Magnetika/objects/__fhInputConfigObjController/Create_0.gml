fhInputInitialize();
if(!directory_exists(FHINPUT_SETTING_ProjectDirectory))
{
	var str = "Configuration Creator: ";
	str += "Project Directory #macro setting is not set to a valid directory(or you forgot to turn off the sandbox).";
	__fhInputThrowError(str);
}

gpCallback = function(result, gpid, str)
{
	str += " ID# ";
	str += string(gpid);
	str += " ";
	if(result == FHINPUT_GPEVENT_CONNECT)
		str += "connected.";
	else if(result == FHINPUT_GPEVENT_DISCONNECT)
		str += "disconnected.";
	__fhInputConfigCreateTempText(str)
}

fhInputSetGamepadEventCallback(gpCallback);
room_goto(__fhInputConfigRmConfig);