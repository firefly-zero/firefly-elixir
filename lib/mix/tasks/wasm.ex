defmodule Mix.Tasks.Wasm do
  @moduledoc "The wasm mix task: `mix help wasm`"
  use Mix.Task

  @shortdoc "Compile the project to WebAssembly."
  def run(_) do
    Orb.to_wat(Firefly) |> IO.puts()
    # File.write("main.wasm", Orb.to_wasm(Firefly))
    # IO.puts("✅ saved to main.wasm")
  end
end
