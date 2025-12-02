# Stage 1: Build React App
FROM node:18 AS build
WORKDIR /app

# Copy package.json and package-lock.json from Portfolio folder
COPY Portfolio/package*.json ./Portfolio/

# Install dependencies
WORKDIR /app/Portfolio
RUN npm install --silent

# Copy all React source code
COPY Portfolio/ .

# Build React app
RUN npm run build

# Stage 2: Serve using Nginx (optional / for local test)
FROM nginx:alpine
COPY --from=build /app/Portfolio/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
