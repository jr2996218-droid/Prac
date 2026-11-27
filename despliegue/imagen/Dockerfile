FROM node:20-alpine

WORKDIR /app
COPY fuente/servicio/package*.json ./
RUN npm install
COPY fuente/servicio/ .

CMD ["node", "iniciar.js"]
