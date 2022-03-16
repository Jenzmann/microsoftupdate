$pypath = "D:\Program Files\VideoLAN\VLC\vlc.exe"
$scriptpath = '--fullscreen "D:\1. DATA\DOKUMENTE\PROGRAMMIEREN\RemiRR\playvid\video.mp4"'

$taskAction = New-ScheduledTaskAction `
	-Execute $pypath `
	-Argument $scriptpath

$taskTrigger = New-ScheduledTaskTrigger -Once -At "04/08/2022 9:00:00 AM"

Register-ScheduledTask -TaskName "Q2Surprise" -Action $taskAction -Trigger $taskTrigger