#Dockerfile for production
#first container to build
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#2nd container to use nginx and copy build to the nginx folder
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html