# firefly-elixir

The official SDK for writing apps and games for [Firefly Zero](https://fireflyzero.com/) in [Elixir](https://elixir-lang.org/) using [Orb](https://github.com/RoyalIcing/Orb).

> **Warning**
This SDK is highly experimental! The Orb project is in its early alpha testing stage and has a lot of rough edges and missed features. As a consequence, the SDK itself also doesn't implement some of the functions available in other SDKs.

## Usage

1. [Install Elixir](https://elixir-lang.org/install.html)
1. [Install wabt](https://github.com/WebAssembly/wabt/releases)
1. [Install firefly_cli](https://docs.fireflyzero.com/dev/getting-started/#-install-tools)
1. Create a new Elixir project: `mix new hello`
1. Add the SDK into `mix.exs`:

    ```elixir
    defp deps do
        [
        {:firefly_elixir, "~> 0.1.0"}
        ]
    end
    ```

1. Fetch dependencies: `mix deps.get`
1. Write some code:

    ```elixir
    defmodule Hello do

    use Firefly

    defw boot() do
        draw_triangle(
        %Point{x: 60, y: 10},
        %Point{x: 40, y: 40},
        %Point{x: 80, y: 40},
        %Style{fill_color: :light_gray, stroke_color: :dark_blue, stroke_width: 1}
        )
    end
    end
    ```

1. Create `firefly.toml`:

    ```toml
    author_id = "demo"
    app_id = "hello"
    author_name = "Demo"
    app_name = "Hello"

    [files]
    _bin = { path = "main.wasm", copy = true }
    ```

1. Build wat: `mix wasm Hello > main.wat`
1. Build wasm: `wat2wasm main.wat -o main.wasm`
1. Build the Firefly Zero app: `firefly_cli build`
