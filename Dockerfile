FROM node:alpine
WORKDIR /usr/app
COPY ./package.json /usr/app

RUN npm config set registry http://registry.npmjs.org/
RUN npm i

COPY ./ /usr/app

CMD ["npm", "run", "build"]

FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html