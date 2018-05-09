initialization
initializeUsername: aUsername screenName: aScreenName
	"Initialize proxy, username and screenName"
	
	self username: aUsername; screenName: aScreenName.
	proxy := Proxy new.