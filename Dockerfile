# Usar la imagen de Node.js LTS basada en Alpine Linux
FROM node:lts-alpine as build-stage

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar los archivos de la aplicación al contenedor
COPY package*.json ./
COPY . .

# Instalar las dependencias del proyecto
RUN npm install

# Compilar la aplicación Vue.js
RUN npm run build

# Usar la imagen de Nginx basada en Alpine Linux
FROM nginx:alpine

# Copiar los archivos compilados de Vue.js al servidor web de Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Exponer el puerto 80 para acceder a la aplicación
EXPOSE 80

# Comando para iniciar el servidor Nginx
CMD ["nginx", "-g", "daemon off;"]
