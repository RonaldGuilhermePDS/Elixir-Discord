defmodule ElixirDiscord.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      # Start the Telemetry supervisor
      ElixirDiscordWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirDiscord.PubSub},
      # Start the Endpoint (http/https)
      ElixirDiscordWeb.Endpoint,
      worker(Mongo, [[name: :mongo, url: "mongodb://localhost:27017/users", pool_size: 10]])
      # Start a worker by calling: ElixirDiscord.Worker.start_link(arg)
      # {ElixirDiscord.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirDiscord.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirDiscordWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
