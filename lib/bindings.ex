defmodule Firefly.Bindings do
  use Orb

  defmodule Graphics do
    use Orb.Import, name: :graphics

    defw(clear_screen(color: I32))
    defw(set_color(index: I32, r: I32, g: I32, b: I32))
    defw(draw_point(x: I32, y: I32, color: I32))

    defw(
      draw_line(
        p1_x: I32,
        p1_y: I32,
        p2_x: I32,
        p2_y: I32,
        color: I32,
        stroke_width: I32
      )
    )

    defw(
      draw_rect(
        x: I32,
        y: I32,
        width: I32,
        height: I32,
        fill_color: I32,
        stroke_color: I32,
        stroke_width: I32
      )
    )

    defw(
      draw_rounded_rect(
        x: I32,
        y: I32,
        width: I32,
        height: I32,
        corner_width: I32,
        corner_height: I32,
        fill_color: I32,
        stroke_color: I32,
        stroke_width: I32
      )
    )

    defw(
      draw_circle(
        x: I32,
        y: I32,
        diameter: I32,
        fill_color: I32,
        stroke_color: I32,
        stroke_width: I32
      )
    )

    defw(
      draw_ellipse(
        x: I32,
        y: I32,
        width: I32,
        height: I32,
        fill_color: I32,
        stroke_color: I32,
        stroke_width: I32
      )
    )

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

    defw(
      draw_arc(
        x: I32,
        y: I32,
        diameter: I32,
        angle_start: F32,
        angle_sweep: F32,
        fill_color: I32,
        stroke_color: I32,
        stroke_width: I32
      )
    )

    defw(
      draw_sector(
        x: I32,
        y: I32,
        diameter: I32,
        angle_start: F32,
        angle_sweep: F32,
        fill_color: I32,
        stroke_color: I32,
        stroke_width: I32
      )
    )

    defw(
      draw_text(
        text_ptr: I32,
        text_len: I32,
        font_ptr: I32,
        font_len: I32,
        x: I32,
        y: I32,
        color: I32
      )
    )

    defw(
      draw_sub_image(
        ptr: I32,
        len: I32,
        x: I32,
        y: I32,
        sub_x: I32,
        sub_y: I32,
        sub_width: I32,
        sub_height: I32
      )
    )

    defw(draw_image(ptr: I32, len: I32, x: I32, y: I32))
  end
end
