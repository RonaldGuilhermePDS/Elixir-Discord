import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_discord, ElixirDiscordWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "26pMEKgngVIZdrqBIJslmnztwteOA1DNJPoV3L04Kef/xV3OX+a48fN7VoFRxy/q",
  server: false

# In test we don't send emails.
config :elixir_discord, ElixirDiscord.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
