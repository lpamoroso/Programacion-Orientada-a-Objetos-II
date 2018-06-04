# Ejercicio 2: Analice el código y refactorice

Sean las clases TWUser, TWTweet y TweetBase provistas por la cátedra que forman parte de una aplicación para realizar análisis estadísticos sobre una base de datos de tweets. En la clase TweetBase se encuentran implementados algunos métodos para calcular descriptores estadísticos:
+ deviationTweetsPerUser: calcula la desviación estándar de la cantidad de tweets enviados por usuario.
+ varianceTweetsPerUser: calcula la varianza de la cantidad de tweets enviados por usuario.
En los dos casos, el algoritmo de cálculo tiene los mismos pasos:
1. Agrupar la cantidad de tweets por usuario.
2. Calcular la media de la cantidad de tweets por usuario.
3. Calcular desviación o varianza usando los datos de los pasos 1 y 2.

Tareas:
1. Diseñe e implemente casos de prueba para validar los métodos indicados. En el archivo txt incluído en el material adicional encontrará expresiones que puede emplear como base para armar los casos de prueba.
2. Ejecute los casos de prueba.
3. Analice los bad smells y aplique los refactorings de a uno, utilizando siempre los casos de prueba para comprobar que el funcionamiento del sistema no se ha modificado. Documente cada smell y qué refactoring aplica (anote los nombres).
4. Ejecute los casos de prueba sobre el código refactorizado.

1. Implementaría una clase Tweet que tuviera usuario y texto del tweet; una clase TweetBase que contuviera los mensajes a implementar y tuviera una collección de tweets. Luego invocaría los dos mensajes enviándoles la collección de Tweets.
Tanto para implementar varianceTweetsPerUser y deviationTweetsPerUser es requerida la media. Para implementarla la idea es la cantidad de Tweets/cantidad de usuarios. La cantidad de tweets se resuelve con el mensaje size de la coleccion de tweets. La cantidad de usuarios podria obtenerse haciendo un collect de usuarios y luego pasando el OrderedCollection a set y obteniendo la cantidad de esa coleccion.
Para implementar varianceTweetsPerUser la idea es tener una coleccion con la cantidad de tweets que tiene cada usuario. Para esto es necesario crear un diccionario y recorrer la colleccion de tweets completa, agregando cada usuario al diccionario e incrementando uno o simplemente incrementando uno cada vez que se encuentra un tweet cuando el usuario ya fue agregado. Luego necesitaremos una lista de usuarios que es la que vamos a recorrer para calcular la varianza. Una vez listo el diccionario, con la lista de usuarios hacemos un inject into partiendo de 0 en el cual se para cada usuario sumo al total cantidad de tweets de ese usuario - la media exponenciado al cuadrado. Ese valor lo divido sobre la cantidad de usuarios y obtengo la varianza.
Para implementar deviationTweetsPerUser el calculo es tan simple como hacer raiz cuadrada de la varianza.
Para los test cases podria crear 5 usuarios y que haya 50 tweets repartidos diversamente entre los usuarios y chequear el valor de la varianza y de la desviacion.
