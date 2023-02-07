tell application "Messages"
	activate
	set targetBuddyPhone to "Phone_Number"
	set targetMessage to "Your message here"
	set targetService to 1st account whose service type = iMessage     
    #note if targetBuddy does not use iMessage, set field to SMS
	set targetBuddy to participant targetBuddyPhone of targetService
	repeat 175 times
		send targetMessage to targetBuddy
		delay 1
		#adding the delay 1 will cause phone to ring after every message is delivered, 
		#rather than just ringing once and showing a ton of messages :)
	end repeat
end tell

#Msg & data rates may apply, not an issue if targetBuddy uses iMessage