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

# Exponer el puerto 4321
EXPOSE 4321

# Comando para servir la aplicación
CMD ["pnpm", "run", "preview", "--host", "0.0.0.0"]
