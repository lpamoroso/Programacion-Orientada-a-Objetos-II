instance creation
newNext: anObject
	"I know how to create an specific decorator pointing to another decorator or file."

	^(self new) initializeNext: anObject.