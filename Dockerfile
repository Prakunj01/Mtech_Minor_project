# Stage 1: Build React App
FROM node:18 AS build
WORKDIR /app

# Copy all files from Portfolio folder
COPY Portfolio ./Portfolio

WORKDIR /app/Portfolio

# Install dependencies
RUN npm install --silent

# Build React app
RUN npm run build

# Stage 2: Serve using Nginx
FROM nginx:alpine

COPY --from=build /app/Portfolio/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
