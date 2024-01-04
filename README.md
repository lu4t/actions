# actions


este repo tiene un dockerfile básico y un script.

Se ha creado un Actions que tiene un workflow de tipo build. Cada vez que se hace un commit a este repo
se crea automáticamente una nueva imagen que se queda hosteada en ghcr.io como un gh package.
Para ejecutar la última versión de la imagen, sólo hay que ejecutar:

  `docker run ghcr.io/lu4t/actions:main`

Hay que esperar unos segundos tras el commit, para que de tiempo a que haga el build.


Para tirar de esta imagen en un deployment:

1- se hace login al repo privado:
  `docker login tu-repo-privado`

1.1 Copia el archivo de configuración a un lugar seguro:
  `cp ~/.docker/config.json /ruta/segura/config.json`

2- el fichero de configuración de #1 se guarda en un secret:
  `kubectl create secret generic <nombre-secreto> --from-file=.dockerconfigjson=/ruta/segura/config.json --type=kubernetes.io/dockerconfigjson`

3- se instancia el secret desde los deployments con la key: imagePullSecrets:

apiVersion: v1
kind: Pod
metadata:
  name: mi-pod
spec:
  containers:
  - name: mi-contenedor
    image: <tu-repo-privado>/mi-imagen:tag
  imagePullSecrets:
  - name: <nombre-secreto>


