//if searching...do the search
var conflict = false;
var found = false;
if(mySearching)
{
    if(!myDelayTimeLeft>0)
    {
		var result = __fhInputSearchGamepads();
		if(result[0] != -1)
		{
			found = true;
			myFoundDeviceID = result[0];
			myFoundInput = result[1];
			myFoundDeviceType = __FHINPUT_Device_DInput;
			if(os_type == os_windows && myFoundDeviceID < 4)
				myFoundDeviceType = __FHINPUT_Device_XInput;
		}
        else
		{
			result = __fhInputSearchMouse();
			if(result != -1)
			{
				found = true;
				myFoundDeviceType = __FHINPUT_Device_Mouse;
				myFoundDeviceID = -1;
				myFoundInput = result;
			}
	        else
			{	
				result = __fhInputSearchKeyboard();
				if(result != -1)
	            {
					found = true;
					for(var i = 0; i < array_length(myExclusions); i++)
					{
	                    if(result == myExclusions[i])
	                        found = false;
	                }
					if(found)
					{
						myFoundDeviceType = __FHINPUT_Device_Keyboard;
						myFoundDeviceID = -1;
						myFoundInput = result;
					}
	            }
			}
		}
        if(found)
        {
            if(global.__fhInputAllowConflicts)
            {
                __fhInputSetAction(mySearchingPlayer, mySearchingAction, myFoundDeviceType, myFoundDeviceID, myFoundInput);
                __fhInputSetConflicts();
				myCallback(FHINPUT_RESULT_SUCCESS);
				searchReset();
            }
            else
            {
				conflict = __fhInputSearchForConflict(myFoundDeviceType, myFoundDeviceID, myFoundInput);
                if(conflict)
                {
                    myCallback(FHINPUT_RESULT_CONFLICT);
                    searchReset();
                }
                else
                {
                    __fhInputSetAction(mySearchingPlayer, mySearchingAction, myFoundDeviceType, myFoundDeviceID, myFoundInput);
                    myCallback(FHINPUT_RESULT_SUCCESS);
                    searchReset();
                }
            }
        }
        else if(!myTimeLeft > 0)//time is up
        {
            myCallback(FHINPUT_RESULT_TIMEOUT);
            searchReset();
        }
		else
		{
			myTimeLeft--;
		}
    }
    else//delay is still above 0
    {
        myDelayTimeLeft--;
    }
}
else if(mySearchingGamepad)
{
	if(!myDelayTimeLeft>0)
    {
		var result = __fhInputSearchGamepads();
		if(result[0] != -1)
		{
			found = true;
			myCallbackGamepad(result[0]);
			searchReset();
		}
		else if(!myTimeLeft > 0)//time is up
        {
            myCallbackGamepad(-1);
            searchReset();
        }
		else
		{
			myTimeLeft--;
		}
    }
    else//delay is still above 0
    {
        myDelayTimeLeft--;
    }
}
else//not searching, update the players
{
	for(var i = 0; i < global.__fhInputNumPlayers; i++)
	{
		myPlayers[i].step();
	}
}