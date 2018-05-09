as yet unclassified
retrieveLineStartingWith: aString
	| stream |
	stream := filename asFileReference readStream.
	[ stream atEnd ]
		whileFalse: [ | header line |
			line := stream nextLine.
			header := line first: 10.
			(header findString: aString) = 1
				ifTrue: [ stream close. 
					^ line ] ].
	stream close.
	^ nil