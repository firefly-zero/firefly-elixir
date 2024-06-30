defmodule Firefly.Misc do
  use Orb

  def log_debug(s) do
    Firefly.Bindings.Misc.log_debug(
      Orb.Memory.Slice.get_byte_offset(s),
      Orb.Memory.Slice.get_byte_length(s)
    )
  end

  def log_error(s) do
    Firefly.Bindings.Misc.log_error(
      Orb.Memory.Slice.get_byte_offset(s),
      Orb.Memory.Slice.get_byte_length(s)
    )
  end
end
