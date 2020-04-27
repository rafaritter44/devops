FROM node:12 AS builder
WORKDIR /usr/local/src/app/
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.17.10
COPY --from=builder /usr/local/src/app/dist/angular/ /usr/share/nginx/html/
