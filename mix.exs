defmodule Firefly.MixProject do
  use Mix.Project

  def project do
    [
      app: :firefly,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:orb, git: "https://github.com/elixir-lang/gettext.git", rev: "cb0a94ea54dead5fbed387da5f52c3811ec5b667"}
      {:orb, "~> 0.0.46"}
    ]
  end
end
