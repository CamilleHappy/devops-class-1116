FROM node:22.11 AS builder

WORKDIR /srv/app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

#----

FROM nginx:1.27 

COPY --from=builder /srv/app/dist /usr/share/nginx/html
