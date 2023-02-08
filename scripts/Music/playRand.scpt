on playSong(songLetter)
    tell application "Music"
        set theTracks to tracks of library playlist 1 whose name starts with songLetter
        set randomTrack to item (random number from 1 to (count of theTracks)) of theTracks
        play randomTrack
    end tell
end playSong

on run argv
	set theLetter to item 1 of argv

	playSong(theLetter)
end run