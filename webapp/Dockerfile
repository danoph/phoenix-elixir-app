FROM node:carbon

COPY package.json yarn.lock /app/
RUN cd /app \
      && yarn install --pure-lockfile
      # && npm rebuild node-sass --force

RUN curl -L https://github.com/sass/node-sass/releases/download/v4.8.3/linux-x64-57_binding.node -o /app/node_modules/node-sass/vendor/linux-x64-57/binding.node

COPY . /app
WORKDIR /app

CMD ["yarn", "start"]
