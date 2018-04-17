use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api, ApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
# change these to env variables for docker-compose
config :api, Api.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "evergreen_db_user",
  password: "db_password",
  database: "evergreen_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
