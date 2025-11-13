#  mix.exs -*- mode: Elixir -*-

defmodule Ex{{cookiecutter.proj_name}}.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_{{cookiecutter.proj_name}},
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      build_path: "../../.temp/elixir/build",
      config_path: "../../config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      test_paths: ["__tests"],

    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true}
    ]
  end
end
