-- Area Converter.applescript
-- Area Converter

--  Created by Rob Cahill on 5/26/09.
--  Copyright 2009 __MyCompanyName__. All rights reserved.

on action theObject
	set a to the contents of text field "a" of window "main"
	set b to the contents of text field "b" of window "main"
	set au to the title of current menu item of popup button "au" of window "main"
	set bu to the title of current menu item of popup button "bu" of window "main"
	if au is equal to "Hectares" then set auv to 1
	if au is equal to "Acres" then set auv to 2.47
	if au is equal to "Manzanas" then set auv to 1.38
	if au is equal to "Tareas" then set auv to 22
	if bu is equal to "Hectares" then set buv to 1
	if bu is equal to "Acres" then set buv to 2.47
	if bu is equal to "Manzanas" then set buv to 1.38
	if bu is equal to "Tareas" then set buv to 22
	if the name of theObject is "a" then
		set b to (a * buv) / auv
		set contents of text field "b" of window "main" to b
	else if the name of theObject is "au" then
		set b to (b * auv) / buv
		set contents of text field "b" of window "main" to b
	else if the name of theObject is "b" then
		set a to (b * auv) / buv
		set contents of text field "a" of window "main" to a
	else if the name of theObject is "bu" then
		set a to (a * buv) / auv
		set contents of text field "a" of window "main" to a
	end if
end action
