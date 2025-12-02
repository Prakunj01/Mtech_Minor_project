# Stage 1: Build React App using Yarn
FROM node:16 AS build

WORKDIR /app
COPY . .

WORKDIR /app/Portfolio

# Install deps using Yarn (most stable)
RUN yarn install --silent

# Build React App
RUN yarn build

# Stage 2: Serve using Nginx
FROM nginx:alpine
COPY --from=build /app/Portfolio/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
