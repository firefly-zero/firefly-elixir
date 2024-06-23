defmodule Firefly do
  use Orb

  defmacro __using__(_) do
    quote do
      import Firefly
      alias Firefly.Point
      alias Firefly.Style
      use Orb
      Orb.Import.register(Firefly.Bindings.Graphics)
    end
  end

  defmodule Point do
    defstruct [:x, :y]
  end

  defmodule Style do
    defstruct fill_color: 0, stroke_color: 0, stroke_width: 1
  end

  def draw_triangle(a = %Point{}, b = %Point{}, c = %Point{}, s = %Style{}) do
    Firefly.Bindings.Graphics.draw_triangle(
      a.x,
      a.y,
      b.x,
      b.y,
      c.x,
      c.y,
      s.fill_color,
      s.stroke_color,
      s.stroke_width
    )
  end
end
