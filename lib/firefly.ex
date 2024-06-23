defmodule Firefly do
  use Orb

  defmacro __using__(_) do
    quote do
      import Firefly
      alias Firefly.Point
      use Orb
      Orb.Import.register(Firefly.Bindings.Graphics)
    end
  end

  defmodule Point do
    defstruct [:x, :y]
  end

  def draw_triangle(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}, %Point{x: x3, y: y3}) do
    Firefly.Bindings.Graphics.draw_triangle(x1, y1, x2, y2, x3, y3, 14, 9, 1)
  end
end
