Ejercicio 1
======
Discuta los requerimientos y diseñe una solución. Si aplica un patrón de diseño, indique cuál es y justifique su aplicabilidad.

En este caso voy a aplicar el decorator ya que a una de las clases(la del FileOO2) necesito aplicarle capas encima dinámicamente y de forma transparente(sin afectar a otros objetos). Cada capa será representada por un decorador. Habrá un cliente(el FileManager) y los componentes: los decoradores y el fileOO2.
