# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
FROM node:16 as build-stage
  WORKDIR /app
  COPY ./ /app/
  RUN npm install
  RUN npm run build
# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM socialengine/nginx-spa:latest
  COPY --from=build-stage /app/build/ /app
