Inciso 3
======
Cree en un Playground un objeto para cada uno de los ejemplos citados anteriormente.


* nombre - extensión
```smalltalk
|fileOO2|
fileOO2:= FileOO2 newWithNombre: 'coso' extension: 'coso1' fecha_creacion: Date today fecha_modificacion: Date yesterday permisos: 'coso3' tamaño: '67'.
fileOO2:= Nombre newNext: fileOO2.
fileOO2:= Extension newNext: fileOO2.
fileOO2 prettyPrint
```
* nombre - extensión - fecha de creación
```smalltalk
|fileOO2|
fileOO2:= FileOO2 newWithNombre: 'coso' extension: 'coso1' fecha_creacion: Date today fecha_modificacion: Date yesterday permisos: 'coso3' tamaño: '67'.
fileOO2:= Nombre newNext: fileOO2.
fileOO2:= Extension newNext: fileOO2.
fileOO2:= FechaCreacion newNext: fileOO2.
fileOO2 prettyPrint
```
* permisos - nombre - extensión - tamaño
```smalltalk
|fileOO2|
fileOO2:= FileOO2 newWithNombre: 'coso' extension: 'coso1' fecha_creacion: Date today fecha_modificacion: Date yesterday permisos: 'coso3' tamaño: '67'.
fileOO2:= Permisos newNext: fileOO2.
fileOO2:= Nombre newNext: fileOO2.
fileOO2:= Extension newNext: fileOO2.
fileOO2:= Tamaño newNext: fileOO2.
fileOO2 prettyPrint
```
