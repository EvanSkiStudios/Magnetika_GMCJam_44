//system settings
masterVolume = 1;
musicVolume = 1;
realMusicVolume = 1;

for(var i = 0; i < FHAUDIO_NUMBER_SOUND_CATEGORIES; i++)
{
	soundCategoryVolumes[i] = 1;
	realCategoryVolumes[i] = 1;
}

//music stuff
currentMusicTrack = -1;
lastMusicTrack = -1;
currentMusicRef = -1;
fadingMusicTrack = -1;
fadingMusicRef = -1;
fadeTimeEnd = -1;
musicTrackPositions = {};
musicStatus = __FHAUDIO_STATUS_STOPPED;
musicPendingFades = [];
musicLoopPoints = {};
musicRoomStarts = {};

//emitter stuff
emitterMap = {};
emitterNextIndex = 0;


//sound stuff
playingSoundsMap = {};
fadingSoundsList = [];
pausedSoundsMap = {};

soundList = {};
soundIndexList = [];
soundNumber = 0;

//listener stuff
listenerInstanceToFollow = -1;
listenerInstanceToFollow3d = false;
listenerInstanceToFollowVelocity = false;
listenerVelocityMultiplier = 1;
listenerInstanceToFollowOrientation = false;
listenerPrevX = 0;
listenerPrevY = 0;
listenerPrevZ = 0;
listenerCurrentLookAtX = 0;
listenerCurrentLookAtY = 0;
listenerCurrentLookAtZ = 1;
listenerCurrentUpX = 0;
listenerCurrentUpY = 1;
listenerCurrentUpZ = 0;

//volume stuff
if(FHAUDIO_AUTOSAVE_SETTINGS)
{
	if(!__fhAudioLoadVolumes())
		__fhAudioSaveVolumes();
}

setRealVolumes = function()
{
	realMusicVolume = musicVolume*masterVolume;
	for(var i = 0; i < FHAUDIO_NUMBER_SOUND_CATEGORIES; i++)
	{
		realCategoryVolumes[i] = soundCategoryVolumes[i] * masterVolume;
	}
}

setRealVolumes();

fhAudioListenerSetPosition(0, 0, 0);
fhAudioListenerSetOrientation(0, -1, 0, 0, 0, -1);