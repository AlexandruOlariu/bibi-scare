FROM node:alpine AS build
WORKDIR /app
COPY . .
# Serve Application using Nginx Server
FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/ /usr/share/nginx/html
EXPOSE 80