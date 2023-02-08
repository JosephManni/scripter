#note: you can change Safari to Google Chrome if desired

on openTabs(tabGroup)
	
	if tabGroup = "work" or tabGroup = "Work" then
		tell application "Safari"
			#make new window first
			make new document with properties {URL:"https://www.google.com"}
			open location "https://www.linkedin.com"
			#add other tabs you want here
		end tell
	else if tabGroup = "school" or tabGroup = "School" then
		tell application "Safari"
			#make new window first
			make new document with properties {URL:"https://www.canvas.com"}
			open location "https://www.google.com"
			#add other tabs you want here
		end tell
		#add other tab groups if wanted
	else
		log "Tab group not found"
	end if
end openTabs


on run argv
	set tabGroup to item 1 of argv
	
	openTabs(tabGroup)
end run