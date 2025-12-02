# Stage 1: Build React App
FROM node:18 AS build

# Set working directory
WORKDIR /app

# Copy full repo into container
COPY . .

# Move into Portfolio folder (your React project)
WORKDIR /app/Portfolio

# Install deps
RUN npm install --legacy-peer-deps --silent

# Build React App
RUN npm run build

# Stage 2: Nginx Serve Build Output
FROM nginx:alpine
COPY --from=build /app/Portfolio/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
