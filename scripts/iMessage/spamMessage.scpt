#takes phone number, message, and message amount, and sends message to phone
#uses command line args for easy use with other scripts
on sendSpam(phone, message, msg_amount)
	tell application "Messages"
		activate
		set targetBuddyPhone to phone
		set targetMessage to message
		set totalmsgs to msg_amount
		set targetService to 1st account whose service type = iMessage     
		#note if targetBuddy does not use iMessage, set field to SMS
		set targetBuddy to participant targetBuddyPhone of targetService
		repeat totalmsgs times
			send targetMessage to targetBuddy
			delay 1
			#adding the delay 1 will cause phone to ring after every message is delivered, 
			#rather than just ringing once and showing a ton of messages :)
		end repeat
	end tell
end sendSpam

on run argv
	set phone to item 1 of argv
	set message to item 2 of argv
	set msg_count to item 3 of argv

	sendSpam(phone, message, msg_count)
end run
