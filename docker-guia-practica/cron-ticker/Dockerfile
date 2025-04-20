FROM node:19.2-alpine AS deps
#cd /app
WORKDIR /app
#Dest /app
COPY package.json ./
#Install dependencies
RUN npm install

########################################################

FROM node:19.2-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

########################################################

# prod deps
FROM node:19.2-alpine AS prod-deps
#cd /app
WORKDIR /app
#Dest /app
COPY package.json ./
#Install dependencies
RUN npm install --prod

########################################################

# Runner
FROM --platform=$BUILDPLATFORM node:19.2-alpine AS runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks ./tasks
# Comando run de la imagen
CMD ["node", "app.js"]