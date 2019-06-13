defmodule PSSApis.MixProject do
  use Mix.Project

  def project do
    [
      app: :pss_apis,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PSSApis.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:sweet_xml, "~> 0.6.2"},
      {:cachex, "~> 3.0"},
      {:timex, "~> 3.1"}
    ]
  end
end
