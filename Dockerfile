# Multi steps build
# as - to create a tag for this phase and all phases
# underneath it it's all going to be referred to as the builder face and the sole purpose of
#this phase is to install dependencies and build their application.
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

# copy builder      folder that I want copy    to this folder
COPY --from=builder /app/build                 usr/share/nginx/html