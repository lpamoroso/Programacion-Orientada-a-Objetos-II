Inciso 1
======
Diseñe una solución aplicando un patrón y justifique la elección del mismo. Indique qué parte del enunciado coincide con la aplicabilidad del patrón.

En este caso yo aplicaría también un proxy, mas específicamente uno virtual, ya que la idea es crear objetos costosos por encargo. Hay una parte del ejercicio que dice "Ud. debe aplicar un patrón para poder cargar en memoria los usuarios en la medida en que éstos se necesiten.". Yo lo que entiendo con eso es que necesito un patrón para cargar usuarios en la medida en que se vayan necesitando, es decir, bajo demanda. Además, un usuario, en este caso, es un recurso costoso en sí mismo para mantener en memoria, por lo que hay que mantener la menor cantidad posible.