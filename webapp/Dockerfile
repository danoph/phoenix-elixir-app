FROM node:latest

ENV NPM_CONFIG_LOGLEVEL warn
ARG app_env
ENV APP_ENV $app_env

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN yarn install

CMD ["yarn", "start"]
