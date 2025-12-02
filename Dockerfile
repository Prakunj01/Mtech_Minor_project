# Stage 1: build
FROM node:18 AS build
WORKDIR /app
# Copy only package files first to utilize cache
COPY react-src/package*.json ./Portfolio/
WORKDIR /app/react-src
RUN npm ci --silent
COPY react-src/ .
RUN npm run build

# Stage 2: minimal nginx image for local test (optional)
FROM nginx:alpine AS release
COPY --from=build /app/react-src/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
