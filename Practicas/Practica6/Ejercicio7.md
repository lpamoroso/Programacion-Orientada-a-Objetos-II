# Ejercicio 7: Algo huele mal

Indique en los siguientes ejemplos la presencia de malos olores.

1. El diagrama de la Figura 1 muestra que existen dos métodos en diferentes subclases que realizan algunos pasos similares en el mismo orden, aunque los pasos difieren entre si. Aplicando lo que ya conoce de patrones, ¿cómo puede mejorar el diseño y el código?
+ Realice el nuevo diagrama de clases.
+ Mediante el código que se entrega en el material adicional de la práctica:
    - Verifique que el código original, que responde al diagrama de clases de la Figura 1, pasa exitosamente los test cases.
    - Haga las modificaciones que se piden al diseño.
    - Implemente los cambios al código de las clases Inmueble, ViviendaUnica y CasaFinDeSemana.
    - Verifique que la nueva implementación también pasa exitosamente los tests.

2. La clase Cliente tiene el siguiente protocolo público. ¿Cómo puede mejorarlo?
+ #lmtCrdt devuelve el límite de crédito del cliente.
+ #mtFcE: unaFecha y: otraFecha devuelve el monto facturado al cliente desde unaFecha hasta otraFecha
+ #mtCbE: unaFecha y: aux devuelve el monto cobrado al cliente desde unaFecha hasta otraFecha3.
3. Al revisar el siguiente diseño inicial (Figura 2), se decidió realizar un cambio para evitar lo que se consideraba un mal olor. El diseño modificado se muestra en la Figura 3. Indique qué tipo de cambio se realizó y si lo considera apropiado. Justifique su respuesta.
4. Analice el código que se muestra a continuación. Indique qué defectos encuentra y cómo pueden corregirse.
```smalltalk
imprimirValores
    |totalEdades promedioEdades totalSalarios|
    totalEdades := 0.
    totalSalarios := 0.
    personal do: [ :empleado | totalEdades := totalEdades + empleado edad. totalSalarios := totalSalarios + empleado salario].
    promedioEdades := totalEdades / personal size.
    Transcript show: 'Edad promedio: ' ,
    promedioEdades printString ,
    ' - Total de salarios: ' ,
    totalSalarios printString.
```

#

2.
+ #lmtCrdt -> En este caso, cambiaría el mensaje a limiteCredito.
+ #mtFcE: unaFecha y: otraFecha -> En este caso, cambiaria el mensaje a montoFacturadoEntre: unaFecha y: otraFecha.
+ #mtCbE: unaFecha y: aux -> En este caso, cambiaria el mensaje a montoCobradoEntre: unaFecha y: otraFecha.

3. La idea fue que en lugar de enviar el proyecto completo a la persona y ver si la persona estaba incluida en ese proyecto, hacer que el proyecto entienda un mensaje para ver si la persona estaba incluida en el. Es un cambio valido ya que previene la envidia de atributos. En este caso lo que ocurre es que dado que la persona no conoce el proyecto, cada vez que realice una operacion hay que enviarselo y la persona estaria realizando operaciones que deberia realizar el proyecto. Por otro lado, el proyecto conoce todos sus participantes. Es mas simple hacer que la persona le mande un mensaje al proyecto, incluyendose como parametro, para ver si esta incluida. Lo que ocurre en este caso es que si bien el proyecto usa la persona, la usa como referencia, no para realizar operaciones.

4. En primera instancia, dividiría lo que hace el do. Esto lo realizaría con un Substitute Algorithm.
```smalltalk
imprimirValores
    |totalEdades promedioEdades totalSalarios|
    totalEdades := 0.
    totalSalarios := 0.
    personal do: [ :empleado | totalEdades := totalEdades + empleado edad].
    personal do: [ :empleado | totalSalarios := totalSalarios + empleado salario].
    promedioEdades := totalEdades / personal size.
    Transcript show: 'Edad promedio: ' ,
    promedioEdades printString ,
    ' - Total de salarios: ' ,
    totalSalarios printString.
```
Como proximo paso, debería extraer una de las funcionalidades que realiza inprimirValores: la de calcular el totalEdades. Esto lo voy a realizaría con un extract method.
```smalltalk
totalEdades
    |promedioEdades|
    totalEdades := 0.
    personal do: [ :empleado | totalEdades := totalEdades + empleado edad].
    ^totalEdades
imprimirValores
    |totalSalarios promedioEdades|
    totalSalarios := 0.
    personal do: [ :empleado | totalSalarios := totalSalarios + empleado salario].
    promedioEdades := self totalEdades / personal size.
    Transcript show: 'Edad promedio: ' ,
    promedioEdades printString,
    ' - Total de salarios: ' ,
    totalSalarios printString.
```
El proximo paso sería extraer otra de las funcionalidades: promedioEdades. En este caso, usaría un replace temp with query.
```smalltalk
totalEdades
    |promedioEdades|
    totalEdades := 0.
    personal do: [ :empleado | totalEdades := totalEdades + empleado edad].
    ^totalEdades
promedioEdades
     |promedioEdades|
     promedioEdades := self totalEdades / personal size.
     ^promedioEdades
imprimirValores
    |totalSalarios|
    totalSalarios := 0.
    personal do: [ :empleado | totalSalarios := totalSalarios + empleado salario].
    Transcript show: 'Edad promedio: ' ,
    self promedioEdades ,
    ' - Total de salarios: ' ,
    totalSalarios printString.
```
Lo siguiente sería extraer la otra funcionalidad restante: totalSalarios. Al igual que con totalEdades, usaría un replace temp with query.
```smalltalk
totalSalarios
    |totalSalarios|
    totalSalarios := 0.
    personal do: [ :empleado | totalSalarios := totalSalarios + empleado salario].
    ^totalSalarios
totalEdades
    |promedioEdades|
    totalEdades := 0.
    personal do: [ :empleado | totalEdades := totalEdades + empleado edad].
    ^totalEdades
promedioEdades
     |promedioEdades|
     promedioEdades := self totalEdades / personal size.
     ^promedioEdades
imprimirValores
    Transcript show: 'Edad promedio: ' ,
    self promedioEdades ,
    ' - Total de salarios: ' ,
    self totalSalarios.
```
Ya en este momento, imprimirValores esta refactorizado y resta chequear que los metodos que extraje tambien lo estén. Todavía queda un poco más antes de lograrlo. Voy a empezar por el hecho de que se estan usando variables temporales para almacenar resultados, cuando en realidad no es necesario hace uso de éstas. En este caso voy a usar un Replace Loop with Collection Closure Method.
```smalltalk
totalSalarios
    ^personal inject:0 into:[ :empleado :total | total + empleado salario].
totalEdades
    |promedioEdades|
    totalEdades := 0.
    personal do: [ :empleado | totalEdades := totalEdades + empleado edad].
    ^totalEdades
promedioEdades
     |promedioEdades|
     promedioEdades := self totalEdades / personal size.
     ^promedioEdades
imprimirValores
    Transcript show: 'Edad promedio: ' ,
    self promedioEdades ,
    ' - Total de salarios: ' ,
    self totalSalarios.
```
Todavia falta realizar lo mismo que en el anterior caso con totalEdades. Se usa de igual forma un Replace Loop with Collection Closure Method.
```smalltalk
totalSalarios
    ^personal inject:0 into:[ :empleado :total | total + empleado salario].
totalEdades
    ^personal inject:0 into:[ :empleado :total | total + empleado edad].
promedioEdades
     |promedioEdades|
     promedioEdades := self totalEdades / personal size.
     ^promedioEdades
imprimirValores
    Transcript show: 'Edad promedio: ' ,
    self promedioEdades ,
    ' - Total de salarios: ' ,
    self totalSalarios.
```
Por último, puede simplificarse la lógica de promedioEdades y también eliminar la variable temporal. En este caso se aplica un Inline Temp.
```smalltalk
totalSalarios
    ^personal inject:0 into:[ :empleado :total | total + empleado salario].
totalEdades
    ^personal inject:0 into:[ :empleado :total | total + empleado edad].
promedioEdades
     ^self totalEdades / personal size.
imprimirValores
    Transcript show: 'Edad promedio: ' ,
    self promedioEdades ,
    ' - Total de salarios: ' ,
    self totalSalarios.
```
