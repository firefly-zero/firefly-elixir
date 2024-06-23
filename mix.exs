defmodule Firefly.MixProject do
  use Mix.Project

  def project do
    [
      app: :firefly_elixir,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      description: "The official SDK for making Firefly Zero apps and games",
      package: package(),
      deps: deps(),
      name: "Firefly Elixir",
      source_url: "https://github.com/firefly-zero/firefly-elixir"
    ]
  end

  def application do
    []
  end

  defp package() do
    [
      name: "firefly_elixir",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/firefly-zero/firefly-elixir"}
    ]
  end

  defp deps do
    [
      {:orb, "~> 0.0.46"}
    ]
  end
end
