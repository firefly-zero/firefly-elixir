defmodule Firefly do
  use Orb

  defmacro __using__(_) do
    quote do
      import Firefly
      import Firefly.Graphics
      import Firefly.Misc
      alias Firefly.Graphics.Point
      alias Firefly.Graphics.Size
      alias Firefly.Graphics.LineStyle
      alias Firefly.Graphics.Style
      alias Firefly.Graphics.RGB
      alias Firefly.Graphics.Angle
      use Orb
      Orb.Import.register(Firefly.Bindings.Graphics)
      Orb.Import.register(Firefly.Bindings.Misc)
    end
  end
end
