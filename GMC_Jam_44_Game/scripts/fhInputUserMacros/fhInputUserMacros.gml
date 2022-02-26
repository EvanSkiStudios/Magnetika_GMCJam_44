//*********************************************
//These macros are set up for your convenience.  Their use is optional.
//You can use indices directly if you choose.  Remember that like arrays, indices start at 0.
//Feel free to change the names of these, add to them, etc...
//Please remember that these names are all referenced in the code in the bottom as well that removes the syntax errors for unreferenced macros.
//If you change names here, please remove the code at the bottom so you don't get real errors
//Remember that if you remove the code completely, you will get false positive syntax errors for unused macros

//Player indices, the player array starts at 0, but this will let you "logically" start at 1
#macro FHINPUTPLAYER_1 0
#macro FHINPUTPLAYER_2 1
#macro FHINPUTPLAYER_3 2
#macro FHINPUTPLAYER_4 3
#macro FHINPUTPLAYER_5 4
#macro FHINPUTPLAYER_6 5
#macro FHINPUTPLAYER_7 6
#macro FHINPUTPLAYER_8 7

//Action macros, if you wish to use macros, change these names to taste based on your game's actions
#macro FHINPUTACTION_Up 0
#macro FHINPUTACTION_Down 1
#macro FHINPUTACTION_Left 2
#macro FHINPUTACTION_Right 3
#macro FHINPUTACTION_Activate 4 //space A
#macro FHINPUTACTION_ActivateAlt 5 //numpad 0 B
#macro FHINPUTACTION_ActivateAltLH 6 //right contrl select
#macro FHINPUTACTION_ActivateMenuAlt 7 //enter start

//Device macros, For advanced usage involving directly setting action maps, resolving conflicts, etc...
#macro FHINPUTDEVICE_None 0
#macro FHINPUTDEVICE_Keyboard 1
#macro FHINPUTDEVICE_Mouse 2
#macro FHINPUTDEVICE_XInput 3
#macro FHINPUTDEVICE_DInput 4

//Mouse Input Macros, For advanced usage involving directly setting action maps, resolving conflicts, etc...
#macro FHINPUTMOUSE_LeftClick 0
#macro FHINPUTMOUSE_RightClick 1
#macro FHINPUTMOUSE_MiddleClick 2
#macro FHINPUTMOUSE_WheelUp 3
#macro FHINPUTMOUSE_WheelDown 4

//XInput Input Macros, For advanced usage involving directly setting action maps, resolving conflicts, etc...
#macro FHINPUTXINPUT_LeftStickRight 0
#macro FHINPUTXINPUT_LeftStickLeft 1
#macro FHINPUTXINPUT_LeftStickUp 2
#macro FHINPUTXINPUT_LeftStickDown 3
#macro FHINPUTXINPUT_RightStickRight 4
#macro FHINPUTXINPUT_RightStickLeft 5
#macro FHINPUTXINPUT_RightStickUp 6
#macro FHINPUTXINPUT_RightStickDown 7
#macro FHINPUTXINPUT_LeftShoulder2 8
#macro FHINPUTXINPUT_RightShoulder2 9
#macro FHINPUTXINPUT_DPadUp 10
#macro FHINPUTXINPUT_DPadDown 11
#macro FHINPUTXINPUT_DPadLeft 12
#macro FHINPUTXINPUT_DPadRight 13
#macro FHINPUTXINPUT_Face1 14
#macro FHINPUTXINPUT_Face2 15
#macro FHINPUTXINPUT_Face3 16
#macro FHINPUTXINPUT_Face4 17
#macro FHINPUTXINPUT_LeftShoulder1 18
#macro FHINPUTXINPUT_RightShoulder1 19
#macro FHINPUTXINPUT_LeftStickButton 20
#macro FHINPUTXINPUT_RightStickButton 21
#macro FHINPUTXINPUT_Select 22
#macro FHINPUTXINPUT_Start 23

//DInput Input Macros, For advanced usage involving directly setting action maps, resolving conflicts, etc...
#macro FHINPUTDINPUT_XPlus 0
#macro FHINPUTDINPUT_XMinus 1
#macro FHINPUTDINPUT_YPlus 2
#macro FHINPUTDINPUT_YMinus 3
#macro FHINPUTDINPUT_ZPlus 4
#macro FHINPUTDINPUT_ZMinus 5
#macro FHINPUTDINPUT_RPlus 6
#macro FHINPUTDINPUT_RMinus 7
#macro FHINPUTDINPUT_UPlus 8
#macro FHINPUTDINPUT_UMinus 9
#macro FHINPUTDINPUT_VPlus 10
#macro FHINPUTDINPUT_VMinus 11
#macro FHINPUTDINPUT_APlus 12
#macro FHINPUTDINPUT_AMinus 13
#macro FHINPUTDINPUT_BPlus 14
#macro FHINPUTDINPUT_BMinus 15
#macro FHINPUTDINPUT_CPlus 16
#macro FHINPUTDINPUT_CMinus 17
#macro FHINPUTDINPUT_DPlus 18
#macro FHINPUTDINPUT_DMinus 19
#macro FHINPUTDINPUT_Button1 20
#macro FHINPUTDINPUT_Button2 21
#macro FHINPUTDINPUT_Button3 22
#macro FHINPUTDINPUT_Button4 23
#macro FHINPUTDINPUT_Button5 24
#macro FHINPUTDINPUT_Button6 25
#macro FHINPUTDINPUT_Button7 26
#macro FHINPUTDINPUT_Button8 27
#macro FHINPUTDINPUT_Button9 28
#macro FHINPUTDINPUT_Button10 29
#macro FHINPUTDINPUT_Button11 30
#macro FHINPUTDINPUT_Button12 31
#macro FHINPUTDINPUT_Button13 32
#macro FHINPUTDINPUT_Button14 33
#macro FHINPUTDINPUT_Button15 34
#macro FHINPUTDINPUT_Button16 35
#macro FHINPUTDINPUT_Button17 36
#macro FHINPUTDINPUT_Button18 37
#macro FHINPUTDINPUT_Button19 38
#macro FHINPUTDINPUT_Button20 39
#macro FHINPUTDINPUT_Button21 40
#macro FHINPUTDINPUT_Button22 41
#macro FHINPUTDINPUT_Button23 42
#macro FHINPUTDINPUT_Button24 43
#macro FHINPUTDINPUT_Button25 44
#macro FHINPUTDINPUT_Button26 45
#macro FHINPUTDINPUT_Button27 46
#macro FHINPUTDINPUT_Button28 47
#macro FHINPUTDINPUT_Button29 48
#macro FHINPUTDINPUT_Button30 49
#macro FHINPUTDINPUT_Button31 50
#macro FHINPUTDINPUT_Button32 51
#macro FHINPUTDINPUT_Hat0Up 52
#macro FHINPUTDINPUT_Hat0Down 53
#macro FHINPUTDINPUT_Hat0Left 54
#macro FHINPUTDINPUT_Hat0Right 55
#macro FHINPUTDINPUT_Hat0UpRight 56
#macro FHINPUTDINPUT_Hat0DownRight 57
#macro FHINPUTDINPUT_Hat0DownLeft 58
#macro FHINPUTDINPUT_Hat0UpLeft 59
#macro FHINPUTDINPUT_Hat1Up 60
#macro FHINPUTDINPUT_Hat1Down 61
#macro FHINPUTDINPUT_Hat1Left 62
#macro FHINPUTDINPUT_Hat1Right 63
#macro FHINPUTDINPUT_Hat1UpRight 64
#macro FHINPUTDINPUT_Hat1DownRight 65
#macro FHINPUTDINPUT_Hat1DownLeft 66
#macro FHINPUTDINPUT_Hat1UpLeft 67
#macro FHINPUTDINPUT_Hat2Up 68
#macro FHINPUTDINPUT_Hat2Down 69
#macro FHINPUTDINPUT_Hat2Left 70
#macro FHINPUTDINPUT_Hat2Right 71
#macro FHINPUTDINPUT_Hat2UpRight 72
#macro FHINPUTDINPUT_Hat2DownRight 73
#macro FHINPUTDINPUT_Hat2DownLeft 74
#macro FHINPUTDINPUT_Hat2UpLeft 75
#macro FHINPUTDINPUT_Hat3Up 76
#macro FHINPUTDINPUT_Hat3Down 77
#macro FHINPUTDINPUT_Hat3Left 78
#macro FHINPUTDINPUT_Hat3Right 79
#macro FHINPUTDINPUT_Hat3UpRight 80
#macro FHINPUTDINPUT_Hat3DownRight 81
#macro FHINPUTDINPUT_Hat3DownLeft 82
#macro FHINPUTDINPUT_Hat3UpLeft 83

/*
The below region has code that accesses all of the above #macros, so that if you delete the examples and don't use any of them, you don't get syntax errors.
This code is inside an if(false){} statement gets compiled out completely in the end and is only for removing the IDE syntax errors.
If you change the above #macros, you will get syntax errors below.  If you simply delete the below region, you may get syntax errors/warnings due to unused #macros.
If you make sure to reference all the #macros above somewhere else, you can delete the below region and won't get any errors.
*/
#region //access macros so they don't get syntax errors for being unused
if(false)
{
	var temp;
	temp = FHINPUTPLAYER_1;
	temp = FHINPUTPLAYER_2;
	temp = FHINPUTPLAYER_3;
	temp = FHINPUTPLAYER_4;
	temp = FHINPUTPLAYER_5;
	temp = FHINPUTPLAYER_6;
	temp = FHINPUTPLAYER_7;
	temp = FHINPUTPLAYER_8;
	temp = FHINPUTACTION_Up;
	temp = FHINPUTACTION_Down;
	temp = FHINPUTACTION_Left;
	temp = FHINPUTACTION_Right;
	temp = FHINPUTACTION_Activate;
	temp = FHINPUTACTION_ActivateAlt;
	temp = FHINPUTACTION_ActivateAltLH;
	temp = FHINPUTACTION_ActivateMenuAlt;
	temp = FHINPUTDEVICE_None;
	temp = FHINPUTDEVICE_Keyboard;
	temp = FHINPUTDEVICE_Mouse;
	temp = FHINPUTDEVICE_XInput;
	temp = FHINPUTDEVICE_DInput;
	temp = FHINPUTMOUSE_LeftClick;
	temp = FHINPUTMOUSE_RightClick;
	temp = FHINPUTMOUSE_MiddleClick;
	temp = FHINPUTMOUSE_WheelUp;
	temp = FHINPUTMOUSE_WheelDown;
	temp = FHINPUTXINPUT_LeftStickRight;
	temp = FHINPUTXINPUT_LeftStickLeft;
	temp = FHINPUTXINPUT_LeftStickUp;
	temp = FHINPUTXINPUT_LeftStickDown;
	temp = FHINPUTXINPUT_RightStickRight;
	temp = FHINPUTXINPUT_RightStickLeft;
	temp = FHINPUTXINPUT_RightStickUp;
	temp = FHINPUTXINPUT_RightStickDown;
	temp = FHINPUTXINPUT_LeftShoulder2;
	temp = FHINPUTXINPUT_RightShoulder2;
	temp = FHINPUTXINPUT_DPadUp;
	temp = FHINPUTXINPUT_DPadDown;
	temp = FHINPUTXINPUT_DPadLeft;
	temp = FHINPUTXINPUT_DPadRight;
	temp = FHINPUTXINPUT_Face1;
	temp = FHINPUTXINPUT_Face2;
	temp = FHINPUTXINPUT_Face3;
	temp = FHINPUTXINPUT_Face4;
	temp = FHINPUTXINPUT_LeftShoulder1;
	temp = FHINPUTXINPUT_RightShoulder1;
	temp = FHINPUTXINPUT_LeftStickButton;
	temp = FHINPUTXINPUT_RightStickButton;
	temp = FHINPUTXINPUT_Select;
	temp = FHINPUTXINPUT_Start;
	temp = FHINPUTDINPUT_XPlus;
	temp = FHINPUTDINPUT_XMinus;
	temp = FHINPUTDINPUT_YPlus;
	temp = FHINPUTDINPUT_YMinus;
	temp = FHINPUTDINPUT_ZPlus;
	temp = FHINPUTDINPUT_ZMinus;
	temp = FHINPUTDINPUT_RPlus;
	temp = FHINPUTDINPUT_RMinus;
	temp = FHINPUTDINPUT_UPlus;
	temp = FHINPUTDINPUT_UMinus;
	temp = FHINPUTDINPUT_VPlus;
	temp = FHINPUTDINPUT_VMinus;
	temp = FHINPUTDINPUT_APlus;
	temp = FHINPUTDINPUT_AMinus;
	temp = FHINPUTDINPUT_BPlus;
	temp = FHINPUTDINPUT_BMinus;
	temp = FHINPUTDINPUT_CPlus;
	temp = FHINPUTDINPUT_CMinus;
	temp = FHINPUTDINPUT_DPlus;
	temp = FHINPUTDINPUT_DMinus;
	temp = FHINPUTDINPUT_Button1;
	temp = FHINPUTDINPUT_Button2;
	temp = FHINPUTDINPUT_Button3;
	temp = FHINPUTDINPUT_Button4;
	temp = FHINPUTDINPUT_Button5;
	temp = FHINPUTDINPUT_Button6;
	temp = FHINPUTDINPUT_Button7;
	temp = FHINPUTDINPUT_Button8;
	temp = FHINPUTDINPUT_Button9;
	temp = FHINPUTDINPUT_Button10;
	temp = FHINPUTDINPUT_Button11;
	temp = FHINPUTDINPUT_Button12;
	temp = FHINPUTDINPUT_Button13;
	temp = FHINPUTDINPUT_Button14;
	temp = FHINPUTDINPUT_Button15;
	temp = FHINPUTDINPUT_Button16;
	temp = FHINPUTDINPUT_Button17;
	temp = FHINPUTDINPUT_Button18;
	temp = FHINPUTDINPUT_Button19;
	temp = FHINPUTDINPUT_Button20;
	temp = FHINPUTDINPUT_Button21;
	temp = FHINPUTDINPUT_Button22;
	temp = FHINPUTDINPUT_Button23;
	temp = FHINPUTDINPUT_Button24;
	temp = FHINPUTDINPUT_Button25;
	temp = FHINPUTDINPUT_Button26;
	temp = FHINPUTDINPUT_Button27;
	temp = FHINPUTDINPUT_Button28;
	temp = FHINPUTDINPUT_Button29;
	temp = FHINPUTDINPUT_Button30;
	temp = FHINPUTDINPUT_Button31;
	temp = FHINPUTDINPUT_Button32;
	temp = FHINPUTDINPUT_Hat0Up;
	temp = FHINPUTDINPUT_Hat0Down;
	temp = FHINPUTDINPUT_Hat0Left;
	temp = FHINPUTDINPUT_Hat0Right;
	temp = FHINPUTDINPUT_Hat0UpRight;
	temp = FHINPUTDINPUT_Hat0DownRight;
	temp = FHINPUTDINPUT_Hat0DownLeft;
	temp = FHINPUTDINPUT_Hat0UpLeft;
	temp = FHINPUTDINPUT_Hat1Up;
	temp = FHINPUTDINPUT_Hat1Down;
	temp = FHINPUTDINPUT_Hat1Left;
	temp = FHINPUTDINPUT_Hat1Right;
	temp = FHINPUTDINPUT_Hat1UpRight;
	temp = FHINPUTDINPUT_Hat1DownRight;
	temp = FHINPUTDINPUT_Hat1DownLeft;
	temp = FHINPUTDINPUT_Hat1UpLeft;
	temp = FHINPUTDINPUT_Hat2Up;
	temp = FHINPUTDINPUT_Hat2Down;
	temp = FHINPUTDINPUT_Hat2Left;
	temp = FHINPUTDINPUT_Hat2Right;
	temp = FHINPUTDINPUT_Hat2UpRight;
	temp = FHINPUTDINPUT_Hat2DownRight;
	temp = FHINPUTDINPUT_Hat2DownLeft;
	temp = FHINPUTDINPUT_Hat2UpLeft;
	temp = FHINPUTDINPUT_Hat3Up;
	temp = FHINPUTDINPUT_Hat3Down;
	temp = FHINPUTDINPUT_Hat3Left;
	temp = FHINPUTDINPUT_Hat3Right;
	temp = FHINPUTDINPUT_Hat3UpRight;
	temp = FHINPUTDINPUT_Hat3DownRight;
	temp = FHINPUTDINPUT_Hat3DownLeft;
	temp = FHINPUTDINPUT_Hat3UpLeft;
}
#endregion