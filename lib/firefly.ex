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
      parse_color(s.fill_color),
      parse_color(s.stroke_color),
      s.stroke_width
    )
  end

  defp parse_color(nil), do: 0
  defp parse_color(:none), do: 0
  defp parse_color(:black), do: 1
  defp parse_color(:purple), do: 2
  defp parse_color(:red), do: 3
  defp parse_color(:orange), do: 4
  defp parse_color(:yellow), do: 5
  defp parse_color(:light_green), do: 6
  defp parse_color(:green), do: 7
  defp parse_color(:dark_green), do: 8
  defp parse_color(:dark_blue), do: 9
  defp parse_color(:blue), do: 10
  defp parse_color(:light_blue), do: 11
  defp parse_color(:cyan), do: 12
  defp parse_color(:white), do: 13
  defp parse_color(:light_gray), do: 14
  defp parse_color(:gray), do: 15
  defp parse_color(:dark_gray), do: 16
  defp parse_color(x) when is_integer(x) and x <= 16 and x >= 0, do: x
end
