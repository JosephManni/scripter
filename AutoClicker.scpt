delay 3     #slight delay to move to Safari screen
repeat 190 times
	tell application "System Events"
		tell application process "Safari"
			click (click at {468, 567})
            #easiest way to find is CMD+SHIFT+4
		end tell
	end tell
end repeat