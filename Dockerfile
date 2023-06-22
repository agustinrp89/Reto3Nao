# Define la imagen base
FROM node:latest

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos de la aplicación al contenedor
COPY . /app

# Instala las dependencias del proyecto
RUN npm install

# Expone el puerto que utilizará la aplicación (si es necesario)
# EXPOSE 3000

# Define el comando por defecto para ejecutar la aplicación
CMD ["npm", "run", "dev"]
