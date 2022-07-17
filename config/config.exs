# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :contexsample,
  ecto_repos: [Contexsample.Repo]

secret_key_base =
  System.get_env("SECRET_KEY_BASE") || "NmtK9GGA7C88oSZdW8oW73MGNgzufNXSlTYig7krCriszdZBdJezs39ZjFbZ5QFW"

# Configures the endpoint
config :contexsample, ContexSampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: secret_key_base,
  render_errors: [view: ContexSampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Contexsample.PubSub,
  live_view: [signing_salt: "am2/tatn8cjd6Q+A/yZqyA0naK/NVIRb"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
