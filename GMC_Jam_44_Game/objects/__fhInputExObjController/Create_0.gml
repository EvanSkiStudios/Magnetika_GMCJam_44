
//initialize the system
//you would normalize use the non-Ext version but I'm using the Ext version
//  to override the settings in case you are already working on your game

fhInputInitializeExt(1, 4, true);

fhInputActionMapDirectSet(0, FHINPUTDEVICE_Keyboard, -1, vk_up);
fhInputActionMapDirectSet(1, FHINPUTDEVICE_Keyboard, -1, vk_down);
fhInputActionMapDirectSet(2, FHINPUTDEVICE_Keyboard, -1, vk_left);
fhInputActionMapDirectSet(3, FHINPUTDEVICE_Keyboard, -1, vk_right);

room_goto(__fhInputExRmConfig);