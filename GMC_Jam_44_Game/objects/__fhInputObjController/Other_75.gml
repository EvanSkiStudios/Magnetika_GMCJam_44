if(async_load[? "event_type"] == "gamepad discovered")
{
	var gpID = async_load[? "pad_index"];
	searchReset();
	myGPList.addID(gpID);
	__fhInputFixGUIDs();
	__fhInputFixAllDescriptions();
	if(os_type == os_windows && gpID < 4)
	{
		str = "XInput Player #";
		str += string(gpID + 1);
	}
	else
	{
		var guid = gamepad_get_guid(gpID);
		var vendor = __fhInputGetGamepadVendor(guid);
		var model = __fhInputGetGamepadModel(guid);
		str = vendor + " " + model;
	}
	if(myGPEventCallback != -1)
		myGPEventCallback(FHINPUT_GPEVENT_CONNECT, gpID, str);
}

if(async_load[? "event_type"] == "gamepad lost")
{
	var gpID = async_load[? "pad_index"];
	searchReset();
	var index = __FHINPUT_GPLIST.IDtoIndex[$ string(gpID)];
	var str = "";
	if(os_type == os_windows && gpID < 4)
	{
		str = "XInput Player #";
		str += string(gpID + 1);
	}
	else
	{
		var guid = __FHINPUT_GPLIST.gpGUIDs[index];
		var vendor = __fhInputGetGamepadVendor(guid);
		var model = __fhInputGetGamepadModel(guid);
		str = vendor + " " + model;
	}
	myGPList.removeID(gpID);
	__fhInputFixGUIDs();
	__fhInputFixAllDescriptions();
	if(myGPEventCallback != -1)
		myGPEventCallback(FHINPUT_GPEVENT_DISCONNECT, gpID, str);
}