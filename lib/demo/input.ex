defmodule Firefly.Demo.Input do
  use Firefly

  defw render(), pad: I32, style: I32 do
    _render()
  end

  def _render() do
    clear_screen(:white)
    pad = read_pad(0)
    style = %Style{fill_color: :black}
    draw_circle(%Point{x: pad.x, y: pad.y}, 40, style)
    nil
  end
end
