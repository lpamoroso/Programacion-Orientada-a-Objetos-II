sensing
humidity
 thisContext sender receiver class=Broker ifFalse:[self error: 'Only a Broker can talk to a Station' ].
 ^ random nextInt:100