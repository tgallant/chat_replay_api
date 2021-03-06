# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chat_replay_api,
  ecto_repos: [ChatReplayApi.Repo]

# Configures the endpoint
config :chat_replay_api, ChatReplayApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lyQ/Wut+aJH/iBUv0+dsd5ZgRiMxuqF8TdthmdcIa89wM44xDUkSb9cPKtCvNzTW",
  render_errors: [view: ChatReplayApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ChatReplayApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
