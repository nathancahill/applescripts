-- Calender.applescript
-- Calender

--  Created by Nathan Cahill.
--  Copyright (c) 2003 Nathan Cahill. All rights reserved.

property theMonth : 0
property theYear : 0
property theCal : ""

on will finish launching theObject
	getToday()
	updateCal()
end will finish launching

on clicked theObject
	if the name of theObject is "up" then
		if theMonth is 12 then
			set theYear to theYear + 1
			set theMonth to 1
		else
			set theMonth to theMonth + 1
		end if
		updateCal()
	else if the name of theObject is "down" then
		if theMonth is 1 then
			set theYear to theYear - 1
			set theMonth to 12
		else
			set theMonth to theMonth - 1
		end if
		updateCal()
	else if the name of theObject is "today" then
		getToday()
		updateCal()
	else
		set theDate to ""
		if the title of theObject as string is "" then
			
		else if the first character of the (title of theObject as string) is " " then
			set theDate to (the second character of the (title of theObject as string) & " " & contents of text field "date" of window "main") as string
		else
			set theDate to (the title of theObject as string) & " " & contents of text field "date" of window "main" as string
		end if
		log theDate
	end if
end clicked

on getToday()
	set theYear to (year of (current date) as number)
	set theMonth to (month of (current date) as number)
end getToday

on updateCal()
	set title of every button of window "main" to ""
	set theCal to do shell script (("cal " & theMonth & " " & theYear) as string)
	set p to the first paragraph of theCal
	repeat with c from 1 to length of p
		if character c of p is not space then
			set theDate to characters c thru (length of p) of p as string
			exit repeat
		end if
	end repeat
	set contents of text field "date" of window "main" to theDate
	set b to 0
	set r to 1
	set cl to 1
	set theCal to paragraphs 3 thru (count of paragraphs of theCal) of theCal
	set theCal2 to ""
	repeat with i in theCal
		set theCal2 to theCal2 & i & return
	end repeat
	set theCal to theCal2
	repeat with c in characters of theCal
		if c as string is return then
			set title of button (r & cl as string) of window "main" to t
			set r to r + 1
			if r > 6 then exit repeat
			set cl to 1
			set b to -1
			set t to ""
		end if
		set b to b + 1
		if b is 1 then set t to c
		if b is 2 then set t to t & c as string
		if b is 3 then
			set title of button (r & cl as string) of window "main" to t
			set t to ""
			set b to 0
			set cl to cl + 1
		end if
	end repeat
end updateCal