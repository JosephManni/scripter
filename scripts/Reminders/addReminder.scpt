on addReminder(newReminder)
    set theName to newReminder
	tell application "Reminders"
		set newReminder to make new reminder with properties {name:newReminder}
		tell list "Reminders"
			set reminderList to reminders
			set end of reminderList to newReminder
		end tell
        log "Created new reminder: " & theName & "."
	end tell
end addReminder

on run argv
	set theReminder to item 1 of argv
	
	addReminder(theReminder)
end run