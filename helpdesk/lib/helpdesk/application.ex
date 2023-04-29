defmodule Helpdesk.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Helpdesk.Worker.start_link(arg)
      # {Helpdesk.Worker, arg}
      Helpdesk.Repo,
      {Plug.Cowboy,
       scheme: :http,
       plug: Helpdesk.Router,
       options: [port: String.to_integer(System.get_env("PORT") || "4000")]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Helpdesk.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
