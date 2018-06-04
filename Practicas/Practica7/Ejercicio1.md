# Ejercicio 1: Refactoring

Considere la implementación de las clases *Figure* provista por la cátedra. Realice las siguientes tareas:
+ Revise el código y determine qué tipos de figura implementa la clase *Figure*.
+ Ejecute los test cases y analice su código.
+ Analice cómo extender la implementación para dar soporte a dos nuevos requerimientos:
    1. Un nuevo tipo de figura: el paralelogramo.
    2. El cálculo del perímetro para todas las figuras.
+ Discuta con un ayudante:
    1. ¿Es posible realizar, de manera sencilla, las extensiones propuestas?
    2. ¿Cómo se puede mejorar el código y el diseño?
    3. Considerando los nuevos requerimientos, discuta en qué orden realizará las siguientes tareas(puede repetir alguna de ellas): refactoring, diseño final al que quiere llegar, testing, refactoring de los test cases.
+ Implemente en Smalltalk los requerimientos planteados y todas aquellas modificaciones que considere necesarias(incluyendo el mantenimiento y extensión de los test cases).

#

1. El código permite crear círculos, triangulos equilateros y cuadrados.
2. PREGUNTAR DÓNDE ESTÁ EL CÓDIGO PROVISTO Y LOS TEST CASES.
3.
    1. La idea sería crear una nueva clase Paralelogramo que heredara de figura y reimplementara los mensajes de ésta según sea necesario y que tuviera sus atributos correspondientes.
    2. PREGUNTAR DÓNDE ESTÁ EL CÓDIGO PROVISTO Y LOS TEST CASES.
    3. PREGUNTAR DÓNDE ESTÁ EL CÓDIGO PROVISTO Y LOS TEST CASES.
    4. Yo haría un refactoring para integrar la nueva funcionalidad, luego un refactoring de los test en caso de que hubiera que integrar alguno de los test con la funcionalidad añadida, entonces aplicaría el testing(ejecución de los test) y por último el diseño final al que quiere llegar. Lo más probable es que se repitan algunas de las etapas antes de llegar al diseño final.
