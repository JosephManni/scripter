tell application "Messages"
	activate
	set targetBuddyPhone to "Phone_Number"
	set targetMessage to "Your message here"
	set targetService to 1st account whose service type = iMessage
	set targetBuddy to participant targetBuddyPhone of targetService
	send targetMessage to targetBuddy
end tell