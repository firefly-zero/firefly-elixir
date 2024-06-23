defmodule Mix.Tasks.Wasm do
  @moduledoc "Compile the given module to WebAssembly."
  use Mix.Task

  def run(args) do
    if Enum.empty?(args) do
      raise "module name must be provided"
    end

    mod = "Elixir." <> Enum.at(args, 0)
    mod |> String.to_atom() |> Orb.to_wat() |> IO.puts()
    # File.write("main.wasm", Orb.to_wasm(Firefly))
    # IO.puts("✅ saved to main.wasm")
  end
end
