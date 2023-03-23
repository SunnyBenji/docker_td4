FROM node:19 as build

WORKDIR /app

COPY package.json ./

RUN npm i

COPY . .

RUN npm run build

FROM nginx:1.23-alpine

COPY --from=build /app/build /usr/share/nginx/html