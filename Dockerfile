# Building Project
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Creating Production Image
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html