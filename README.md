# actions


este repo tiene un dockerfile básico y un script.

Se ha creado un Actions que tiene un workflow de tipo build. Cada vez que se hace un commit a este repo
se crea automáticamente una nueva imagen que se queda hosteada en ghcr.io como un gh package.
Para ejecutar la última versión de la imagen, sólo hay que ejecutar:

  docker run ghcr.io/lu4t/actions:main

Hay que esperar unos segundos tras el commit, para que de tiempo a que haga el build.
