# Stage 1: Build the React application
FROM node:14 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

# Build the React app with overridden environment variables
ARG REACT_APP_API_URL
ENV REACT_APP_API_URL=$REACT_APP_API_URL

RUN npm run build

# Stage 2: Serve the React application from Nginx
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
