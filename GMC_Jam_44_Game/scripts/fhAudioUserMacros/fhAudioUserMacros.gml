/*
Sound Behaviors
These macros are for controlling how the track is chosen for a sound when multiple tracks are used.
Please do not change these, as they are also used by internal functions.
*/
#macro FHAUDIO_CHOOSE_RANDOM 0
#macro FHAUDIO_CHOOSE_RANDOM_NOT_REPEATED 1
#macro FHAUDIO_CHOOSE_SEQUENCE 2

#region //access behavior macros so they don't get syntax errors for being unused
if(false)
{
	var temp;
	temp = FHAUDIO_CHOOSE_RANDOM;
	temp = FHAUDIO_CHOOSE_RANDOM_NOT_REPEATED;
	temp = FHAUDIO_CHOOSE_SEQUENCE;
}
#endregion

/*
Sound Categories
These macros are for sound categories, feel free to change/add if you need to.
If you change them, you will also want to change the below region, or simply remove it if you use all of these #macros somewhere.
*/
#macro FHAUDIO_CATEGORY_GUI 0
#macro FHAUDIO_CATEGORY_GAME 1
//#macro FHAUDIO_CATEGORY_3 2
//#macro FHAUDIO_CATEGORY_4 3
//#macro FHAUDIO_CATEGORY_5 4
//#macro FHAUDIO_CATEGORY_6 5
//#macro FHAUDIO_CATEGORY_7 6
//#macro FHAUDIO_CATEGORY_8 7
//#macro FHAUDIO_CATEGORY_9 8
//#macro FHAUDIO_CATEGORY_10 9

/*
The below region has code that accesses all of the above #macros, so that if you delete the examples and don't use any of them, you don't get syntax errors.
This code is inside an if(false){} statement gets compiled out completely in the end and is only for removing the IDE syntax errors.
If you change the above #macros, you will get syntax errors below.  If you simply delete the below region, you may get syntax errors/warnings due to unused #macros.
If you make sure to reference all the #macros above somewhere else, you can delete the below region and won't get any errors.
*/
#region //access category macros so they don't get syntax errors for being unused
if(false)
{
	var temp;
	temp = FHAUDIO_CATEGORY_GUI;
	temp = FHAUDIO_CATEGORY_GAME;
}
#endregion