defmodule FireflyTest do
  use ExUnit.Case
  doctest Firefly

  test "greets the world" do
    assert Firefly.hello() == :world
  end
end
