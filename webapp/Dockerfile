FROM node:carbon

COPY package.json yarn.lock /app/
RUN cd /app \
    && yarn install --pure-lockfile

COPY . /app
WORKDIR /app

CMD ["yarn", "start"]
