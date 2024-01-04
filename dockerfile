# Utiliza una imagen base liviana de alpine
FROM alpine:latest

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el script al directorio de trabajo del contenedor
COPY saludar.sh .

# Da permisos de ejecución al script
RUN chmod +x saludar.sh

# Ejecuta el script cuando se inicie el contenedor
CMD ["./saludar.sh"]
