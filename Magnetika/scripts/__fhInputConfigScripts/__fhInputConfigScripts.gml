#region //fhInputConfigGetFolder()
function __fhInputConfigGetFolder()
{
	var str = FHINPUT_SETTING_ProjectDirectory;
	var len = string_length(str);
	if(string_char_at(str, len) != "\\")
	{
		str += "\\";
	}
	str+= "datafiles\\FHInput\\";
	return str;
}
#endregion

#region //__fhInputConfigLoadExclusions()
function __fhInputConfigLoadExclusions()
{
	var filename = __fhInputConfigGetFolder();
	filename += "fhInputExclusions.fhi";
	var file = file_text_open_read(filename);
	if(!file)
		return false;
	var str = file_text_read_string(file);
	file_text_close(file);
	__fhInputObjController.myExclusions = json_parse(str);
	//ds_list_read(__fhInputObjController.myExclusionList, str);
	return true;
}
#endregion

#region //__fhInputConfigSaveExclusions()
function __fhInputConfigSaveExclusions()
{
	var filename = __fhInputConfigGetFolder();
	filename += "fhInputExclusions.fhi";
	
	if(file_exists(filename))
		file_delete(filename);
	var file = file_text_open_write(filename);
	if(!file)
		return false;
	//var str = ds_list_write(__fhInputObjController.myExclusionList);
	str = json_stringify(__fhInputObjController.myExclusions);
	file_text_write_string(file, str);
	file_text_close(file);
	return true;
}
#endregion

#region //__fhInputConfigLoadDefaultActionMaps()
function __fhInputConfigLoadDefaultActionMaps()
{
	var filename = __fhInputConfigGetFolder();
	filename += "fhInputActionMaps.fhi";
	var file = file_text_open_read(filename);
	if(!file)
		return false;
	var str = file_text_read_string(file);
	file_text_readln(file);
	if(real(str) != global.__fhInputNumActions)
	{
		file_text_close(file);
		return false;
	}
	str = file_text_read_string(file);
	__fhInputObjController.myDefaultActionMaps = json_parse(str);
	file_text_close(file);
	return true;
}
#endregion

#region //__fhInputConfigSaveDefaultActionMaps()
function __fhInputConfigSaveDefaultActionMaps()
{
	var filename = __fhInputConfigGetFolder();
	filename += "fhInputActionMaps.fhi";
	if(file_exists(filename))
		file_delete(filename);
	var file = file_text_open_write(filename);
	if(!file)
		return false;
	var str = json_stringify(__fhInputObjController.myDefaultActionMaps);
	file_text_write_string(file, string(global.__fhInputNumActions));
	file_text_writeln(file);
	file_text_write_string(file, str);
	file_text_close(file);
	return true;
}
#endregion

#region //__fhInputConfigCreateTempText()
function __fhInputConfigCreateTempText(text)
{
	with(instance_create_depth(0, 0, 0, __fhInputConfigObjTempText))
		myText = text;
}
#endregion