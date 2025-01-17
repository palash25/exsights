defmodule Exsights.MixProject do
  use Mix.Project

  def project do
    [
      app: :exsights,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      escript: [main_module: Exsights],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Exsights.Application, []},
      applications: [:tentacat]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:tentacat, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:toml, "~> 0.6.1"}
    ]
  end
end
