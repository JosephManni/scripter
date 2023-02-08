on playSong(songName)
    tell application "Music"
        set theTrack to first track of library playlist 1 whose name is songName
        play theTrack
    end tell
end playSong

on run argv
	set theSong to item 1 of argv

	playSong(theSong)
end run