#takes range or all
on getReminders(theRange)

	set my_reminders to {}
	
	tell application "Reminders"
	
		set the_list to list "Reminders"
		#or other list if you have more than one
		set the_reminders to (reminders in the_list whose completed is false)
		#could also be changed to show completed
		
		if theRange is equal to "all" then
			#load reminders
			repeat with the_reminder in the_reminders
				set end of my_reminders to name of the_reminder
			end repeat
			
			repeat with the_reminder in the_reminders
				set theIncomplete to name of the_reminder
				log theIncomplete & return
			end repeat
			
		else
			set {startIndex, endIndex} to words of theRange
			set startIndex to startIndex as integer
			set endIndex to endIndex as integer
			
			#load reminders
			repeat with the_reminder in the_reminders
				set end of my_reminders to name of the_reminder
			end repeat
			#check range
			if (startIndex > (count of the_reminders)) or (endIndex > (count of the_reminders)) then
				log "Error: the range provided is outside the number of reminders."
				return
			end if
			
			set range_reminders to items startIndex thru endIndex of my_reminders
			
			repeat with the_reminder in range_reminders
				set theIncomplete to the_reminder
				log theIncomplete & return
			end repeat
		end if
		
	end tell
end getReminders

on run argv
	set theRange to item 1 of argv
	
	getReminders(theRange)
end run
