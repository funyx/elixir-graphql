defmodule Helpdesk.MixProject do
  use Mix.Project

  def project do
    [
      app: :helpdesk,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Helpdesk.Application, []}
    ]
  end

  defp deps do
    [
      {:elixir_sense, github: "elixir-lsp/elixir_sense", only: [:dev, :test]},
      {:ash, "~> 2.8.1"},
      {:ash_postgres, "~> 1.3.6"},
      {:ash_graphql, "~> 0.22.4"},
      {:ash_authentication, "~> 3.10.6"},
      {:absinthe_plug, "~> 1.5"},
      {:plug_cowboy, "~> 2.0"},
      {:phoenix_swagger, git: "https://github.com/xerions/phoenix_swagger", branch: "master"}
    ]
  end
end
