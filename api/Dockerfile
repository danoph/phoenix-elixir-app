FROM elixir:alpine

RUN apk update \
    && mix local.rebar --force \
    && mix local.hex --force

# install mix and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# configure work directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install dependencies
COPY mix.* /usr/src/app/
COPY config /usr/src/app/
RUN mix do deps.get, deps.compile

CMD ["mix", "phx.server"]
