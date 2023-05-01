defmodule Helpdesk.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do

    port = String.to_integer(System.get_env("PORT") || "4000")

    children = [
      Helpdesk.Repo,
      {Plug.Cowboy,
       scheme: :http,
       plug: Helpdesk.Router,
       options: [port: port]},
       {AshAuthentication.Supervisor, otp_app: :my_app}
    ]

    opts = [strategy: :one_for_one, name: Helpdesk.Supervisor]

    Logger.info("Starting application, visit: http://localhost:#{port}")

    Supervisor.start_link(children, opts)
  end
end
