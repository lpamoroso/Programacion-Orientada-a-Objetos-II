instance creation
newWithUsername: aUsername screenName: aScreenName
	"I create a user with username and screenName. Also, I initialize the proxy between user and LineRetriever"

	^(self new) initializeUsername: aUsername screenName: aScreenName 