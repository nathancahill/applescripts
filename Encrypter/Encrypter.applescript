-- Encrypter.applescript
-- Encrypter

--  Created by Nathan Cahill on 8/28/07.
--  Copyright 2007 Nathan Cahill. All rights reserved.

on clicked theObject
	if the name of theObject is "encrypt" then
		encrypt((contents of text view "plain text" of scroll view "plain text" of window "main") as string, contents of text field "pass" of window "main" as string)
	else if the name of theObject is "decrypt" then
		decrypt((contents of text view "code" of scroll view "code" of window "main") as string, contents of text field "pass" of window "main" as string)
	end if
end clicked

on encrypt(theText, pass)
	set n to count of characters of theText
	if n > 734 then
		display dialog "Text to encrypt is too long. The text must have less than 734 characters."
	else
		set contents of text view "code" of scroll view "code" of window "main" to ShellEncryption(theText, pass, true, true)
	end if
end encrypt

on decrypt(theText, pass)
	set contents of text view "plain text" of scroll view "plain text" of window "main" to ShellEncryption(theText, pass, false, true)
end decrypt

on ShellEncryption(str, passwd, doEncode, isBase64)
	set src to "echo " & str's quoted form & " | "
	set src to src & "openssl enc "
	set src to src & "-bf "
	set src to src & "-pass pass:" & passwd's quoted form & " "
	set src to src & "-salt "
	if (doEncode) then
		set src to src & "-e "
	else
		set src to src & "-d "
		
	end if
	if (isBase64) then set src to src & "-a"
	try
		return do shell script src
	on error
		display dialog "Wrong Password" with icon 1 buttons {"Cancel"}
		return ""
	end try
end ShellEncryption