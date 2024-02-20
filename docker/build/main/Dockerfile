FROM node:14-alpine

LABEL maintainer="Dedy Irawan <dedy.irawan.inc@gmail.com>"

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY css css
COPY fonts fonts
COPY img img
COPY js js
COPY portfolio portfolio
COPY scss scss
COPY static static
COPY *.html ./
COPY *.js ./
COPY *.json ./

RUN apk add --no-cache --virtual native-deps
RUN apk add --no-cache --virtual curl g++ gcc libgcc libstdc++ linux-headers make py-pip yarn

RUN npm config set unsafe-perm true \
  && npm install --quiet gulp node-gyp -g \
  && npm install --quiet \
  && npm config set unsafe-perm false

RUN apk add --no-cache tzdata
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN npm rebuild node-sass

RUN gulp --version

EXPOSE 3000 3001

CMD ["gulp"]
