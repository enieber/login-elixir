# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth,
  ecto_repos: [Auth.Repo]

# Configures the endpoint
config :auth, Auth.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9p6TqasTLoyPRt1nYo0wFBoX82uTjtNoZdCacdrdCkbZKxgrMEjKcn5yjiXcmgHl",
  render_errors: [view: Auth.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Auth.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
