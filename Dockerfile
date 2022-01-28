# Build Environment
FROM node:14.8.0-alpine as react-build
WORKDIR /app
COPY package*.json ./
RUN npm ci --silent
# Have a .dockerignore file ignoring node_modules and build
COPY . ./
RUN npm run build
# Production
# Stage 2 - the production environment
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=react-build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

