defmodule Firefly.Demo.Triangle do
  use Firefly

  defw boot() do
    Firefly.draw_triangle(
      %Point{x: 60, y: 10},
      %Point{x: 40, y: 40},
      %Point{x: 80, y: 40},
      %Style{fill_color: :light_gray, stroke_color: :dark_blue, stroke_width: 1}
    )
  end
end
