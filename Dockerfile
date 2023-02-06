FROM node:19.6-alpine3.16 as builder
WORKDIR './app'
COPY ./package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html