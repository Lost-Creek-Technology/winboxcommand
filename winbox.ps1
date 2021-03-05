#this isn't really a program in and of itself, I wrote this to take winbox:\\ URLs and open Winbox with the arguments provided.
#First off, I am pretty certain there is no universe where a web browser will not just send a blob of text like this: "winbox:%5C%5CrouterIP:10000?user?password"
#So the hopefullness of creating 3 paramaters at the beggining is kinda foolish, but if you want to call the program it makes it kinda nice to not have to use "?"s everywhere.

#When you are writing your URL to open this, you will need to put a "?" between each of the objects IP/Host, Username and Password. If you use "?"s in your passwords, it "may" work out, but I don't care to test.
#IPv6 addresses probably will work as well, but then again I have not tested that at all.
#You will also need to create a registry key 
#[HKEY_CLASSES_ROOT\winbox]
#"URL Protocol"=""

#[HKEY_CLASSES_ROOT\winbox\shell]

#[HKEY_CLASSES_ROOT\winbox\shell\open]

#[HKEY_CLASSES_ROOT\winbox\shell\open\command]
#@="\"C:\\Users\\Roggen\\Downloads\\winboxcommand.exe\" \"%1\""
#
#Of course replace "Roggen" with your user profile name 
#
#You will also need to have your winbox.exe file in your "Downloads" folder. I don't know enough Windows scripting to make this more flexible. Not sorry.

#There is absolutly no security in this program... I would bet there's at least 12 different issues with what I am doing... Practice safe link clicking.

param ($address, $username, $password)


$data = $address.Substring(0,9)
$i = $address.IndexOf("?")

#Here we take the URL and try to parse it into IP address/HostName, Username and password
#It might be smart to add in the ability to handle situations where there isn't a password passed. 
#Probably would be better to do something along the lines of hostname:port?usr=username?pass=password... I dunno.
#I could probably optimize this a lot more, but this is alright for my needs. 
if ($data -eq "winbox:\\") #Firefox and normal Windows, not Edge.
{
	#extract the DNS name/IP Address
	$data = $address
	$address = $data.Substring(9,$i - 9)
	$j = $address.IndexOf(":")
	if ($j -eq $null)
	{
	}
	else
	{
		
		$address = $address.Substring(0, $j)
	} 
	
	
	#get username
	$j = $data.length 
	$i = $i + 1
	$data = $data.Substring($i, $j - $i)
	$i = $data.IndexOf("?")
	$username = $data.Substring(0, $i)
	
	$i = $data.IndexOf("?")
	$i = $i + 1
	$j = $data.length
	$password = $data.Substring($i, $j - $i)
}

if ($data -eq "winbox:%5") #Chrome and Edge, maybe a few other browsers. 
{
	#extract the DNS name/IP Address
	$data = $address
	$address = $data.Substring(13, $i - 13)
	$j = $address.IndexOf(":")
	if ($j -eq $null)
	{
	}
	else
	{
		
		$address = $address.Substring(0, $j)
	} 
	
	
	#get username
	$j = $data.length 
	$i = $i + 1
	$data = $data.Substring($i, $j - $i)
	$i = $data.IndexOf("?")
	$username = $data.Substring(0, $i)
	
	#Get Password
	$i = $data.IndexOf("?")
	$i = $i + 1
	$j = $data.length
	$password = $data.Substring($i, $j - $i)
}
$wtf = "$Home\Downloads\winbox.exe"
Start-Process -FilePath $wtf -ArgumentList "$address", "$username", "$password"
