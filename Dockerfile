# Usar Node.js como base
FROM node:20-alpine

# Instalar pnpm
RUN npm install -g pnpm

WORKDIR /app

# Copiar archivos de dependencias
COPY package.json pnpm-lock.yaml ./

# Instalar dependencias
RUN pnpm install --frozen-lockfile

# Copiar el resto del código
COPY . .

# Construir la aplicación
RUN pnpm run build

# Instalar serve globalmente
RUN npm install -g serve

# Exponer el puerto 4321
EXPOSE 4321

# Servir los archivos estáticos desde dist/
CMD ["serve", "dist", "-l", "4321"]
