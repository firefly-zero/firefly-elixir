defmodule Firefly do
  use Orb

  defmacro __using__(_) do
    quote do
      import Firefly
      alias Firefly.Point
      alias Firefly.Size
      alias Firefly.LineStyle
      alias Firefly.Style
      alias Firefly.RGB
      alias Firefly.Angle
      use Orb
      Orb.Import.register(Firefly.Bindings.Graphics)
      Orb.Import.register(Firefly.Bindings.Misc)
    end
  end

  defmodule Point do
    defstruct [:x, :y]
  end

  defmodule Size do
    defstruct [:w, :h]
  end

  defmodule Style do
    defstruct fill_color: 0, stroke_color: 0, stroke_width: 1
  end

  defmodule LineStyle do
    defstruct color: nil, width: 1
  end

  defmodule RGB do
    defstruct [:r, :g, :b]
  end

  defmodule Angle do
    defstruct [:r]

    def from_radians(r) when is_float(r), do: %Angle{r: r}
    def from_degrees(d) when is_float(d), do: %Angle{r: d * pi() / 180.0}
    def half_circle(), do: %Angle{r: pi()}
    def full_circle(), do: %Angle{r: 2.0 * pi()}
    def quarter_circle(), do: %Angle{r: pi() / 2.0}
    def zero(), do: %Angle{r: 0}
    defp pi(), do: 3.14159265358979323846264338327950288
  end

  def clear_screen(color) do
    color = parse_color(color)
    Firefly.Bindings.Graphics.clear_screen(color)
  end

  def set_color(index, rgb = %RGB{}) do
    index = parse_color(index)
    Firefly.Bindings.Graphics.set_color(index, rgb.r, rgb.g, rgb.b)
  end

  def draw_point(p = %Point{}, color) do
    color = parse_color(color)
    Firefly.Bindings.Graphics.draw_point(p.x, p.y, color)
  end

  def draw_line(a = %Point{}, b = %Point{}, s = %LineStyle{}) do
    color = parse_color(s.color)
    Firefly.Bindings.Graphics.draw_line(a.x, a.y, b.x, b.y, color, s.width)
  end

  def draw_rect(p = %Point{}, b = %Size{}, s = %Style{}) do
    Firefly.Bindings.Graphics.draw_rect(
      p.x,
      p.y,
      b.w,
      b.h,
      parse_color(s.fill_color),
      parse_color(s.stroke_color),
      s.stroke_width
    )
  end

  def draw_rounded_rect(p = %Point{}, b = %Size{}, corners = %Size{}, s = %Style{}) do
    Firefly.Bindings.Graphics.draw_rounded_rect(
      p.x,
      p.y,
      b.w,
      b.h,
      corners.w,
      corners.h,
      parse_color(s.fill_color),
      parse_color(s.stroke_color),
      s.stroke_width
    )
  end

  def draw_circle(p = %Point{}, diameter, s = %Style{}) when is_integer(diameter) do
    Firefly.Bindings.Graphics.draw_circle(
      p.x,
      p.y,
      diameter,
      parse_color(s.fill_color),
      parse_color(s.stroke_color),
      s.stroke_width
    )
  end

  def draw_ellipse(p = %Point{}, b = %Size{}, s = %Style{}) do
    Firefly.Bindings.Graphics.draw_ellipse(
      p.x,
      p.y,
      b.w,
      b.h,
      parse_color(s.fill_color),
      parse_color(s.stroke_color),
      s.stroke_width
    )
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

  def draw_arc(
        p = %Point{},
        diameter,
        angle_start = %Angle{},
        angle_sweep = %Angle{},
        s = %Style{}
      )
      when is_integer(diameter) do
    Firefly.Bindings.Graphics.draw_arc(
      p.x,
      p.y,
      diameter,
      angle_start.r,
      angle_sweep.r,
      parse_color(s.fill_color),
      parse_color(s.stroke_color),
      s.stroke_width
    )
  end

  def draw_sector(
        p = %Point{},
        diameter,
        angle_start = %Angle{},
        angle_sweep = %Angle{},
        s = %Style{}
      )
      when is_integer(diameter) do
    Firefly.Bindings.Graphics.draw_sector(
      p.x,
      p.y,
      diameter,
      angle_start.r,
      angle_sweep.r,
      parse_color(s.fill_color),
      parse_color(s.stroke_color),
      s.stroke_width
    )
  end

  def log_debug(s) do
    Firefly.Bindings.Misc.log_debug(
      Orb.Memory.Range.get_byte_offset(s),
      Orb.Memory.Range.get_byte_length(s)
    )
  end

  def log_error(s) do
    Firefly.Bindings.Misc.log_error(
      Orb.Memory.Range.get_byte_offset(s),
      Orb.Memory.Range.get_byte_length(s)
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
