/*
This #macro determines how many sound categories you have, default is 2, you must have at least 1, and you can have more if you need to
*/
#macro FHAUDIO_NUMBER_SOUND_CATEGORIES 2

/*
This #macro turns debug mode on/off.  Debug mode does extra checks to make sure functions are being called correctly, and emits messages explaining the issue if something comes up.
This can be set to false once you have your game working properly, which will have the compiler remove the un-needed code.
*/
#macro FHAUDIO_DEBUGMODE true

/*
This #macro turns on/off the Volume auto-saving feature.  Turned on, it will save a file with the volume settings, and load it in next time you run.
If you prefer to save your own file with these settings, turn this off, and use the various *get functions to get the volume settings.
*/
#macro FHAUDIO_AUTOSAVE_SETTINGS false

/*
This #macro is a fix for when you are swapfading or crossfading music and set the volume in the middle of one of these transitions.
When you adjust volume settings, it automatcally changes the volume of the currently playing music, which is what you want.
Generally you wouldn't change volume in the middle of a fade, but if for some reason you really need to, you can set this value to anything higher than your maximum fading times,
 and it will make sure to add this extra time to the fade so it doesn't end up with too loud of music before the fade is complete.
If you make sure to never do volume changes while doing music fades, this won't affect you at all.
*/
#macro FHAUDIO_VOLUMEFIX_TIME 1000

/*
This #macro decides how long to do music crossfading when you use the automatic music changing based off changing rooms, in milliseconds.
It defaults at 1000 milliseconds(1 second).
This does not affect anything when you manually crossfade or swapfade music.
*/
#macro FHAUDIO_ROOM_MUSIC_CHANGE_FADE_TIME 1000

/*
This #macro decides if music should start from the beginning or from where it was at when it last stopped.
This only applies to when you set it up to automatically play music when changing rooms, not when manually changing music.
It defaults to false so it would NOT start at the beginning(except for the first time).
Change it to true if you want it to start at the beginning every time.
*/
#macro FHAUDIO_ROOM_MUSIC_CHANGE_FROM_BEGINNING false