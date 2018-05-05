instance creation
newWithNombre: aName extension: anExtension fecha_creacion: aCreationDate fecha_modificacion: aModDate permisos: somePermits tamaño: aSize
	"I know how to create a file"

	^(self new) initializeNombre: aName extension: anExtension fecha_creacion: aCreationDate fecha_modificacion: aModDate permisos: somePermits tamaño: aSize.