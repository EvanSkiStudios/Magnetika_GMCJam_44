
function fhInputActionMapStructCompare(struct1, struct2)
{
	if(struct1.deviceType != struct2.deviceType)
		return false;
	if(struct1.deviceID != struct2.deviceID)
		return false;
	if(struct1.input != struct2.input)
		return false;
	return true;
}

function fhi_action_map_struct_compare(struct1, struct2)
{
	if(false){return fhi_action_map_struct_compare;}
	return fhInputActionMapStructCompare(struct1, struct2);
}