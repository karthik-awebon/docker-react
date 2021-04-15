FROM node:alpine as builder
WORKDIR /usr/app
COPY ./package.json /usr/app

RUN npm config set registry http://registry.npmjs.org/
RUN npm i

COPY ./ /usr/app

CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html