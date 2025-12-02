# Stage 1: Build React App
FROM node:16 AS build

WORKDIR /app
COPY . .

WORKDIR /app/Portfolio

# Use npm ci for more stable dependency install
RUN npm ci --legacy-peer-deps --silent

RUN npm run build

# Stage 2: Nginx serve
FROM nginx:alpine
COPY --from=build /app/Portfolio/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
