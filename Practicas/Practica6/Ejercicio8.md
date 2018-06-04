# Ejercicio 8: TweetBase

Considere la clase TweetBase que contiene una lista de tweets, y los siguientes métodos:

```smalltalk
TweetBase>>tweetCountByUser
    "returns a dictionary with the number of tweets per user in this tweet base"
    | result |
    result := Dictionary new.
    tweets do: [ :tweet |
    | user|
    user:= tweet user.
    result at: user ifAbsentPut: 1.
    result at: user put: (result at: user) + 1 ].
    ^ result

TweetBase>>tweetCountByUserGender
    "Count the occurrences of female and male users"
    | result |
    result := Dictionary new.
    tweets do: [ :tweet |
    | g |
    g := tweet user gender.
    result at: g ifAbsentPut: 1.
    result at: g put: (result at: g) + 1 ].
    ^ result
```

Tareas:
1. Indique qué problemas (malos olores) encuentra (puede usar sus propias palabras).
2. Escriba un Test Case antes de refactorizar para #tweetCountByUser
3. Refactorice ambos métodos.

#

1. En principio, son métodos largos que cumplen más de un objetivo. Por ejemplo, el bloque dentro del do podría desarmarse en otro método.
2. 
