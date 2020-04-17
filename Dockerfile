FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
# build in react

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# front-end static


# docker build .
# docker run -p 8080:80 CONTAINER_ID