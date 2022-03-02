#region //__fhAudioAssertSystemInitialized
function __fhAudioAssertSystemInitialized(errorFunction)
{
	if(!fhAudioIsInitialized())
	{
		var str = "FHAUDIO: Called ";
		str += errorFunction;
		str += " before fhAudio was initialized.";
		__fhAudioThrowError(str);
	}
}
#endregion

#region //__fhAudioAssertArgumentNotUndefined
function __fhAudioAssertArgumentNotUndefined(errorFunction, argumentName, argumentValue)
{
	if(argumentValue == undefined)
	{
		var str = "FHAUDIO: Called ";
		str += errorFunction;
		str += " without required argument '";
		str += argumentName;
		str += "'.";
		__fhAudioThrowError(str);
	}
}
#endregion

#region //__fhAudioThrowError(errormessage)
function __fhAudioThrowError(errormessage)
{
	var str = "FHAUDIO: ";
	str += errormessage;
	throw(str);
}
#endregion

#region //__fhAudioDebugLog(text)
function __fhAudioDebugLog(text)
{
	var str = "FHAUDIO: ";
	str += text;
	if(argument_count > 1)
	{
		for(var i = 1; i < argument_count; i++)
		{
			str += " ";
			if(is_real(argument[i]))
				str += string(argument[i]);
			else
				str += argument[i];
		}
	}
	show_debug_message(str);
}
#endregion