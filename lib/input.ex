defmodule Firefly.Input do
  use Orb

  defmodule Pad do
    defstruct [:x, :y]
  end

  def read_pad(player) do
    raw = Firefly.Bindings.Input.read_pad(player)

    # if raw == 0xFFFF do
    #   nil
    # else
    x = raw |> I32.shr_u(16) |> I32.band(0xFF)
    y = raw |> I32.band(0xFF)
    %Pad{x: x, y: y}
    # end
  end
end
