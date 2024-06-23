defmodule Firefly.Bindings do
  use Orb

  defmodule Graphics do
    use Orb.Import, name: :graphics

    defw(
      draw_triangle(
        p1_x: I32,
        p1_y: I32,
        p2_x: I32,
        p2_y: I32,
        p3_x: I32,
        p3_y: I32,
        fill_color: I32,
        stroke_color: I32,
        stroke_width: I32
      )
    )
  end
end