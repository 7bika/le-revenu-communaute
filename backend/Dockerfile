FROM node:22-alpine
WORKDIR /opt/app
ENV NODE_ENV=production

COPY package.json package-lock.json ./
RUN npm ci --omit=dev --no-audit --no-fund && npm cache clean --force
# TypeScript est nécessaire à la compilation du serveur Strapi
RUN npm install --no-save --no-audit --no-fund typescript@5

COPY . .
RUN npm run build

EXPOSE 1337
CMD ["npm", "run", "start"]
