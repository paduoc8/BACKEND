# 1. Imagen base (siempre debe ser la primera instrucción)
FROM node:18-alpine

# 2. Directorio de trabajo
WORKDIR /app

# 3. Copiar dependencias e instalarlas
COPY package*.json ./
RUN npm ci --ignore-scripts

# 4. Copiar código de la aplicación
COPY src/ ./src/
COPY sql/ ./sql/
COPY uploads/ ./uploads/

# 5. Crear directorio de subidas y dar permisos al usuario node
RUN mkdir -p uploads/contracts && chown -R node:node /app

# 6. Cambiar a usuario no-root (satisface la regla de SonarQube)
USER node

# 7. Puerto expuesto
EXPOSE 3000

# 8. Comando para iniciar
CMD ["node", "src/app.js"]