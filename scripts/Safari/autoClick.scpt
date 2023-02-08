#the click at {x,y} are the xy coordinates of the point you 
#want to click repeatedly on your screen
#The easiest way to find the coordinates is using CMD+SHIFT+4

on autoClick(x,y)
	delay 5     #slight delay to select Safari screen before clicking starts
	repeat 100 times
		tell application "System Events"
			tell application process "Safari"
				click (click at {x, y})
			end tell
		end tell
	end repeat
end autoClick

on run argv
	set x to item 1 of argv
	set y to item 2 of argv

	autoClick(x,y)
end run