# winboxcommand
A Power Shell Script to launch Winbox.exe from a URL

A huge thanks to the guys over at https://github.com/MScholtes/Win-PS2EXE who's program made this whole project doable in one day. I know enough VB.NET to get myself into trouble, but I don't think I would have written this whole program if I couldn't have done it in PowerShell. 

You will need to use PS2EXE to compile the powershell script into a .exe which is allowed to take URLs from windows. (PowerShell scripts are not for some security reason)

I will be supplying the .exe file it'self as well as a registry key you can import and edit for yourself. Maybe if I get the gumption up someday I will figure out how to edit the registry from a powershell script then you can just call winboxcommand.exe with like -setup and it will set itself up. That would be slick.

Another requirement: winboxcommand.exe and winbox.ps1 needs to be in the same directory as winbox.exe, probably would be good to setup a configuration deal to let you put it wherever and winbox wherever... 

You will also need to edit the winboxcommand.reg file, the last line is "@="\"C:\\Users\\yourusernamehere\\Downloads\\winboxcommand.exe\" \"%1\""" 
You will want to change the directory to where your winboxcommand.exe file is located. 
