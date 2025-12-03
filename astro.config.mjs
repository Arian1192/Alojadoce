// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  server: {
    port: parseInt(process.env.PORT) || 4321,
    host: true,
  },
  vite: {
    server: {
      allowedHosts: [
        'alojadoce.ariancoro.com',
        '.ariancoro.com', // Esto permitirá todos los subdominios
      ],
    },
  },
});
