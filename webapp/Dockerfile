FROM node:8.11.1

ENV NPM_CONFIG_LOGLEVEL warn
ARG app_env
ENV APP_ENV $app_env

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN yarn install

#RUN mkdir -p node_modules/node-sass/vendor/linux-x64-57
#RUN curl -L https://github.com/sass/node-sass/releases/download/v4.8.3/linux-x64-57_binding.node -o node_modules/node-sass/vendor/linux-x64-57/binding.node

#RUN mkdir -p /usr/src/app/node_modules/node-sass-chokidar/node_modules/node-sass/vendor/linux-x64-57
#RUN curl -L https://github.com/sass/node-sass/releases/download/v4.8.3/linux-x64-57_binding.node -o /usr/src/app/node_modules/node-sass-chokidar/node_modules/node-sass/vendor/linux-x64-57/binding.node

CMD ["yarn", "start"]
