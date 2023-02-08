#takes phone number and message, and sends message to phone
#uses command line args for easy use with other scripts
on sendText(phone, message)
	tell application "Messages"
		activate
		set targetBuddyPhone to phone
		set targetMessage to message
		set targetService to 1st account whose service type = iMessage
		set targetBuddy to participant targetBuddyPhone of targetService
		send targetMessage to targetBuddy
	end tell
end sendText

on run argv
	set phone to item 1 of argv
	set message to item 2 of argv
	
	sendText(phone, message)
end run