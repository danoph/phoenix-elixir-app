# Mac Setup

- Install docker
- Install virtualbox

- Install elixir:
  $ brew install elixir

- Install yarn:
  $ brew install yarn

- Install hex (elixir package manager)
  $ mix local.hex

- Install phoenix:
  $ mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# Initial Repo Setup
- Install Phoenix dependencies (like npm install)
  $ cd api
  $ mix deps.get

- Spin up postgresql docker container
  $ docker-compose up

- Create development database (must have postgresql running)
  $ cd api
  $ mix ecto.create

- Start Phoenix app with:
  $ cd api
  $ mix phx.server

- You can also run your app inside IEx (Interactive Elixir) as:
  $ iex -S mix phx.server

- Run tests with
  $ cd api
  $ mix test

# Kubernetes setup (optional)
- brew install kubectl kubernetes-helm cask/caskroom/minikube

# Daniel Setup Notes (dont follow these):

- Install react create CLI
  $ yarn global add create-react-app

- Created teams endpoint and db stuff (for examples) with:
  $ mix phx.gen.json Teams Team teams name:string size:integer dynamics:integer team_size:integer practices:integer
