
function fhInputPlayerActionMapSet(playerNum, actionMap)
{
	if(FHINPUT_SETTING_DebugMode)
	{
		var str = "fhInputPlayerActionMapSet()";
		__fhInputAssertInitialization(str);
		__fhInputAssertValidPlayer(str, playerNum);
	}
	__fhInputObjController.myPlayers[playerNum].setActionMap(actionMap);
	var assigned = __fhInputObjController.myPlayers[playerNum].getAssignedGamepad();
	if(assigned != -1)//a gamepad is assigned
	{
		if(os_type == os_windows && assigned < 4)//is an XInput
		{
			if(!gamepad_is_connected(assigned))
			{
				for(var i = 0; i < 4; i++)
				{
					if(gamepad_is_connected(i))
					{
						if(!__FHINPUT_GPLIST.isGPUsed(i))
						{
							__fhInputRemapGamepad(playerNum, assigned, i);
							break;
						}
					}
				}
			}
		}
		else//is DInput
		{
			var currGUID = -1;
			var wantedGUID = -1;
			if(gamepad_is_connected(assigned))
			{
				currGUID = gamepad_get_guid(assigned);
			}
			wantedGUID = __fhInputObjController.myPlayers[playerNum].getAssignedGUID();
			if(wantedGUID != currGUID)
			{
				var goodGPIDs = __FHINPUT_GPLIST.getIDsFromGUID(wantedGUID);
				for(var i = 0; i < array_length(goodGPIDs); i++)
				{
					if(!__FHINPUT_GPLIST.isGPUsed(goodGPIDs[i]))
					{
						__fhInputRemapGamepad(playerNum, assigned, goodGPIDs[i])
						break;
					}
				}
			}
		}
		__FHINPUT_GPLIST.updateUsedGPs();
		__fhInputFixGUIDs();
	}
	if(FHINPUT_SETTING_DebugMode)
	{
		__fhInputDebugLog("FHINPUT: fhInputPlayerActionMapSet() set an action map for player ", playerNum, ".");
	}
	return true;
}

function fhi_player_action_map_set(playerNum, actionMap)
{
	if(false){return fhi_player_action_map_set;}
	return fhInputPlayerActionMapSet(playerNum, actionMap);
}