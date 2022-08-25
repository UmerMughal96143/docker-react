FROM node:16.17.0-alpine AS builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.23.1
COPY --from=builder '/app/build/' '/usr/share/nginx/html'