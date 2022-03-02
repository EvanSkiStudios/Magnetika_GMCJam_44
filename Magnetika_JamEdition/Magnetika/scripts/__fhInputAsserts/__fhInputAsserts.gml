#region //__fhInputThrowError(errormessage)
function __fhInputThrowError(errormessage)
{
	var str = "FHINPUT: ";
	str += errormessage;
	throw(str);
}
#endregion

#region //__fhInputDebugLog(text)
function __fhInputDebugLog(text)
{
	var str = text;
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

#region //__fhInputAssertInitialization(description)
function __fhInputAssertInitialization(description)
{
	if(!fhInputIsInitialized())
	{
		var str = description;
		str += ": ";
		str += "Attempted to use system before it was initialized";
		__fhInputThrowError(str);
	}
}
#endregion

#region //__fhInputAssertValidPlayer(description, playerNum)
function __fhInputAssertValidPlayer(description, playerNum)
{
	if(playerNum >= global.__fhInputNumPlayers)
	{
		var str = description;
		str += ": ";
		str += "Attempted to reference invalid player.";
		__fhInputThrowError(str);
	}
	return;
}
#endregion

#region //__fhInputAssertValidAction(description, actionNum)
function __fhInputAssertValidAction(description, actionNum)
{
	if(actionNum >= global.__fhInputNumActions)
	{
		var str = description;
		str += ": ";
		str += "Attempted to reference invalid action.";
		__fhInputThrowError(str);
	}
	return;
}
#endregion