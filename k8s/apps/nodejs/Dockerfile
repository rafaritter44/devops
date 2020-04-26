FROM node:12
WORKDIR /usr/local/src/app/
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
ENTRYPOINT [ "npm", "start" ]