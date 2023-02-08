on delReminder(reminderName)
	set theName to reminderName
	tell application "Reminders"
		set the_list to list "Reminders"
		set the_reminders to reminders in the_list
		set found to false
		repeat with the_reminder in the_reminders
			if name of the_reminder is reminderName then
				delete the_reminder
				set found to true
				log "Deleted reminder: " & theName & "."
				return
			end if
		end repeat
		
		if found is false then
			log "Error: Could not find a reminder with the name '" & reminderName & "'."
		end if
	end tell
end delReminder

on run argv
	set theReminder to item 1 of argv
	
	delReminder(theReminder)
end run