# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :phoenix_demo, PhoenixDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "j+JnTRs3ZXP2vdSvhq3pcBmUwjnGygBKU7voVpVpRG2HQbOQ7Hi3EI0rmXIqHW2X",
  render_errors: [view: PhoenixDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixDemo.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "is this secretive enough?"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
